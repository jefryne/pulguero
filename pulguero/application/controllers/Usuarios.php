<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	Public function __construct(){
        parent::__construct();
        $this->load->helper('form');
		$this->load->helper('url');
        $this->load->database();
		$this->load->model('Usuario');
        $this->load->library('session');
        $this->load->model('Cuenta');
        $this->load->model('Acumulado');
    }

	public function listadoUsuarios($user_estado = null)
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin'){
                if($user_estado == null){
                    $vdata["usuarios"] = $this->Usuario->findAll();
                }elseif ($user_estado == 1) {
                    $vdata["usuarios"] = $this->Usuario->obtenerUsuariosActivos();    
                }elseif ($user_estado == 0) {
                    $vdata["usuarios"] = $this->Usuario->obtenerUsuariosInactivos(); 
                }
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('usuario/listadoUsuarios', $vdata);
            }elseif($this->session->userdata('rol') == 'SuperVisor'){
                
                if($user_estado == null){
                    $vdata["usuarios"] = $this->Usuario->usuariosCliente();
                }elseif ($user_estado == 1) {
                    $vdata["usuarios"] = $this->Usuario->obtenerUsuariosClientesActivos();    
                }elseif ($user_estado == 0) {
                    $vdata["usuarios"] = $this->Usuario->obtenerUsuariosClientesInactivos(); 
                }
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('usuario/listadoUsuarios', $vdata);
            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }



	public function register($id_usuario = null){
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin'){
                $vdata["estado"] = $vdata["rol"] = $vdata["documento"] = $vdata["nombre"] = $vdata["apellido"] = $vdata["correoElectrónico"] = $vdata["numeroTelefono"] = "";

                if(isset($id_usuario)){
                    $usuario = $this->Usuario->find($id_usuario);
        
        
                    if(isset($usuario)){
                        $vdata["documento"] = $usuario->document_number;
                        $vdata["nombre"] = $usuario->user_name;
                        $vdata["apellido"] = $usuario->user_last_name;
                        $vdata["correoElectrónico"] = $usuario->email;
                        $vdata["rol"] = $usuario->rol;
                        $vdata["estado"] = $usuario->status_user;
                        $vdata["numeroTelefono"] = $usuario->cellphone;
                    }
        
                }
                
                if($this->input->server("REQUEST_METHOD")=="POST"){
                    $data["document_number"] = $this->input->post("documento");
                    $data["user_name"] = $this->input->post("nombre");
                    $data["email"] = $this->input->post("correoElectrónico");
                    $data["user_last_name"] = $this->input->post("apellido");
                    $data["rol"] = $this->input->post("rol");
                    $data["cellphone"] = $this->input->post("numeroTelefono");
                    
                    if(empty($data["document_number"]) || empty($data["user_name"]) || empty($data["email"]) || empty($data["user_last_name"]) || empty($data["rol"]) || empty($data["cellphone"])){
                        redirect(site_url('Usuarios/register?error=empty_fields'));
                    }
         
                    if($this->Usuario->verificar_correo($data["email"])){
                        redirect(site_url('Usuarios/register?error=email_exist'));
                    }
        
                    if(isset($id_usuario)){
                        $this->Usuario->update($id_usuario, $data);  
                    }else{
                        $id_usuario_insert = $this->Usuario->insert($data); 
                        if($data["rol"] == "Vendedor"){
                            $data_accumulated["id_user"] = $id_usuario_insert;
                            $data_accumulated["quantity"] =  0;
                            $this->Acumulado->insert($data_accumulated);
                        } 
                        redirect(site_url('Usuarios/listadoUsuarios?success=true'));
                    }
                    $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                    $vdata["rol_usuario"] = $this->session->userdata('rol');
                    $this->load->view('usuario/registrar_actualizar', $vdata);
                    return;
                }
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('usuario/registrar_actualizar' , $vdata);
                
            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }


	public function verUsuario($usuario_id = null) {
        $usuario = $this->Usuario->find($usuario_id);

        if(isset($usuario)){
            $vdata["nombre"] = $usuario->nombre;
            $vdata["password"] = $usuario->password;
			$vdata["correo"] = $usuario->correo;
            $vdata["nombre_usuario"] = $this->session->userdata('nombres');
            $vdata["rol_usuario"] = $this->session->userdata('rol');

        }else{
            $vdata["nombre"] = $vdata["password"] =  $vdata["correo"] = "";
        }

        $this->load->view('usuario/registrar_actualizar', $vdata);
    }

    public function crear_cuenta(){
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin'){
                if($this->input->server("REQUEST_METHOD")=="POST"){
                    $data["id_user"] = $this->input->post("id_user");
                    $data["password"] = password_hash($this->input->post("password"), PASSWORD_BCRYPT);
             
                    if(isset($data["id_user"]) && isset($data["password"])){
                        $this->Cuenta->insert($data);  
                        redirect(site_url('Dashboard/login'));
                        return;
                    }
                }else{
                    $vdata["usuarios"] = $this->Usuario->usuariosEmpresa();
                    $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                    $vdata["rol_usuario"] = $this->session->userdata('rol');
                    $this->load->view('Dashboard/crear_cuenta' , $vdata);
                }
            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }



    public function borrar($usuario_id = null)
    {   
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin'){
                $this->Usuario->borrar($usuario_id);

                redirect('Usuarios/listadoUsuarios');
            }else{
                redirect('Dashboard/dashboard');
            }
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }


}
