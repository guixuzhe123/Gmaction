<?php
namespace Home\Controller;
use Think\Controller;
class PlatadminController extends BaseController{

	

	public function index(){

		$plat = D('Plat');
		$count = $plat->count();
		$Page = new \Think\Page($count,10);
		$show = $Page->show();
		$r = $plat->limit($Page->firstRow . ',' . $Page->listRows)->select();
		$this->assign('plat',$r);
		$this->assign('page',$show);
		$this->display();
	}

	public function ajaxadd(){
		$data = I('post.');
		$plat = D('Plat');
		$data['id'] = null;
		$r = $plat->data($data)->add();
		if($r){
			$this->log('添加id为' . $data['platid'] . '平台',cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}

	public function ajaxupdate(){
		$data = I('post.');
		$plat = D('Plat');
		if($plat->save($data)){
			$this->log('更新id为' . $data['platid'] . '平台',cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}

	public function ajaxdel(){
		$id = I('post.id');
		$plat = D('Plat');
		if($plat->where(array('id' => $id))->delete()){
			$this->log('删除id为' . $id . '平台',cookie('gmuser'));
			echo 1;
		}else{
			echo 0;
		}
	}

	

}