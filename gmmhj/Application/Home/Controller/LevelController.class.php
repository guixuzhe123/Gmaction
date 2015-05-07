<?php

namespace Home\Controller;

use Think\Controller;

class LevelController extends BaseController {

    /**
     *  实时等级分布
     */
    public function index(){
        $emptymodel = M();
		$autoid = I('post.autoidinput');
		if(empty($autoid)){
			//$this->display();
			$autoid = 25;
		}
        $r = $this->levelinfo($autoid,1);
        $count = 0;
        foreach($r as $str){
            $count += $str['num'];
        }
        foreach($r as &$str1){
            $str1['per'] = $str1['num'] / $count;
            $str1['per'] = floor($str1['per'] * 10000) / 100;
        }
        $this->assign('level',$r);
        $this->assign('leveljs',json_encode($r));//把等级信息转化成json格式传给前端供JS使用
		$this->assign('selectid',$autoid);
      	vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $sid));
        $this->display();
    }

    /**
     *  历史等级分布
     */
    public function history(){
        $emptymodel = M();
        $autoid = I('post.autoidinput');
        if(empty($autoid)){
            //$this->display();
            $autoid = 25;
        }
        $r = $this->levelinfo($autoid,2);//第二个参数1为实时，2为历史
        $count = 0;
        foreach($r as $str){
            $count += $str['num'];
        }
        foreach($r as &$str1){
            $str1['per'] = $str1['num'] / $count;
            $str1['per'] = floor($str1['per'] * 10000) / 100;
        }
        $this->assign('level',$r);
        $this->assign('leveljs',json_encode($r));//把等级信息转化成json格式传给前端供JS使用
        $this->assign('selectid',$autoid);
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $sid));
        $this->display();
    }
    

    public function test(){
		$str = "啊厅顶替<font class='findkeyword'>1111哈</font>fontew哈";
		preg_match('/(.*)<font.*>(.*)<\/font>(.*)/',$str,$matched);
        var_dump($matched);
        echo "<hr/>";
        echo $matched[1] . $matched[2] . $matched[3];
    }

    public function levelinfo($autoid,$mark){
        $ser = D('Serverinfo');
        $res = $ser->where(array('autoid' => $autoid))->find();
		preg_match('/(.*)\/(.*)#utf8/',$res['gs_connection'],$matched);
        $gameserver = $matched[2];
        $emptymodel = new \Home\Model\GSEmptyModel($autoid);
        switch($mark){
            case 1:
                $r = $emptymodel->query("SELECT level,COUNT(level) AS num FROM `" . $gameserver . "`.character WHERE online=1 GROUP BY level");
                break;
            case 2:
                $r = $emptymodel->query("SELECT level,COUNT(level) AS num FROM `" . $gameserver . "`.character GROUP BY level");
                break;
            default:
                break;
        }
        //$r = $emptymodel->query("SELECT level,COUNT(level) AS num FROM `" . $gameserver . "`.character WHERE online=1 GROUP BY level");
        return $r;
    }



}
