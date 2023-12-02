<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Acumulados extends CI_Controller {

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
        $this->load->model('HistorialAcumulado');
        
    }


    public function listadoAcumulados()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {
                $vdata["acumulados"] = $this->Acumulado->findAllWithUserName();
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('acumulados/lista_acumulados', $vdata);

            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }

    public function listadoAcumuladosHistorial()
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {
                $vdata["acumulados"] = $this->HistorialAcumulado->findAllWithdrawalsWithUserName();
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('acumulados/historial_acumulados', $vdata);

            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }


    public function retirarAcumulado($id_acumulado = null)
    {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or $this->session->userdata('rol') == 'SuperVisor')
            {
                if($id_acumulado){
                    $datos_Acumulado = $this->Acumulado->find($id_acumulado);
                    $cantidad_acumulada_actual["quantity"] = 0;
                    $this->Acumulado->update($id_acumulado , $cantidad_acumulada_actual);
                    $data_historial_acumulado["id_accumulated"] = $id_acumulado;
                    $data_historial_acumulado["withdrawn_amount"] = $datos_Acumulado->quantity;
                    $data_historial_acumulado["id_user"] = $this->session->userdata('id_usuario');
                    $this->HistorialAcumulado->insert($data_historial_acumulado);
                    redirect(site_url('Acumulados/listadoAcumulados'));
                }
                redirect(site_url('Dashboard/dashboard'));
            }else{
                redirect(site_url('Dashboard/dashboard'));
            }
           
        } else {
            redirect(site_url('Dashboard/login'));
        }
    }
}
