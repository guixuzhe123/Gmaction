<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>每小时在线</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="http://lib.sinaapp.com/js/jquery-ui/1.9.2/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery-ui/1.9.2/jquery-ui.js"></script>
    <script type="text/javascript" src="Public/Home/Js/global.js"></script>
    <style>
        body{
            font-family: '微软雅黑';
        }
    </style>
</head>
<body>
<div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
    <div class="panel-heading">
        <label>充值日志</label>
        <br/><br/>
       <span>请选择查询日期：</span> <input class="datepicker" type="input" id="date" value="<?php echo ($datetime); ?>">
       <span>请选择服务器：</span> <?php echo ($server_html); ?><br/><br/>
        <p>充值总额：<?php echo ($summoney / 10); ?>元&nbsp;&nbsp;&nbsp;共<?php echo ($count); ?>笔交易</p>
		<div style="display:none;">
			<input type="text" class="sidinput" /><button class="sidclick">点击</button>
		</div>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-striped" style="text-align:center;vertical-align:middle;">
            <thead>
                <tr align="center">
                	<td>id</td>
                	<td>角色id</td>
                	<td>角色名</td>
                	<td>账号</td>
                	<td>充值时间</td>
                	<td>元宝数量</td>
                	<td>订单号</td>
                	<td>ip</td>
                	<td>来源</td>
                	<td>额外元宝</td>
                </tr>
            </thead>
            <tbody>
            	<?php if(is_array($pay)): $i = 0; $__LIST__ = $pay;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr align="center">
						<td class="sid"><?php echo ($vo["id"]); ?></td>
						<td><?php echo ($vo["characterid"]); ?></td>
						<td><?php echo ($vo["name"]); ?></td>
						<td><?php echo ($vo["account"]); ?></td>
						<td><?php echo (date("Y-m-d H:i:s",$vo["m_chargetime"])); ?></td>
						<td class="emoney"><?php echo ($vo["m_emoney"]); ?></td>
						<td><?php echo ($vo["m_billno"]); ?></td>
						<td><?php echo ($vo["ip"]); ?></td>
						<td><?php echo ($vo["source"]); ?></td>
						<td><?php echo ($vo["extra_money"]); ?></td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>
</div>
<form action="<?php echo U('Test/test1');?>" method="post" name="form1" id="form1" style="display:none;">
	<input type="hidden" id="dateinput" name="dateinput2222"/>
    <input type="hidden" id="autoidinput" name="autoid"/>
</form>
<script>
	$(document).ready(function(){
		$("#date").change(function(){
			var date = parseInt((new Date($(this).val() + ' 00:00:00')) / 1000);
			$("#dateinput").val(date);
            $("#autoidinput").val($("#autoid").val());
			form1.submit();
		});
        $("#autoid").change(function(){
            var date = parseInt((new Date($("#date").val() + ' 00:00:00')) / 1000);
            $("#dateinput").val(date);
            $("#autoidinput").val($("#autoid").val());
            form1.submit();
        })
        var selectid = "<?php echo ($selectautoid); ?>";
        $("#autoid option").css('selected',0);
        $("#autoid option").each(function(index){
            if($(this).val() == selectid){
                $(this).css('selected',1);
            }
        });
		var totalnum = 0;
		$(".sid").each(function(index){
			totalnum += parseInt($(this).parent().find(".emoney").html());
		});
		console.log("totalnum:" + totalnum);
		totalnum = 0;
		$(".sidclick").click(function(){
			var testnum = 0;
			var testsid = parseInt($(".sidinput").val());
			$(".sid").each(function(index){
				if(parseInt($(this).html()) == testsid){
					testnum += parseInt($(this).parent().find(".emoney").html());
					$(this).parent().remove();
				}
			});
			totalnum += testnum;
			console.log(testsid + "服：" + testnum);
			console.log("totalnum:" + totalnum);
		})
	});
</script>
</body>
</html>