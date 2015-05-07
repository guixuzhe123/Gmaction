<?php

namespace Home\Controller;

use Think\Controller;

//日志系统

class LogController extends BaseController{
	public function index(){
		$admin = D('Admin');
		$log = D('Log');
		$operatorlist = $admin->select();
		$loglist = $log->select();
		$count = $log->count();
		$Page = new \Think\Page($count,30);
		$show = $Page->show();
		$datas = $log->limit($Page->firstRow . ',' . $Page->listRows)->order('time desc')->select();
		$this->assign('logs',$datas);
		$this->assign('page',$show);
		$this->assign('operatorlist',$operatorlist);
		$this->display();
	}
	public function selectoperator(){
		$admin = D('Admin');
		$operatorlist = $admin->select();
		$log = D('Log');
		$count = $log->where(array('operator' => I('get.user')))->count();
		$Page = new \Think\Page($count,30);
		$show = $Page->show();
		$datas = $log->where(array('operator' => I('get.user')))->limit($Page->firstRow . ',' . $Page->listRows)->order('time desc')->select();
		$this->assign('logs',$datas);
		$this->assign('page',$show);
		$this->assign('selectid',$this->getadminid(I('get.user')));
		$this->assign('operatorlist',$operatorlist);
		$this->display('index');
	}
}