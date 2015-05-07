<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>元宝统计</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="http://lib.sinaapp.com/js/jquery-ui/1.9.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery-ui/1.9.2/jquery-ui.js"></script>
    <script type="text/javascript" src="Public/Home/Js/global.js"></script>
</head>
<body>
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <form method="post" action="<?php echo U('Home/Cost/gold');?>">
    <div class="panel-heading">
        <label>元宝统计:</label>&nbsp;&nbsp;
        <label>区服:</label>
        <?php echo ($server_html); ?>
        <label>角色ID:</label><input class="form-control" type="text" name="characterid" value="<?php echo ($characterid); ?>" style="width:150px;display:inline;"/>
        <label>账户:</label><input class="form-control" type="text" name="account" value="<?php echo ($account); ?>" style="width:150px;display:inline;"/>
        <label>类型:</label><select name="type"><option value="0" <?php if(($type) == "0"): ?>selected<?php endif; ?>>获得</option><option value="1" <?php if(($type) == "1"): ?>selected<?php endif; ?>>消耗</option></select>
        <label for="date">开始日期:</label>
        <input class="datepicker" type="input" id="start_date" name="start_date" value="<?php echo ($start_date); ?>" />&nbsp;
        <label for="date">结束日期:</label>
        <input class="datepicker" type="input" id="end_date" name="end_date" value="<?php echo ($end_date); ?>" />&nbsp;
        <input type="submit" value="查询"/>
    </div>
    </form>
    <div class="panel-body">
        <?php if(($show) == "user"): ?><label>总数:<?php echo ($total); ?></label>
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;" show="user">
            <thead>
            <tr align="center">
                <td id="col1">角色id</td>
                <td id="col2">账户</td>
                <td>操作时间</td>
                <td>用户等级</td>
                <td>数值</td>
                <td>获取类型</td>
                <td>操作类型</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($datas)): $i = 0; $__LIST__ = $datas;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                    <td><?php echo ($vo["characterid"]); ?></td>
                    <td><?php echo ($vo["account"]); ?></td>
                    <td><?php echo ($vo["time"]); ?></td>
                    <td><?php echo ($vo["userLev"]); ?></td>
                    <td><?php echo ($vo["num"]); ?></td>
                    <td><?php echo ($vo["useORget_label"]); ?></td>
                    <td><?php echo ($vo["actionType_label"]); ?>-<?php echo ($vo["actionType"]); ?></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table><?php endif; ?>
        <?php if(($show) == "all"): ?><table class="table table-bordered" style="text-align:center;vertical-align:middle;" show="all">
            <thead>
            <tr align="center">
                <td id="col1">操作类型</td>
                <td>实际数值</td>
                <td id="col2">百分比</td>
                <td>操作记录次数</td>
                <td>获取类型</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($datas)): $i = 0; $__LIST__ = $datas;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr actiontype="<?php echo ($vo["actionType"]); ?>" class="hiddendata">
                    <td><?php echo ($vo["actionType_label"]); ?></td>
                    <td><?php echo ($vo["num"]); ?></td>
                    <td><?php echo ($vo["rate"]); ?></td>
                    <td><?php echo ($vo["action_num"]); ?></td>
                    <td><?php echo ($vo["useORget_label"]); ?></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table><?php endif; ?>
        <table class="table table-bordered newcost" style="text-align:center;vertical-align:middle;display:none;">
            <thead>
            <tr align="center">
                <td id="col1">分类</td>
                <td>操作类型</td>
                <td id="col2">实际数值</td>
                <td>百分比</td>
            </tr>
            </thead>
            <tbody>
                <tr actiontype="8" class="showdata">
                    <td rowspan="5" style="vertical-align:middle;">角色</td>
                    <td></td>
                    <td class="cost"></td>
                    <td rowspan="5" class="rank1"></td>
                </tr>
                <tr actiontype="7" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="9" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="65" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="63" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="6" class="showdata">
                    <td style="vertical-align:middle;">坐骑</td>
                    <td></td>
                    <td class="cost"></td>
                    <td class="rank2"></td>
                </tr>
                <tr actiontype="61" class="showdata">
                    <td style="vertical-align:middle;">灵兽</td>
                    <td></td>
                    <td class="cost"></td>
                    <td class="rank3"></td>
                </tr>
                <tr actiontype="20" class="showdata">
                    <td style="vertical-align:middle;">商城购买</td>
                    <td></td>
                    <td class="cost"></td>
                    <td class="rank4"></td>
                </tr>
                <tr actiontype="11" class="showdata">
                    <td style="vertical-align:middle;">同门论道</td>
                    <td></td>
                    <td class="cost"></td>
                    <td class="rank5"></td>
                </tr>
                <tr actiontype="60" class="showdata">
                    <td style="vertical-align:middle;">天宝阁</td>
                    <td></td>
                    <td class="cost"></td>
                    <td class="rank6"></td>
                </tr>
                <tr actiontype="1021" class="showdata">
                    <td rowspan="2" style="vertical-align:middle;">摘星府</td>
                    <td></td>
                    <td class="cost"></td>
                    <td rowspan="2" class="rank7"></td>
                </tr>
                <tr actiontype="1014" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="3" class="showdata">
                    <td rowspan="3" style="vertical-align:middle;">任务</td>
                    <td></td>
                    <td class="cost"></td>
                    <td rowspan="3" class="rank8"></td>
                </tr>
                <tr actiontype="4" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="5" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="56" class="showdata">
                    <td rowspan="10" style="vertical-align:middle;">副本与活动</td>
                    <td></td>
                    <td class="cost"></td>
                    <td rowspan="10" class="rank9"></td>
                </tr>
                <tr actiontype="21" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1012" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1013" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="42" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1015" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="24" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="23" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1002" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1025" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1017" class="showdata">
                    <td rowspan="6" style="vertical-align:middle;">充值活动</td>
                    <td></td>
                    <td class="cost"></td>
                    <td rowspan="6" class="rank10"></td>
                </tr>
                <tr actiontype="72" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1003" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="74" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="84" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="85" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1016" class="showdata">
                    <td rowspan="8" style="vertical-align:middle;">其他</td>
                    <td></td>
                    <td class="cost"></td>
                    <td rowspan="8" class="rank11"></td>
                </tr>
                <tr actiontype="0" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1024" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1018" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="1019" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="13" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="48" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="83" class="showdata">
                    <td></td>
                    <td class="cost"></td>
                </tr>
                <tr actiontype="62" class="showdata">
                    <td style="vertical-align:middle;">境界</td>
                    <td></td>
                    <td class="cost"></td>
                    <td class="rank12"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right">合计&nbsp;&nbsp;</td>
                    <td class="total"></td>
                </tr>
            </tbody>
        </table>
    </div>
    
</div>
<script>
$(document).ready(function(){
    if($(".table-bordered").attr('show') == 'all' && $("select[name='type']").val() == 1){
        $(".table-bordered").hide();
        $(".newcost").show();
        var total = 0;
        $(".showdata").each(function(index){
            //循环显示数据
            var actiontype = $(this).attr('actiontype');
            //alert(actiontype);
            var actionname= "";
            var actionnum = 0;
            $(".hiddendata").each(function(index){
                //查找对应的数据
                if($(this).attr('actiontype') == actiontype){
                    actionname = $(this).find("td").eq(0).html();
                    actionnum = $(this).find("td").eq(1).html();
                    return false;
                }
            });
            if(actionname == ''){
                switch(actiontype){
                    case '8':
                        actionname = '神兵养成消耗';actionnum = 0;
                        break;
                    case '7':
                        actionname = '羽翼养成消耗';actionnum = 0;
                        break;
                    case '9':
                        actionname = '神弓养成消耗';actionnum = 0;
                        break;
                    case '65':
                        actionname = '神魔盾养成消耗';actionnum = 0;
                        break;
                    case '63':
                        actionname = '披风养成消耗';actionnum = 0;
                        break;
                    case '6':
                        actionname = '坐骑养成消耗';actionnum = 0;
                        break;
                    case '61':
                        actionname = '灵兽养成消耗';actionnum = 0;
                        break;
                    case '20':
                        actionname = '商城';actionnum = 0;
                        break;
                    case '11':
                        actionname = '同门论道';actionnum = 0;
                        break;
                    case '60':
                        actionname = '天宝阁投资';actionnum = 0;
                        break;
                    case '1021':
                        actionname = '神主天藏';actionnum = 0;
                        break;
                    case '1014':
                        actionname = '战神殿';actionnum = 0;
                        break;
                    case '3':
                        actionname = '日常任务';actionnum = 0;
                        break;
                    case '4':
                        actionname = '帮派任务';actionnum = 0;
                        break;
                    case '5':
                        actionname = '机缘任务';actionnum = 0;
                        break;
                    case '56':
                        actionname = '冰火淬体';actionnum = 0;
                        break;
                    case '21':
                        actionname = '重置女娲神石副本次数';actionnum = 0;
                        break;
                    case '1012':
                        actionname = '绝境探险';actionnum = 0;
                        break;
                    case '1013':
                        actionname = '女娲神石元宝扫荡';actionnum = 0;
                        break;
                    case '42':
                        actionname = '刷新护送美女品质';actionnum = 0;
                        break;
                    case '1015':
                        actionname = '单人副本';actionnum = 0;
                        break;
                    case '24':
                        actionname = '仙缘大会清零冷却时间';actionnum = 0;
                        break;
                    case '23':
                        actionname = '仙缘大会增加挑战次数';actionnum = 0;
                        break;
                    case '1002':
                        actionname = '答题系统';actionnum = 0;
                        break;
                    case '1017':
                        actionname = '礼包道具';actionnum = 0;
                        break;
                    case '72':
                        actionname = '多倍转盘';actionnum = 0;
                        break;
                    case '1003':
                        actionname = '特惠礼包';actionnum = 0;
                        break;
                    case '1016':
                        actionname = '背包格开启';actionnum = 0;
                        break;
                    case '0':
                        actionname = '不明来路';actionnum = 0;
                        break;
                    case '1024':
                        actionname = '天道任务兑换';actionnum = 0;
                        break;
                    case '1018':
                        actionname = '交易';actionnum = 0;
                        break;
                    case '1019':
                        actionname = '摊位';actionnum = 0;
                        break;
                    case '13':
                        actionname = '创建帮派消耗';actionnum = 0;
                        break;
                    case '48':
                        actionname = '资源找回元宝消耗';actionnum = 0;
                        break;
                    case '62':
                        actionname = '第二元神养成消耗';actionnum = 0;
                        break;
                    case '1025':
                        actionname = '界域大战元宝复活';actionnum = 0;
                        break;
                    case '74':
                        actionname = 'VIP超值大回馈';actionnum = 0;
                        break;
                    case '83':
                        actionname = '天道商品';actionnum = 0;
                        break;
                    case '84':
                        actionname = '每日活跃-大礼礼盒';actionnum = 0;
                        break;
                    case '85':
                        actionname = '节日活动-特惠礼包';actionnum = 0;
                        break;
                }
            }
            total += parseInt(actionnum);
            switch(actiontype){
                case '8':
                case '6':
                case '61':
                case '20':
                case '11':
                case '60':
                case '1021':
                case '3':
                case '56':
                case '1017':
                case '1016':
                case '62':
                    $(this).find("td").eq(1).html(actionname);
                    $(this).find("td").eq(2).html(actionnum);
                    break;
                case '7':
                case '9':
                case '65':
                case '63':
                case '1014':
                case '4':
                case '5':
                case '21':
                case '1012':
                case '1013':
                case '42':
                case '1015':
                case '24':
                case '23':
                case '1002':
                case '72':
                case '1003':
                case '0':
                case '1024':
                case '1018':
                case '1019':
                case '13':
                case '48':
                case '1025':
                case '74':
                case '83':
                case '84':
                case '85':
                    $(this).find("td").eq(0).html(actionname);
                    $(this).find("td").eq(1).html(actionnum);
                    break;
            }
            
        });
        $(".total").html(total);
        $("td[class^='rank']").css('vertical-align','middle');
        var temp = 0;
        for(var i = 0;i < 5;i++){
            temp += parseInt($(".cost").eq(i).html());
        }
        $(".rank1").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = parseInt($(".cost").eq(5).html());
        $(".rank2").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = parseInt($(".cost").eq(6).html());
        $(".rank3").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = parseInt($(".cost").eq(7).html());
        $(".rank4").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = parseInt($(".cost").eq(8).html());
        $(".rank5").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = parseInt($(".cost").eq(9).html());
        $(".rank6").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = 0;
        for(var i = 10;i< 12;i++){
            temp += parseInt($(".cost").eq(i).html());
        }
        $(".rank7").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = 0;
        for(var i = 12;i< 15;i++){
            temp += parseInt($(".cost").eq(i).html());
        }
        $(".rank8").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = 0;
        for(var i = 15;i< 25;i++){
            temp += parseInt($(".cost").eq(i).html());
        }
        $(".rank9").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = 0;
        for(var i = 25;i< 31;i++){
            temp += parseInt($(".cost").eq(i).html());
        }
        $(".rank10").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = 0;
        for(var i = 31;i< 39;i++){
            temp += parseInt($(".cost").eq(i).html());
        }
        $(".rank11").html(parseInt((temp / total) * 10000) / 100 + "%");
        temp = parseInt($(".cost").eq(39).html());
        $(".rank12").html(parseInt((temp / total) * 10000) / 100 + "%");
    }
})
</script>
</body>
</html>