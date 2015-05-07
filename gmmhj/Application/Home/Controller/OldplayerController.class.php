<?php
namespace Home\Controller;
use Think\Controller;
class OldplayerController extends Controller{

	public function index(){
		$oldplayer = D('Oldplayer');
		$infos = $oldplayer->select();
		foreach($infos as &$info){
			$info['date'] = date("m月d日",$info['date']);
		}
		$this->assign("jsonstring",json_encode($infos));
		$this->display();
	}

}
