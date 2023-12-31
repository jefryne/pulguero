<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class  Inventario extends CI_Model {

    Public $table = 'inventory';
    Public $table_id = 'id_inventory';

    Public function __construct(){
        parent::__construct();
        $this->load->helper('form');
        $this->load->database();
    }

    public function insert($data){
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }

    public function findAll(){
        $this->db->select();
        $this->db->from($this->table);

        $query = $this->db->get();
        return $query->result();
    }

    public function obtenerDatosInventario(){
        $this->db->select('i.id_inventory, u.user_name AS nombre_usuario, c.category_name AS nombre_categoria, i.price, i.status_inventory, i.id_user, i.name');
        $this->db->from('inventory i');
        $this->db->join('users u', 'i.id_user = u.id_user');
        $this->db->join('category c', 'i.id_category = c.id_category');
        $this->db->where('i.status_inventory', 1); // Filtro por estado igual a 1
        $this->db->order_by('i.id_inventory', 'ASC');
        $query = $this->db->get();
        return $query->result();
    }
    


    public function find($id){
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where($this->table_id, $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function update($id, $data){
        $this->db->where($this->table_id, $id);
        $this->db->update($this->table, $data);
    }
}
