<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->library('session');
        $this->load->model('Usuario');
        $this->load->model('Cuenta');
    }


    public function dashboard() {
        if ($this->session->userdata('id_usuario')) {
            $data["nombre_usuario"] = $this->session->userdata('nombres');
            $data["rol_usuario"] = $this->session->userdata('rol');
            $this->load->view('Dashboard/dashboard', $data);
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }

    public function login() {
        $data["mensaje"] = "";
        $data["correo"] = "";
        if ($this->input->server("REQUEST_METHOD") == "POST") {
            $correo = $this->input->post("correo");
            $password = $this->input->post("password");
            
            // Validar que se ingresen todos los datos
            if(empty($correo) || empty($password)){
                $data["mensaje"] = "Debe ingresar todos los datos";
                $this->load->view('usuario/login_pulguero', $data);
                return;
            }
            // Obtén información del usuario por correo
            echo "<script>console.log('Debug Objects: " . $correo . " " . $password . "' );</script>";
            $data["correo"] = $correo;
            $info_usuario = $this->Usuario->verificar_correo($correo);
            if(!$info_usuario){
                $data["mensaje"] = "Correo electronico incorrecto";
                $this->load->view('usuario/login_pulguero', $data);
                return;
            }
            $info_cuenta = $this->Cuenta->verificar_contrasena($info_usuario->id_user);
            
            if (password_verify($password, $info_cuenta->password)) {
                // Contraseña válida, configura la sesión
                $sesion_data = array(
                    'id_usuario' => $info_usuario->id_user,
                    'documento' => $info_usuario->document_number,
                    'nombres' => $info_usuario->user_name,
                    'apellidos' => $info_usuario->user_last_name,
                    'correo' => $info_usuario->email,
                    'rol' => $info_usuario->rol,
                    'estado' => $info_usuario->status_user,
                    'telefono' => $info_usuario->cellphone
                );

                $this->session->set_userdata($sesion_data);

                // Redirige al dashboard
                redirect(site_url('Dashboard/dashboard'));
            }else{
                $data["mensaje"] = "Contraseña incorrecta";
            }
        }
        $this->load->view('usuario/login_pulguero', $data);
    }
     

    public function plantilla($usuario_id = null) {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin'){
                
        
            }else{
                redirect(site_url('Dashboard/data'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
       
    }

    public function ver($usuario_id = null) {
        if($this->session->userdata('rol') == 'Admin'){
            $usuario = $this->Usuario->find($usuario_id);
            if ($usuario) {
                $vdata["id_usuario"] = $usuario->id_usuario;
                $vdata["nombre"] = $usuario->nombre;
                $vdata["password"] = $usuario->password;
                $vdata["correo"] = $usuario->correo;
            } else {
                $vdata["usuario_id"] = $vdata["nombre"] = $vdata["password"] = $vdata["correo"] = "";
            }
            $this->load->view('Dashboard/verUser', $vdata);
        }else{
            redirect('Dashboard/data');
        }
    }

    public function data() {
        if ($this->session->userdata('id_usuario')) {
            $vdata["usuarios"] = $this->Usuario->findAll();
            $this->load->view('Dashboard/data', $vdata);
        } else {
            redirect(site_url('Dashboard/plantilla'));
        }
    }


    public function logout() {
        $this->session->sess_destroy();
        redirect(site_url('Dashboard/login'), 'refresh');
    }


    public function getCategory() {
        $this->load->model('Categoria');

        $topCategory = $this->Categoria->topCategory();

        header('Content-Type: application/json');
        echo json_encode($topCategory);
    }

    public function getAAnnualSales(){
        $this->load->model('dash_chart');

        $globalAnnualSales = $this->dash_chart->globalAnnualSales();

        header('Content-Type: application/json');
        echo json_encode($globalAnnualSales);
    }


    public function getDayliSales(){
        $this->load->model('dash_chart');

        $globalWeekSales = $this->dash_chart->globalWeekSales();

        header('Content-Type: application/json');
        echo json_encode($globalWeekSales);
    }
}
