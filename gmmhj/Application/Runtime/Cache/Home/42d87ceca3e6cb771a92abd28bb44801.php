<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>充值记录列表</title>
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
    <form method="post" action="<?php echo U('Home/Charge/query_charge_list');?>" name="form1">
    <div class="panel-heading">
        <label>充值记录列表</label>&nbsp;&nbsp;
        <label>区服:</label>
        <?php echo ($server_html); ?>
        <label>平台来源：</label>
        <select name="resourceid" id="resourceid" class="form-control" style="width:200px;display:inline;" selectplat="<?php echo ($resourceid); ?>">
            <option value="0">请选择平台来源</option>
            <?php if(is_array($plats)): $i = 0; $__LIST__ = $plats;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["resource"]); ?>" class="platopt"><?php echo ($vo["platname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        <label>角色id:</label>
        <input type="text" value="<?php echo ($characterid); ?>" id="characterid" name="characterid" style="width:150px;margin:0 auto;" value="<?php echo ($characterid); ?>"/>
        <label>账户:</label>
        <input type="text" value="<?php echo ($account); ?>" id="account" name="account" style="width:150px;margin:0 auto;" value="<?php echo ($account); ?>"/>
        <label for="date">开始日期:</label>
        <input class="datepicker" type="input" id="start_date" name="start_date" value="<?php echo ($start_date); ?>" />&nbsp;
        <label for="date">结束日期:</label>
        <input class="datepicker" type="input" id="end_date" name="end_date" value="<?php echo ($end_date); ?>" />&nbsp;
        <input type="button" value="查询" id="form1submit"/>
    </div>
    </form>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            <tr align="right"><td colspan="5">元宝总数：<span class="chargenum"></span>&nbsp;&nbsp;&nbsp;</td></tr>
            <tr align="center">
                <!--<td id="col1">区服</td>-->
                <td id="col2">订单号</td>
                <td>用户账号</td>
                <td>角色名称</td>
                <td>充值元宝</td>
                <td>充值时间</td>
            </tr>
            </thead>
            <tbody>
                <?php if(is_array($rs)): $i = 0; $__LIST__ = $rs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr class="chargetr" account="<?php echo ($vo["account"]); ?>" num="<?php echo ($vo["amount"]); ?>">
                    <td><?php echo ($vo["billno"]); ?></td>
                    <td><?php echo ($vo["account"]); ?></td>
                    <td><?php echo ($vo["username"]); ?></td>
                    <td><?php echo ($vo["amount"]); ?></td>
                    <td><?php echo ($vo["time"]); ?></td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr align="right">
                    <td colspan="5">
                        <div class="jqpageshow"></div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
</div>
<script>
	$(document).ready(function(){
		var num = 0;
        var whitelist3595 = new Array("3595mhj_lordfu","3595mhj_leoway","3595mhj_bodlin","3595mhj_lxy350104","3595mhj_qq346970984","3595mhj_a5127303","3595mhj_235529665","3595mhj_zhz201","3595mhj_hai1222");
		$(".chargetr").each(function(index){
			var account = $(this).attr('account');
            if(jQuery.inArray(account,whitelist3595) > -1){
                $(this).remove();
            }else{
                num += parseInt($(this).attr('num'));
            }
			/*if(account == 'lordfu' || account == 'leoway' || account == 'bodlin' || account == 'lxy350104' || account == 'qq346970984' || account == 'a5127303' || account == '235529665' || account == 'zhz201'){
				$(this).css('display','none');
			}else{
				num += parseInt($(this).attr('num'));
			}*/
		});
		$(".chargenum").html(num);
        $("#form1submit").click(function(){
            if($("#account").val() != ""){
                if($("#resourceid").val() == 0){
                    alert("请选择平台来源，以便准确查找账号");
                    return false;
                }
            }
            form1.submit();
        })
        //还原已选择来源平台
        var platsel = $("#resourceid").attr('selectplat');
        if(platsel != 0){
            $(".platopt").each(function(index){
                if($(this).val() == platsel){
                    $(this).attr('selected',1);
                }
            })
        }
        jQuery.page = function(cname,pagenum,pos,nowpage){
            if(typeof(cname) == 'undefined'){
                cname = 'jQpage';//要进行分类的类名
            }
            if(typeof(pagenum) == 'undefined'){
                pagenum = 10;//每页显示的条目
            }
            if(typeof(pos) == 'undefined'){
                pos = 'right';//页面跳转链接的位置
            }
            if(typeof(nowpage) == 'undefined'){
                nowpage = 1;//当前所处的页
            }
            var count = $("." + cname).length;//总数目
            var pages = Math.ceil(count / pagenum); //总页数
            alert(count);
            alert(pagenum);
            alert(pages);return false;
            var pageshow = "";//页数点击链接
            for(var i = 1;i < pages;i++){
                if(i == nowpage){
                    pageshow += "<span>" + i + "</span>";
                }else{
                    pageshow += "<a>" + i + "</a>";
                }
            }
            temp = nowpage * pagenum;
            $("." + cname).each(function(index){
                if(index >= (temp - 10) && index <= (temp - 1)){
                    $(this).css('display','block');
                }else{
                    $(this).css('display','none');
                }
            });
            $(".jqpageshow").html(pageshow);
        }
	});	
</script>
</body>
</html>