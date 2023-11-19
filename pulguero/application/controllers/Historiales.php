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
    }

    public function historial($id_history = null){
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin'){
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

}
