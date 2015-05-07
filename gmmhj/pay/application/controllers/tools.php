<?php

class Tools extends CI_Controller{

	public function index(){
		$this->load->library('calendar');
		$data = array(
			8	=>	'http://www.3595.com'
		);
		echo $this->calendar->generate(2015,2,$data);
	}	
}


/*End of tools.php*/
