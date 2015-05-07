<?php

namespace Home\Controller;

use Think\Controller;

/*
 * 消耗：元宝,银币，礼金
 */

class CostController extends BaseController {
    
	private $actionTypes = array(
		0		=>	'不明来路',
		1		=>	'道具使用',
		2		=>	'剧情任务',
		3		=>	'日常任务',
		4		=>	'帮派任务',
		5		=>	'机缘任务',
		6		=>	'坐骑养成消耗',
		7		=>	'羽翼养成消耗',
		8		=>	'神兵养成消耗',
		9		=>	'神弓养成消耗',
		10		=>	'强化装备养成消耗',
		11		=>	'同门论道',
		12		=>	'法宝洗炼消耗',
		13		=>	'创建帮派消耗',
		14		=>	'基础技能升级',
		15		=>	'神通技术升级',
		16		=>	'激活码使用',
		17		=>	'宗族捐献消耗',
		18		=>	'退出帮派消耗',
		19		=>	'死亡复活消耗',
		20		=>	'商城',
		21		=>	'重置女娲神石副本次数',
		22		=>	'仙缘大会挑战',
		23		=>	'仙缘大会增加挑战次数',
		24		=>	'仙缘大会清零冷却时间',
		25		=>	'',
		26		=>	'仙缘大会整点奖励',
		27		=>	'仙缘大会排行榜奖励',
		28		=>	'',
		29		=>	'法宝心法技能',
		30		=>	'离线经验获得',
		31		=>	'离线经验消耗',
		32		=>	'宗门争霸奖励',
		33		=>	'宗门争霸胜负奖励',
		34		=>	'宗门争霸参与奖励',
		35		=>	'大夏王都争夺官职奖励',
		36		=>	'大夏王都争夺胜负奖励',
		37		=>	'大夏王都争夺参与奖励',
		38		=>	'宗门争霸活动击杀',
		39		=>	'大夏王都活动击杀',
		40		=>	'充值送好礼',
		41		=>	'护送美女奖励',
		42		=>	'刷新护送美女品质',
		43		=>	'跨服竞技1v1',
		44		=>	'跨服竞技2v2',
		45		=>	'跨服竞技排行奖励',
		46		=>	'首充奖励',
		47		=>	'心魔道劫（火麟洞）',
		48		=>	'资源找回元宝消耗',
		49		=>	'排行榜崇拜奖励',
		50		=>	'演武大殿',
		51		=>	'10v10战场',
		52		=>	'宗族副本',
		53		=>	'女娲图升级',
		54		=>	'境界突破副本',
		55		=>	'境界系统',
		56		=>	'冰火淬体',
		57		=>	'多人组队副本',
		58		=>	'升级装备',
		59		=>	'邮件',
		60		=>	'天宝阁投资',
		61		=>	'灵兽养成消耗',
		62		=>	'第二元神养成消耗',
		63		=>	'披风养成消耗',
		64		=>	'多人组队副本兑换',
		65		=>	'神魔盾养成消耗',
		66		=>	'开服特惠礼包活动',
		67		=>	'经验百分比道具',
		68		=>	'摘星府-主殿',
		69		=>	'新手 礼包',
		70		=>	'拯救木子朔活动',
		71		=>	'完成微端任务',
        72      =>  '多倍转盘',
		74		=>	'VIP超值大回馈',
		83		=>	'天道商品',
		84		=>	'每日活跃大礼礼盒',
		85		=>	'节日活动-特惠礼包',
		1002	=>	'答题系统',
		1003	=>	'特惠礼包',
		1004	=>	'角色技能',
		1005	=>	'珍宝殿',
		1006	=>	'宗族技能',
		1007	=>	'新手任务流程',
		1008	=>	'充值',
		1009	=>	'GM命令',
		1010	=>	'场景模块',
		1011	=>	'副本临时背包',
		1012	=>	'绝境探险',
		1013	=>	'女娲神石元宝扫荡',
		1014	=>	'战神殿',
		1015	=>	'单人副本',
		1016	=>	'背包格开启',
		1017	=>	'礼包道具',
		1018	=>	'交易',
		1019	=>	'摊位',
		1020	=>	'回购',
		1021	=>	'神主天藏',
        1024    =>  '天道任务兑换',
        1025    =>  '界域大战元宝复活'
	);

    /**
     * 礼金查询
     */
    public function gift() {
        $useORgets = array(0 => '获得', 1 => '消耗');
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $autoid = 25;
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
            }else{
                $autoid = I('post.autoid');
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
            }
            $characterid = I('post.characterid');
            $account = I('post.account');
            $type = I('post.type');
            $where = array();
            if (empty($start_date)) {
                $start_date = date("Y-m-d");
            }
            if (empty($end_date)) {
                $end_date = date("Y-m-d");
            }
            $where['time'] = array('between', array($start_date, $end_date . " 23:59:59"));
            if (!empty($characterid)) {
                $where['characterid'] = $characterid;
            }
            if (!empty($account)) {
                $where['account'] = $account;
            }
            
            if($type != '-1') {
                $where['useORget'] = $type;
            }

            $datas = array();
            if (empty($account) && empty($characterid)) {
                $db = new \Home\Model\OAEMoney2Model($autoid);
                $datas = $db->field('sum(amount1) as amount1,sum(amount2) as amount2,count(autoid) as action_num,useORget,actionType')->where($where)->group("useORget,actionType")->select();
                $total0 = $total1 = 0;
                if (!empty($datas)) {
                    foreach ($datas as &$data) {
                        $data['num'] = abs($data['amount1'] - $data['amount2']);
                        if ($data['useORget'] == 0) {
                            $total0 += $data['num'];
                        } else {
                            $total1 += $data['num'];
                        }
                        $data['useORget_label'] = $useORgets[$data['useORget']];
                        $data['actionType_label'] = $this->actionTypes[$data['actionType']];
                    }
                }

                foreach ($datas as &$data) {
                    if ($data['useORget'] == 0) {
                        $data['rate'] = sprintf("%.2f", $data['num'] / $total0 * 100) . "%";
                    } else {
                        $data['rate'] = sprintf("%.2f", $data['num'] / $total1 * 100) . "%";
                    }
                }
                
                usort($datas, function($a,$b){ return $a['num'] < $b['num']; });
                
                $this->assign('show', 'all');
            } else {
                $db = new \Home\Model\OAEMoney2Model($autoid);
                $datas = $db->where($where)->select();
                $total = 0;
                if (!empty($datas)) {
                    foreach ($datas as &$data) {
                        $total += abs($data['amount1'] - $data['amount2']);
                        $data['num'] = abs($data['amount1'] - $data['amount2']);
                        $data['useORget_label'] = $useORgets[$data['useORget']];
                        $data['actionType_label'] = $this->actionTypes[$data['actionType']];
                    }
                }
                $this->assign('total', $total);
                $this->assign('show', 'user');
            }
            $this->assign('datas', $datas);
            $this->assign('type', $type);
            $this->assign('autoid', $autoid);
            $this->assign('characterid', $characterid);
            $this->assign('account', $account);
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }

    /**
     * 元宝消费查询
     */
    public function gold() {
        $useORgets = array(0 => '获得', 1 => '消耗');
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $autoid = 25;
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
            }else{
                $autoid = I('post.autoid');
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
            }
            $characterid = I('post.characterid');
            $account = I('post.account');
            $type = I('post.type');
            $where = array();
            if (empty($start_date)) {
                $start_date = date("Y-m-d");
            }
            if (empty($end_date)) {
                $end_date = date("Y-m-d");
            }
            $where['time'] = array('between', array($start_date, $end_date . " 23:59:59"));
            if (!empty($characterid)) {
                $where['characterid'] = $characterid;
            }
            if (!empty($account)) {
                $where['account'] = $account;
            }
            
            if($type != '-1') {
                $where['useORget'] = $type;
            }
			
			//
			$characters = array();
			$apply = D('Apply');
			$targetapply = $apply->distinct(true)->field('characterid')->where(array('autoid' => $autoid,'status' => 1,'apply_gold' => array('egt',5000)))->select();
            //print_r($targetapply);exit;
            if($targetapply){
                foreach($targetapply as $singleapply){
                    if(!empty($singleapply['characterid'])){
                        $characters[] = $singleapply['characterid'];
                    }
                }
            }
			if(!empty($characters)){
                if(!empty($characterid)){
                    $where['characterid'] = array(
                        array('NOT IN',$characters),
                        array('EQ',$where['characterid'])
                        );
                }
				//$where['characterid'] = array('NOT IN',$characters);
			}
            $datas = array();
            if (empty($account) && empty($characterid)) {
                $db = new \Home\Model\OAEMoneyModel($autoid);
                $datas = $db->field('sum(amount1) as amount1,sum(amount2) as amount2,count(autoid) as action_num,useORget,actionType')->where($where)->group("useORget,actionType")->order("")->select();
                //echo $db->getLastSql();exit;
                $total0 = $total1 = 0;
                if (!empty($datas)) {
                    foreach ($datas as &$data) {
                        $data['num'] = abs($data['amount1'] - $data['amount2']);
                        if ($data['useORget'] == 0) {
                            $total0 += $data['num'];
                        } else {
                            $total1 += $data['num'];
                        }
                        $data['useORget_label'] = $useORgets[$data['useORget']];
                        $data['actionType_label'] = $this->actionTypes[$data['actionType']];
                    }
                }

                foreach ($datas as &$data) {
                    if ($data['useORget'] == 0) {
                        $data['rate'] = sprintf("%.2f", $data['num'] / $total0 * 100) . "%";
                    } else {
                        $data['rate'] = sprintf("%.2f", $data['num'] / $total1 * 100) . "%";
                    }
                }
                
                //排序
                usort($datas, function($a,$b){ return $a['num'] < $b['num']; });
                
                $this->assign('show', 'all');
            } else {
                $db = new \Home\Model\OAEMoneyModel($autoid);
                $datas = $db->where($where)->select();
                //print_r($where);
                //echo $db->getLastSql();exit;
                $total = 0;
                if (!empty($datas)) {
                    foreach ($datas as &$data) {
                        $total += abs($data['amount1'] - $data['amount2']);
                        $data['num'] = abs($data['amount1'] - $data['amount2']);
                        $data['useORget_label'] = $useORgets[$data['useORget']];
                        $data['actionType_label'] = $this->actionTypes[$data['actionType']];
                    }
                }
                $this->assign('total', $total);
                $this->assign('show', 'user');
            }
            //var_dump($datas);exit;
            $this->assign('datas', $datas);
            $this->assign('autoid', $autoid);
            $this->assign('type', $type);
            $this->assign('characterid', $characterid);
            $this->assign('account', $account);
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }

    /**
     * 银币消费查询
     */
    public function money() {
        $useORgets = array(0 => '获得', 1 => '消耗');
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
                $autoid = 25;
            }else{
                $autoid = I('post.autoid');
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
            }
            $characterid = I('post.characterid');
            $account = I('post.account');
            $type = I('post.type');
            $where = array();
            if (empty($start_date)) {
                $start_date = date("Y-m-d");
            }
            if (empty($end_date)) {
                $end_date = date("Y-m-d");
            }
            $where['time'] = array('between', array($start_date, $end_date . " 23:59:59"));
            if (!empty($characterid)) {
                $where['characterid'] = $characterid;
            }
            if (!empty($account)) {
                $where['account'] = $account;
            }
            
            if($type != '-1') {
                $where['useORget'] = $type;
            }

            $datas = array();
            if (empty($account) && empty($characterid)) {
                $db = new \Home\Model\OAMoneyModel($autoid);
                $datas = $db->field('sum(amount1) as amount1,sum(amount2) as amount2,count(autoid) as action_num,useORget,actionType')->where($where)->group("useORget,actionType")->select();
                $total0 = $total1 = 0;
                if (!empty($datas)) {
                    foreach ($datas as &$data) {
                        $data['num'] = abs($data['amount1'] - $data['amount2']);
                        if ($data['useORget'] == 0) {
                            $total0 += $data['num'];
                        } else {
                            $total1 += $data['num'];
                        }
                        $data['useORget_label'] = $useORgets[$data['useORget']];
                        $data['actionType_label'] = $this->actionTypes[$data['actionType']];
                    }
                }

                foreach ($datas as &$data) {
                    if ($data['useORget'] == 0) {
                        $data['rate'] = sprintf("%.2f", $data['num'] / $total0 * 100) . "%";
                    } else {
                        $data['rate'] = sprintf("%.2f", $data['num'] / $total1 * 100) . "%";
                    }
                }
                
                usort($datas, function($a,$b){ return $a['num'] < $b['num']; });
                
                $this->assign('show', 'all');
            } else {
                $db = new \Home\Model\OAMoneyModel($autoid);
                $datas = $db->where($where)->select();

                $total = 0;
                if (!empty($datas)) {
                    foreach ($datas as &$data) {
                        $total += abs($data['amount1'] - $data['amount2']);
                        $data['num'] = abs($data['amount1'] - $data['amount2']);
                        $data['useORget_label'] = $useORgets[$data['useORget']];
                        $data['actionType_label'] = $this->actionTypes[$data['actionType']];
                    }
                }
                $this->assign('total', $total);
                $this->assign('show', 'user');
            }
            $this->assign('datas', $datas);
            $this->assign('autoid', $autoid);
            $this->assign('type', $type);
            $this->assign('characterid', $characterid);
            $this->assign('account', $account);
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }

    /**
     * 任务
     */
    public function task() {
        $input = I('post.');
        if (1) {
           $names = array( 20010=>'转世十八年',20020=>'练武',20030=>'府中偶遇',20040=>'闲逛集市',20050=>'北冥剑',20060=>'市井无赖',20070=>'暗中窥探',20080=>'路遇埋伏',20090=>'告警',20100=>'突生异变',20110=>'斩杀蛇妖',20120=>'误会',20130=>'这是误会',20140=>'黑甲铁卫',20150=>'拜见府主',20160=>'考校',20170=>'还要一试',20180=>'考校（续）',20190=>'偷袭',20200=>'突围',20210=>'阴谋暗算',20220=>'激斗',20230=>'较量',20240=>'境界突破',20250=>'死缠烂打',20260=>'赶去大会',20270=>'金剑大典',20280=>'口信',20290=>'意外纠缠',20300=>'侍女',20310=>'远行',30010=>'遗毒',30020=>'深入荒泽',30030=>'埋伏',30040=>'惊疑',30050=>'空青蛇',30060=>'灵兽',30070=>'幕后主使',30080=>'少年',30090=>'救出',30100=>'大战水犀王',30110=>'花姑',30120=>'剪除党羽',30130=>'引蛇出洞',30140=>'去找帮手',30150=>'决战翼蛇妖',30160=>'得胜归',30180=>'遇强越强',30190=>'打听线索',30200=>'一路跟踪',40010=>'山中魔狼',40020=>'发现敌踪',40030=>'黑幕显现',40040=>'魔修梓鹄',40050=>'深入大山',40060=>'突遇埋伏',40070=>'妖兽黑针',40080=>'山中故人',40090=>'解救人质',40100=>'恐怖魔修',40110=>'剪除羽翼',40120=>'道兵傀儡',40130=>'替天行道',40140=>'回城途中',40150=>'初来王都',40160=>'指点前途',40170=>'一年时光',50010=>'失控傀儡（一）',50020=>'一只醉猫',50030=>'失控傀儡（二）',50040=>'相邀比试',50050=>'琅邪仙草',50060=>'挑战问剑',50070=>'通灵剑卫',50080=>'挑战杀剑',50085=>'三界风云',50090=>'同门挑战',50100=>'挑战青禾',50110=>'九莲师姐',50120=>'切磋',50130=>'邋遢道人',50140=>'使者邀请',50150=>'辞行欲往',60010=>'下山考校',60020=>'升到50级',60030=>'前往仙府',60040=>'府内遇袭',60050=>'遗府道兵',60060=>'妖族道兵',60070=>'升到51级',60080=>'少炎死士',60090=>'道兵铠甲',60100=>'仙府大殿',60110=>'升到52级',60120=>'遗府守卫',60130=>'事急相告',60140=>'子朔师弟',60150=>'捕捉傀儡',60160=>'升到53级',60170=>'间歇',60180=>'事态紧急',60190=>'突围',60200=>'升到54级',60210=>'血战',60220=>'千年残骸',60230=>'道兵甲铠',60240=>'升到55级',60250=>'天人感应',60260=>'险遇',60270=>'破阵（一）',60280=>'破阵（二）',60290=>'升到56级',60300=>'脱离',60310=>'破阵',60320=>'猛攻敌阵',60330=>'升到57级',60340=>'九莲警语',60350=>'再战',60360=>'执念不绝',60370=>'升到58级',60380=>'好消息',60390=>'坏消息',60400=>'感慨',60410=>'死守不退',60420=>'升到59级',60430=>'决战妖族',60440=>'不详事变',60450=>'你找死！',60460=>'过往恩仇',60470=>'一剑了恩仇',60480=>'升到60级',60490=>'迁避',70010=>'卖宝',70020=>'挑选',70030=>'纠缠不休',70040=>'升到61级',70050=>'商人相争',70060=>'躺着中枪',70070=>'五疯仙人',70090=>'升到62级',70100=>'应邀赴会',70110=>'突发事件',70120=>'正合心意',70130=>'颛水小楼',70140=>'升到63级',70150=>'傲慢箫郎',70160=>'无惧再战',70170=>'何方郡主',70180=>'惜月知恩',70190=>'升到64级',70200=>'少炎刺客',70210=>'群仙竞争',70220=>'大夏谕旨',70230=>'仙缘大会',70240=>'升到65级',80010=>'不期而遇',80020=>'混战',80030=>'大名所累',80040=>'升到66级',80050=>'相逢',80060=>'采药',80070=>'较量',80080=>'义愤填膺',80090=>'升到67级',80100=>'山水杀机',80110=>'万兽门',80120=>'一路猛攻',80130=>'邋遢道人',80140=>'裂天剑修',80150=>'升到68级',80160=>'斩杀强敌',80170=>'天才人物',80180=>'棋逢对手',80190=>'飞雪真人',80200=>'升到69级',80210=>'决不放弃',80220=>'九死真人',80230=>'玄武传人',80240=>'待仙缘',80250=>'升到70级',80260=>'路在何方',90010=>'白衣姜君',90020=>'灵台方寸山',90030=>'灵剑侍女',90040=>'升级',90050=>'路途遇阻',90060=>'大战神魔',90070=>'手下留情',90080=>'再战神魔',90090=>'升级',90100=>'知难而退',90110=>'别致欢迎',90120=>'道童青水',90130=>'小童无知',90140=>'升级',90150=>'再战剑仙',90160=>'银月师兄',90170=>'神仙宫',90180=>'升级',90190=>'拜别银月',90200=>'伐木樵夫',90210=>'不吝指点',90220=>'一只猢狲',90230=>'升级',90240=>'明灵石猴',90250=>'灵猴指点',90260=>'道谢',90270=>'鏖战天神',90280=>'升级',90290=>'一梦三界',90300=>'睡梦天神',90310=>'斜月三星洞',90320=>'升级',90330=>'拜师菩提',90340=>'修炼（一）',90350=>'修炼（二）',90360=>'升级',90370=>'道童传讯',90380=>'神仙宫',90390=>'挑战四阶',90400=>'挑战六阶',90410=>'升级',90420=>'九阶路遥',90430=>'悟空指点',90440=>'九阶之战',90450=>'升级',90460=>'突然而至',90470=>'大夏剧变',100010=>'搜魂之术',100020=>'潜入山门',100030=>'升到81级',100040=>'打探身份',100050=>'灰袍人',100060=>'救出',100070=>'升到82级',100080=>'救出师弟',100090=>'怒火爆发',100100=>'详问',100110=>'升到83级',100120=>'道侣',100130=>'惨事',100140=>'真相',100150=>'升到84级',100160=>'救人计划',100170=>'伪装',100180=>'解放魂玉',100190=>'升到85级',100200=>'情深意切',100210=>'剑斩魔奴',100220=>'青铜魔卫',100230=>'升到86级',100240=>'疑问',100250=>'探查',100260=>'翼仙号',100270=>'升到87级',100280=>'守卫傀儡',100290=>'悔恨',100300=>'返虚神魔',100310=>'升到88级',100320=>'承诺',100330=>'东林弟子',100340=>'手下留情',100350=>'神魔傀儡（一）',100360=>'升到89级',100370=>'敌人首领',100380=>'狴犴神兽',100390=>'禁地秘密',100400=>'神魔傀儡（二）',100410=>'升到90级',100420=>'天狐传话',100430=>'传说绝域',110010=>'遭遇异族',110020=>'异族战士',110030=>'升到91级',110040=>'对话',110050=>'抗拒',110060=>'头领巴洛',110070=>'血魂变异',110080=>'升到92级',110090=>'威慑',110100=>'应战',110110=>'异族曲幽',110120=>'血眼神魂',110130=>'升到93级',110140=>'剑惊异族',110150=>'精锐新敌',110160=>'大战曲幽',110170=>'绝境',110180=>'升到94级',110190=>'步步相逼',110200=>'绝地求生',110210=>'一线生机',110220=>'逃出',110230=>'升到95级',110240=>'异族统领',110250=>'激战异族',110260=>'速战速决',110270=>'升到96级',110280=>'异族将军',110290=>'杀戮战士',110300=>'再度谈判',110310=>'绝不屈服',110320=>'升到97级',110330=>'疑惑',110340=>'控制心力',110350=>'艰苦磨练',110360=>'母皇意志',110370=>'升到98级',110380=>'不敌',110390=>'红雪天神',110400=>'杀出重围',110410=>'升到99级',110420=>'母皇？',110430=>'七曜天神',110440=>'共战母皇',110450=>'升到100级',110460=>'菩提降临',110470=>'三界秘境',120010=>'怪物突袭',120020=>'夜叉分身',120030=>'升到101级',120040=>'打探',120050=>'夜叉本尊',120060=>'宫殿',120070=>'误会',120080=>'升到102级',120090=>'岫轲天神',120100=>'又遇敌袭',120110=>'恐怖雪魔',120120=>'夺路而出',120130=>'升到103级',120140=>'雪魔出现',120150=>'一剑败敌',120160=>'意外结果',120170=>'雪魔正体',120180=>'升到104级',120190=>'炼狱神',120200=>'大战炼狱神',120210=>'炼狱神',120220=>'荒野天神',120230=>'切磋探底',120240=>'升到105级',120250=>'警告',120260=>'妖魔军团',120270=>'大战魔将',120280=>'升到106级',120290=>'妖魔王',120300=>'大战魔军（一）',120310=>'大战魔军（二）',120320=>'升到107级',120330=>'恐怖魔王',120340=>'大战妖魔王',120350=>'战胜',120360=>'罪恶天神',120370=>'一力除恶',120380=>'升到108级',120390=>'指点前路',120400=>'镇守者',120410=>'突破极限',120420=>'银发男子',120430=>'升到109级',120440=>'安息之地',120450=>'天神魂魄',120460=>'金甲女剑',120470=>'升到110级',120480=>'剑之道',120490=>'真相',120500=>'离去',130010=>'轩辕有令',130020=>'阻挡',130030=>'升到111级',130040=>'白极真仙',130050=>'白脸神魔',130060=>'力除真仙',130070=>'升到112级',130080=>'青狐之忌',130090=>'最强白脸蛟',130100=>'再战天神',130110=>'升到113级',130120=>'擒拿青狐',130130=>'凤霄来援',130140=>'红眼魔神',130150=>'升到114级',130160=>'破阵之法',130170=>'寻敌',130180=>'突破',130190=>'升到115级',130200=>'暗杀剑术',130210=>'无间阵',130220=>'无间猛攻',130230=>'升到116级',130240=>'吞天大圣',130250=>'红雪指点',130260=>'大战魔神',130270=>'升到117级',130280=>'通巡天神',130290=>'阻止敌援',130300=>'杀出血路',130310=>'升到118级',130320=>'突然生变',130330=>'疯狂的银月',130340=>'紫光傀儡',130350=>'升到119级',130360=>'万物使者',130370=>'神剑灭敌',130380=>'长青为囚',130390=>'升到120级',130400=>'力除首恶',130410=>'大胜无间',130420=>'废墟大世界',);
            if(empty($input)){
               $autoid = 25;
               $start_date = date('Y-m-d');
               $end_date = date('Y-m-d'); 
            }else{
                $autoid = I('post.autoid');
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
            }
            $where = array();
            if (empty($start_date)) {
                $start_date = date("Y-m-d");
            }
            if (empty($end_date)) {
                $end_date = date("Y-m-d");
            }
            $where['create_character_time'] = array('between', array($start_date, $end_date . " 23:59:59"));

            $db = new \Home\Model\GSTaskModel($autoid);
            $tmps = $db->join('`character` ON `character`.characterid = plotquest.characterid')->field('taskid, count(plotquest.characterid) as num,taskflag')->where($where)->group("taskid,taskflag")->order("taskid asc")->select();
            $datas = array();
            $total = 0;
            foreach($tmps as $data) {
                if(isset($datas[$data['taskid']])) {
                    $datas[$data['taskid']][$data['taskflag'].'taskflag'] = $data['num'];
                }else{
                    $data[$data['taskflag'].'taskflag'] = $data['num'];
                    $data['task_name'] = $names[$data['taskid']];
                    $datas[$data['taskid']] = $data;
                }
                $total += $data['num'];
            }
            
            foreach($datas as &$data) {
                $tmp = $data['1taskflag'] + $data['2taskflag'];
                $data['rate'] =  sprintf("%.2f", $tmp/ $total * 100) . "%";
                $data['finish_rate'] =  sprintf("%.2f", $data['2taskflag']/ $tmp * 100) . "%";
            }
            
            $this->assign('autoid', $autoid);
            $this->assign('datas', $datas);
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
        }
        
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }
    
    /**
     * 物品流向查询
     */
    public function item(){
        //print_r($this->getprop());exit;
        $props = $this->getprop1();
        //print_r($props);exit;
        $useORgets = array(0 => '获得', 1 => '消耗');
        $input = I('post.');
        if (1) {
            if(empty($input)){
                $autoid = 25;
                $start_date = date('Y-m-d');
                $end_date = date('Y-m-d');
            }else{
                $autoid = I('post.autoid');
                $start_date = I('post.start_date');
                $end_date = I('post.end_date');
            }
            $characterid = I('post.characterid');
            $account = I('post.account');
            $type = I('post.type');
            $where = array();
            if (empty($start_date)) {
                $start_date = date("Y-m-d");
            }
            if (empty($end_date)) {
                $end_date = date("Y-m-d");
            }
            $where['time'] = array('between', array($start_date, $end_date . " 23:59:59"));
            if (!empty($characterid)) {
                $where['characterid'] = $characterid;
            }
            if (!empty($account)) {
                $where['account'] = $account;
            }
            
            if($type != '-1') {
                $where['useorget'] = $type;
            }

            $db = new \Home\Model\OAItemModel($autoid);
            $count = $db->where($where)->count();
            $Page = new \Think\Mypage($count,100);
            $show = $Page->show();
			$datas = $db->where($where)->limit($Page->firstRow . ',' . $Page->listRows)->select();
            //echo $db->getLastSql();exit;
            //$total0 = $total1 = 0;
            foreach($datas as &$data){
                $data['useorget'] = $data['useorget'] == 0 ? '获得' : '消耗';
                $data['item'] = $props[$data['item']];
            }
           
            $this->assign('datas', $datas);
            $this->assign('page',$show);
            $this->assign('autoid', $autoid);
            $this->assign('type', $type);
            $this->assign('characterid', $characterid);
            $this->assign('account', $account);
            $this->assign('start_date', $start_date);
            $this->assign('end_date', $end_date);
        }
        vendor('Pager.Pager');
        $this->assign('server_html', \Pager::getSelect('autoid', 'autoid', $this->_server, $autoid));
        $this->display();
    }

    private function cmp_data($a, $b)
    {
        if ($a['num'] == $b['num']) {
            return 0;
        }
        return ($a['num'] < $b['num']) ? -1 : 1;
    }
}
