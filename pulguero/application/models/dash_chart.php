<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dash_chart extends CI_Model {

    Public $table = 'invoice';
    Public $table_id = 'id_invoice';

    Public function __construct(){
        parent::__construct();
        $this->load->helper('form');
        $this->load->database();
    }

    public function globalAnnualSales(){
        $query = "SELECT 
                    months.Month AS Mes,
                    COALESCE(SUM(invoice.total), 0) AS Ventas
                FROM (
                    SELECT 1 AS Month
                    UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
                    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11
                    UNION SELECT 12
                ) AS months
                LEFT JOIN invoice ON MONTH(invoice.date) = months.Month AND YEAR(invoice.date) = YEAR(CURDATE())
                GROUP BY months.Month";
        return $this->db->query($query)->result_array();
    }


    public function globalWeekSales(){
        $query = "SELECT 
                    DATE_FORMAT(days.Date, '%Y-%m-%d') AS Dia,
                    COALESCE(SUM(invoice.total), 0) AS Ventas
                FROM (
                    SELECT CURDATE() - INTERVAL (tens.a + units.a) DAY AS Date
                    FROM
                        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS units,
                        (SELECT 0 AS a UNION ALL SELECT 10 UNION ALL SELECT 20 UNION ALL SELECT 30) AS tens
                    WHERE 
                        DAYOFWEEK(CURDATE() - INTERVAL (tens.a + units.a) DAY) BETWEEN 1 AND 7
                    ORDER BY Date DESC
                    LIMIT 7 -- Última semana
                ) AS days
                LEFT JOIN invoice ON DATE(invoice.date) = days.Date
                GROUP BY days.Date
                ";
        return $this->db->query($query)->result_array();   
    }
}
?>