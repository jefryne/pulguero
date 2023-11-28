<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Items extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->database();
        $this->load->model('Usuario');
        $this->load->library('session');
        $this->load->helper('url');
        $this->load->library('form_validation');
        $this->load->model('Cuenta');
        $this->load->model('Acumulado');
        $this->load->model('Factura');
        $this->load->model('Historial');
        $this->load->model('Item');
        $this->load->model('Inventario');
    }

    public function crearFactura() {
        if ($this->session->userdata('id_usuario')) {
            if($this->session->userdata('rol') == 'Admin' or  $this->session->userdata('rol') == 'SuperVisor'){
                $productos_json = $this->input->post('productos');
                $productos_array = json_decode($productos_json, true);
            
                if (is_array($productos_array)) {
                    $total = 0; // Variable para almacenar el total inicializada en 0
            
                    // Iterar sobre cada producto en el array
                    foreach ($productos_array as $producto) {
                        // Verificar si el producto es un array y contiene los datos esperados
                        if (is_array($producto) && isset($producto['precio'])) {
                            // Acceder a los datos del producto
                            echo "ID Inventario: " . $producto['id_inventario'] . "<br>";
                            echo "Nombre Artículo: " . $producto['nombre_articulo'] . "<br>";
                            echo "Precio: " . $producto['precio'] . "<br>";
            
                            // Sumar el precio al total
                            $total += floatval($producto['precio']);
                        } else {
                            // Manejar el error si los datos del producto no son válidos
                            echo "Error: Los datos del producto no son válidos.";
                        }
                    }
            
                    // Insertar factura en la base de datos con el total
                    $data["total"] = $total;
                    $id_factura = $this->Factura->insert($data);
            
                    // Insertar ítems asociados a la factura en la base de datos
                    foreach ($productos_array as $producto) {
                        if (is_array($producto) && isset($producto['id_inventario'])) {
                            $data_item["id_inventory"] = $producto['id_inventario'];
                            $data_item["id_invoice"] = $id_factura;
                            $this->Item->insert($data_item);
                            $registro_inventario  = $this->Inventario->find($data_item["id_inventory"]);
                            $estado["status_inventory"] = 0;
                            $this->Inventario->update($data_item["id_inventory"], $estado);
                            $pocentaje = $registro_inventario->price * 0.1;
                            $accumulated_info = $this->Acumulado->findUser($registro_inventario->id_user);
    
                            $id_accumulated = $accumulated_info->id_accumulated;
                            $cantidad_acumulada = $accumulated_info->quantity;
    
                            $cantidad_acumulada_actual["quantity"] =  ($pocentaje+$cantidad_acumulada);
                            $this->Acumulado->update($id_accumulated , $cantidad_acumulada_actual);
                       

                        } else {
                            echo "Error: Los datos del ítem no son válidos.";
                        }
                    }
                    $data_historial["id_user"]= $this->session->userdata('id_usuario');
                    $data_historial["id_invoice"]= $id_factura;
                    $this->Historial->insert($data_historial);
                    $this->session->set_userdata('id_factura', $id_factura);
                    redirect('Facturas/verFactura');
                } else {
                    echo "Error: Los datos de productos no son válidos.";
                }
          
            }
        }

    }
    

}
?>
