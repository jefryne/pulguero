<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class  Categoria extends CI_Model {

    Public $table = 'category';
    Public $table_id = 'id_category';

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

    public function topCategory(){
        $query = "SELECT c.category_name, COUNT(ii.id_item) AS total_sold
                  FROM item_invoice ii
                  INNER JOIN inventory inv ON ii.id_inventory = inv.id_inventory
                  INNER JOIN category c ON inv.id_category = c.id_category
                  GROUP BY c.category_name
                  ORDER BY total_sold DESC
                  LIMIT 3";
        return $this->db->query($query)->result_array();
    }

}
