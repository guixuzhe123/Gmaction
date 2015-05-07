<?php

namespace Home\Controller;

use Think\Controller;

//存量查询

class StockController extends BaseController{
	public function index(){
        $input = I('post.');
        $stock = D('Stock');
        if(empty($input)){
            $datas = $stock->select();
        }else{
            $where = array(
                'autoid'    =>  $input['autoid']
            );
            $datas = $stock->where($where)->select();
        }
        foreach($datas as &$data){
            $data['autoid'] = $this->getsid($data['autoid']) . '服';
        }
        vendor('Pager.Pager');
        $this->assign('datas',$datas);
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid)); 
        $this->display();
	}
}
