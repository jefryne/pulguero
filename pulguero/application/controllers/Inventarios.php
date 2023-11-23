<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inventarios extends CI_Controller {

	Public function __construct(){
        parent::__construct();
        $this->load->helper('form');
		$this->load->helper('url');
        $this->load->database();
		$this->load->model('Categoria');
        $this->load->model('Inventario');
        $this->load->model('Usuario');
        $this->load->library('session');
        $this->load->model('Cuenta');
    }

	public function inventario()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor'){
                $vdata["usuarios"] = $this->Usuario->usuariosCliente();
                $vdata["categorias"] = $this->Categoria->findAll();
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('inventario/inventario', $vdata);
                if ($this->input->server("REQUEST_METHOD") == "POST") {
                    $data["id_user"] = $this->input->post("id_user");
                    $data["id_category"] = $this->input->post("id_category");
                    $data["cost"] = $this->input->post("cost");
                    $data["name"] = $this->input->post("name");
                    $data["description"] = $this->input->post("description");
                    $data["price"] = $this->input->post("price");
                    $this->Inventario->insert($data);
                    redirect(site_url('Inventarios/listadoInventario'));
                }
            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }


    public function crearCategoria()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {

                if ($this->input->server("REQUEST_METHOD") == "POST") {
                    $data["category_name"] = $this->input->post("category_name");
                    $this->Categoria->insert($data);  
                    redirect(site_url('Inventarios/inventario'));
                }
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('inventario/crear_categoria',$vdata);

            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }


    public function listadoInventario()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {
                $vdata["inventarios"] = $this->Inventario->obtenerDatosInventario();
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('inventario/lista_inventario', $vdata);

            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }

}
