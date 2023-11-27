<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Facturas extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->database();
        $this->load->model('Usuario');
        $this->load->library('session');
        $this->load->model('Cuenta');
        $this->load->model('Acumulado');
        $this->load->model('Factura');
        $this->load->model('Inventario');
        $this->load->model('Item');
    }



    public function verFactura() {
        if ($this->session->userdata('id_usuario')) {
            if ($this->session->userdata('rol') == 'Admin' || $this->session->userdata('rol') == 'SuperVisor') {
                $invoice_id = $this->session->userdata('id_factura');

                $vdata["vdata"] = $this->Factura->find($invoice_id);
                $vdata["items_factura"] = $this->Item->findByInvoice($invoice_id); 
            
                foreach ($vdata["items_factura"] as $key => $item) {
                    // Obtener los datos del inventario para cada ítem de la factura
                    $inventory_data = $this->Inventario->find($item->id_inventory);
                    // Agregar los datos del inventario al elemento de la factura
                    $vdata["items_factura"][$key]->inventory = $inventory_data;
                }
                $vdata["nombre_usuario"] = $this->session->userdata('nombres');
                $vdata["rol_usuario"] = $this->session->userdata('rol');
                $this->load->view('factura/verFactura', $vdata);
            }
        }
    }


    public function generarTiket(){
        if($this->session->userdata('id_usuario')){
            if($this->session->userdata('rol') == 'Admin' || $this->session->userdata('rol') == 'SuperVisor'){
                $invoice_id = $this->session->userdata('id_factura');
                $vdata["vdata"] = $this->Factura->find($invoice_id);
                $vdata["items_factura"] = $this->Item->findByInvoice($invoice_id); 
                foreach ($vdata["items_factura"] as $key => $item) {
                    // Obtener los datos del inventario para cada ítem de la factura
                    $inventory_data = $this->Inventario->find($item->id_inventory);
                    // Agregar los datos del inventario al elemento de la factura
                    $vdata["items_factura"][$key]->inventory = $inventory_data;
                }
                $vdata["nombre_verdedo"] = $this->session->userdata('nombres');
                $this->load->view('factura/ticket', $vdata);
            }
        }
        //$this->load->view('factura/ticket');
    }
}
?>