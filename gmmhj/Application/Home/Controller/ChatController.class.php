<?php
namespace Home\Controller;
use Think\Controller;

class ChatController extends BaseController{
    public function index(){
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $sid));
        $this->assign('gmuser',cookie('gmuser'));
        $this->display();
    }

    public function regkey(){
        $input = I('post.');
        if(!empty($input)){
            $content = $input['keyword'];
            preg_match('/(.*)<font.*>(.*)<\/font>(.*)/',$content,$matched);
            if($matched.count() == 0){
                echo $content;
            }else{
                echo $matched[1] . $matched[2] . $matched[3];
            }
        }
    }
}
