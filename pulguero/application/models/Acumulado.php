<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class  Acumulado extends CI_Model {

    Public $table = 'accumulated';
    Public $table_id = 'id_accumulated';

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
    public function findAllWithUserName(){
        $this->db->select('accumulated.*, users.user_name');
        $this->db->from('accumulated');
        $this->db->join('users', 'users.id_user = accumulated.id_user');
    
        $query = $this->db->get();
        return $query->result();
    }

    public function update($id, $data){
        $this->db->where($this->table_id, $id);
        $this->db->update($this->table, $data);
    }


    public function find($id){
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where($this->table_id, $id);

        $query = $this->db->get();
        return $query->row();
    }

    public function findUser($id_user)
    {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where('id_user', $id_user);

        $query = $this->db->get();
        return $query->row();
    }

}
