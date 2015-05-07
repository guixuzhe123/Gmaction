<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/Public/Home/css/style.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="/Public/Home/Js/jquery.js"></script>

    <script type="text/javascript">
        $(function () {
            var user = "<?php echo ($username); ?>";
            if(user == 'jishu'){
                $(".hidediv").css('display','block');
            }
            //导航切换
            $(".menuson li").click(function () {
                $(".menuson li.active").removeClass("active");
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
            //权限操作
            var url = "<?php echo U('Auth/authinfo');?>";
            $.post(url,function(data){
                var response = jQuery.parseJSON(data);
                if(response['len'] == 1){
                    if(response['list'] == 0){
                        $(".block").show();
                    }else{
                        $(".block").hide();
                    }
                }else{
                    var blockarr = response['list'];
                    $(".block").each(function(index){
                        if(jQuery.inArray($(this).attr('blockname'),blockarr) == -1){
                            $(this).remove();
                        }
                    });
                }
            });
        })
    </script>


</head>

<body style="background:#f0f9fd;">

<dl class="leftmenu">

    <dd>
        <div class="title block" blockname="100">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>运营平台、区服管理
        </div>
        <ul class="menuson">
            <li class="block" blockname="10010"><cite></cite><a href="<?php echo U('Servercon/index');?>" target="rightFrame">区服列表</a><i></i></li>
            <li class="block" blockname="10020"><cite></cite><a href="<?php echo U('Platadmin/index');?>" target="rightFrame">平台管理</a><i></i></li>
            <li class="block" blockname="10030"><cite></cite><a href="<?php echo U('Servercon/allot');?>" target="rightFrame">3595平台服务器对接</a><i></i></li>
        </ul>
    </dd>

     <dd>
        <div class="title block" blockname="200">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>数据查询
        </div>
        <ul class="menuson">
            <li class="block" blockname="20010"><cite></cite><a href="<?php echo U('Reg/day_data');?>" target="rightFrame">每日数据</a><i></i></li>
            <li class="block" blockname="20020"><cite></cite><a href="<?php echo U('Reg/data_keep');?>" target="rightFrame">每日留存</a><i></i></li>
            <li class="block" blockname="20030"><cite></cite><a href="<?php echo U('Reg/hour_data');?>" target="rightFrame">每小时注册量</a><i></i></li>
            <li class="block" blockname="20030"><cite></cite><a href="<?php echo U('Reg/hour_pay');?>" target="rightFrame">每小时充值量</a><i></i></li>
            <li class="block" blockname="20040"><cite></cite><a href="<?php echo U('Charge/query_charge_list');?>" target="rightFrame">充值查询</a><i></i></li>
            <li class="block" blockname="20050"><cite></cite><a href="<?php echo U('Reg/ip_query');?>" target="rightFrame">ip登陆查询</a><i></i></li>
            <li class="block" blockname="20060"><cite></cite><a href="<?php echo U('Cost/money');?>" target="rightFrame">银币查询</a><i></i></li>
            <li class="block" blockname="20070"><cite></cite><a href="<?php echo U('Cost/gold');?>" target="rightFrame">元宝查询</a><i></i></li>
            <li class="block" blockname="20080"><cite></cite><a href="<?php echo U('Cost/gift');?>" target="rightFrame">礼金查询</a><i></i></li>
            <li class="block" blockname="200140"><cite></cite><a href="<?php echo U('Cost/item');?>" target="rightFrame">物品查询</a><i></i></li>
            <li class="block" blockname="20090"><cite></cite><a href="<?php echo U('Cost/task');?>" target="rightFrame">任务查询</a><i></i></li>
            <li class="block" blockname="200100"><cite></cite><a href="<?php echo U('Oldplayer/index');?>" target="rightFrame">全服老玩家查询</a><i></i></li>
            <li class="block" blockname="200110"><cite></cite><a href="<?php echo U('Reg/allserver');?>" target="rightFrame">全服注册创角查询</a><i></i></li>
            <li class="block" blockname="200140"><cite></cite><a href="<?php echo U('Stock/index');?>" target="rightFrame">全服存量查询</a><i></i></li>
            <li class="block" blockname="200120"><cite></cite><a href="<?php echo U('Mall/index');?>" target="rightFrame">商城道具排行榜</a><i></i></li>
            <li class="block" blockname="200130"><cite></cite><a href="<?php echo U('Charge/payblock');?>" target="rightFrame">付费段人数查询</a><i></i></li>
            <li class="block" blockname="200150"><cite></cite><a href="<?php echo U('Topcombat/index');?>" target="rightFrame">战力力排行</a><i></i></li>
        </ul>
    </dd> 
     <dd>
        <div class="title block" blockname="300">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>在线数据
        </div>
        <ul class="menuson">
            <li class="block" blockname="30010"><cite></cite><a href="<?php echo U('Online/online');?>" target="rightFrame">实时在线查询</a><i></i></li>
            <li class="block" blockname="30020"><cite></cite><a href="<?php echo U('Online/history_online');?>" target="rightFrame">历史在线</a><i></i></li>
            <li class="block" blockname="30030"><cite></cite><a href="<?php echo U('Level/index');?>" target="rightFrame">实时等级分布</a><i></i></li>
            <li class="block" blockname="30040"><cite></cite><a href="<?php echo U('Level/history');?>" target="rightFrame">历史等级分布</a><i></i></li>
            <li class="block" blockname="30050"><cite></cite><a href="<?php echo U('Charge/charge_total');?>" target="rightFrame">充值总量</a><i></i></li>
            <li class="block" blockname="30060"><cite></cite><a href="<?php echo U('Charge/top_10_charge');?>" target="rightFrame">充值排行榜</a><i></i></li>
        </ul>
    </dd> 
    <dd>
        <div class="title block" blockname="400">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>玩家信息
        </div>
        <ul class="menuson">
            <li class="block" blockname="40010"><cite></cite><a href="<?php echo U('Player/info');?>" target="rightFrame">玩家信息查询</a><i></i></li>
            <li class="block" blockname="40050"><cite></cite><a href="<?php echo U('Userinfo/index');?>" target="rightFrame">区服玩家查询</a><i></i></li>
            <li class="block" blockname="40020"><cite></cite><a href="<?php echo U('Player/ipoperation');?>" target="rightFrame">封IP</a><i></i></li>
            <li class="block" blockname="40030"><cite></cite><a href="<?php echo U('Player/iplocklist');?>" target="rightFrame">IP封禁列表查询</a><i></i></li>
			<li class="block" blockname="40040"><cite></cite><a href="<?php echo U('Player/lockusers');?>" target="rightFrame">批量封号</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title block" blockname="500">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>游戏公告管理
        </div>
        <ul class="menuson">
            <li class="block" blockname="50010"><cite></cite><a href="<?php echo U('Announce/instant');?>" target="rightFrame">即时公告</a><i></i></li>
            <li class="block" blockname="50020"><cite></cite><a href="<?php echo U('Announce/loop');?>" target="rightFrame">循环公告</a><i></i></li>
            <li class="block" blockname="50030"><cite></cite><a href="<?php echo U('Announce/regular');?>" target="rightFrame">定时公告</a><i></i></li>
            <li class="block" blockname="50040"><cite></cite><a href="<?php echo U('Announce/preannlist');?>" target="rightFrame">公告列表</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title block" blockname="600">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>申请管理
        </div>
        <ul class="menuson">
            <li class="block" blockname="60010"><cite></cite><a href="<?php echo U('Apply/apply');?>" target="rightFrame">申请元宝</a><i></i></li>
            <li class="block" blockname="60020"><cite></cite><a href="<?php echo U('Apply/recharge');?>" target="rightFrame">申请充值</a><i></i></li>
            <li class="block" blockname="60030"><cite></cite><a href="<?php echo U('Apply/prop');?>" target="rightFrame">申请道具</a><i></i></li>
            <li class="block" blockname="60090"><cite></cite><a href="<?php echo U('Apply/lotapply');?>" target="rightFrame">批量申请</a><i></i></li>
            <li class="block" blockname="60040"><cite></cite><a href="<?php echo U('Apply/serverapply');?>" target="rightFrame">全服元宝</a><i></i></li>
            <li class="block" blockname="60080"><cite></cite><a href="<?php echo U('Apply/cashgift');?>" target="rightFrame">全服礼金</a><i></i></li>
            <li class="block" blockname="60050"><cite></cite><a href="<?php echo U('Apply/apply_list');?>" target="rightFrame">元宝申请列表</a><i></i></li>
            <li class="block" blockname="60060"><cite></cite><a href="<?php echo U('Apply/rechargelist');?>" target="rightFrame">充值申请列表</a><i></i></li>
            <li class="block" blockname="60070"><cite></cite><a href="<?php echo U('Apply/proplist');?>" target="rightFrame">道具申请列表</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title block" blockname="700">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>权限管理
        </div>
        <ul class="menuson">
            <li class="block" blockname="70010"><cite></cite><a href="<?php echo U('Auth/index');?>" target="rightFrame">管理员列表</a><i></i></li>
            <!-- <li class="block" blockname="70020"><cite></cite><a href="<?php echo U('Auth/blockmange');?>" target="rightFrame">模块管理</a><i></i></li> -->
            <li class="block" blockname="70020"><cite></cite><a href="<?php echo U('Auth/modifypwd');?>" target="rightFrame">密码修改</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title block" blockname="900">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>聊天系统监控
        </div>
        <ul class="menuson">
            <li class="block" blockname="90010"><cite></cite><a href="<?php echo U('Chat/index');?>" target="rightFrame">聊天监控</a><i></i></li>
        </ul>
    </dd>
    <dd>
        <div class="title block" blockname="800">
            <span><img src="/Public/Home/Image/leftico01.png"/></span>日志管理
        </div>
        <ul class="menuson">
            <li class="block" blockname="80010"><cite></cite><a href="<?php echo U('Log/index');?>" target="rightFrame">日志列表</a><i></i></li>
        </ul>
    </dd>

   


</dl>
<div style="display:none;" class="hidediv">
    <input type="button" value="click" class="updatemod">
</div>
<script>
    $(".updatemod").click(function(){
        var jsontitle = "";
        var len = $("li.block").length;
        $(".title").each(function(index){
            //alert($(this).val());
            var titleblock = $(this).attr('blockname');
            //alert($(this).html().length);
            var titlename = $(this).html().substring($(this).html().indexOf("</span>") + 7,$(this).html().length - 9);
            if(index == 0){
                jsontitle = '[' + '{"blockname":"' + titleblock + '","blocktitle":"' + titlename + '"}' + ',';
            }else{
                jsontitle += '{"blockname":"' + titleblock + '","blocktitle":"' + titlename + '"}' + ',';
            }
        })
        $("li.block").each(function(index){
            var titleblock1 = $(this).attr('blockname');
            var titlename1 = $(this).find('a').html();
            if(index == (len - 1)){
                jsontitle += '{"blockname":"' + titleblock1 + '","blocktitle":"' + titlename1 + '"}' + ']';
            }else{
                jsontitle += '{"blockname":"' + titleblock1 + '","blocktitle":"' + titlename1 + '"}' + ',';
            }
        })
        console.log(jsontitle);
        var url = "<?php echo U('Test/updatemod');?>";
        $.post(url,{jsontitle:jsontitle},function(data){
           alert(data);
        })
    })
</script>
</body>
</html>