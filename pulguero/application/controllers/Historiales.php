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



    public function listadoHistorial()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {
                $vdata["historiales"] = $this->Historial->findAllWithUserName();
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
