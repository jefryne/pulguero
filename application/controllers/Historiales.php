<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Historiales extends CI_Controller {

	Public function __construct(){
        parent::__construct();
        $this->load->helper('form');
		$this->load->helper('url');
        $this->load->database();
		$this->load->model('Categoria');
        $this->load->model('Inventario');
        $this->load->model('Usuario');
        $this->load->model('Historial');
        $this->load->library('session');
        $this->load->model('Cuenta');
        $this->load->model('Acumulado');
        
    }

    public function historial($id_history = null){
        $vdata["nombre_usuario"] = $this->session->userdata('nombres');
        $vdata["rol_usuario"] = $this->session->userdata('rol');
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or  $this->session->userdata('rol') == 'SuperVisor'){
                $vdata["resgistros_inventario"] = $this->Inventario->findAll();
                $vdata["usuarios"] = $this->Usuario->usuariosEmpresa();
                $vdata["usuarios_cliente"] = $this->Usuario->usuariosCliente();

                if($this->input->server("REQUEST_METHOD")=="POST"){
                    $data["id_inventory"] = $this->input->post("id_inventory");
                    $data["id_user"] = $this->input->post("id_user");
                    $data["id_client"] = $this->input->post("id_client");
                    $data["transaction_status"] = $this->input->post("transaction_status");
                    
        
                    $vdata["id_inventory"] = $this->input->post("id_inventory");
                    $vdata["id_user"] = $this->input->post("id_user");
                    $vdata["id_client"] = $this->input->post("id_client");
                    $vdata["transaction_status"] = $this->input->post("transaction_status");
        
                    if(isset($id_history)){
                        $this->Historial->update($id_history, $data);  
                        redirect(site_url('Usuarios/listadoUsuarios'));
                    }else{
                        $this->Historial->insert($data);  

                        $registro_inventario  = $this->Inventario->find($data["id_inventory"]);
                        $pocentaje = $registro_inventario->price * 0.1;
                        $accumulated_info = $this->Acumulado->find($registro_inventario->id_user);

                        $id_accumulated = $accumulated_info->id_accumulated;
                        $cantidad_acumulada = $accumulated_info->quantity;

                        $cantidad_acumulada_actual["quantity"] =  ($pocentaje+$cantidad_acumulada);
                        $this->Acumulado->update($id_accumulated , $cantidad_acumulada_actual);
                        redirect(site_url('Usuarios/listadoUsuarios'));
                    }
                    $this->load->view('historial/crear_historial', $vdata);
                    return;
                }
             
                $this->load->view('historial/crear_historial' , $vdata);
                
            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }


    public function listadoHistorial()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {
                $vdata["historiales"] = $this->Historial->findAll();
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('historial/lista_historial', $vdata);

            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }
}
