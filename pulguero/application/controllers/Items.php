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
        $this->load->model('Cuenta');
        $this->load->model('Acumulado');
        $this->load->model('Factura');
        $this->load->model('Item');
    }

    public function crearFactura() {
        $productos = $this->input->post('productos');

        if(isset($productos)){
            $total = 0;

            // Recorriendo los productos para calcular el total y realizar operaciones necesarias
            foreach ($productos as $key => $producto) {
                // Asumiendo que 'precio' es un campo numérico en los productos
                $total += $producto['precio'];
                // Aquí puedes realizar otras operaciones o guardar en la base de datos
                // Ejemplo: $this->Item->insert($producto);
            }

            // Ejemplo: Guardar el total en la tabla de facturas
            $data["total"] = $total;
            $this->Factura->insert($data); 
        }
        
        // Puedes enviar respuestas al frontend si es necesario
        // Por ejemplo, para enviar un mensaje de éxito:
        // echo json_encode(['success' => true, 'message' => 'Factura creada correctamente']);
        // Y en caso de errores:
        // echo json_encode(['error' => 'Ocurrió un error al crear la factura']);
    }
}
?>
