<?php
class News_model extends CI_Model{

	public function __construct()
	{
		$this->load->database();
	}

	public function get_news($status = 1)
	{
		if($slug === 1)
		{
			$query = $this->db->get('paylog');
			return $query->result_array();	
		}

		$query = $this->db->get_where('status',array('status' => $status);
		return $query->row_array();
	}

}
