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
    <form method="post" action="<?php echo U('Topcombat/index');?>" name="form1">
    <div class="panel-heading">
        <label>战斗力排行榜</label>&nbsp;&nbsp;<br/>
        <label>区服:</label>
        <?php echo ($server_html); ?>
        <input type="button" value="查询" class="iplock"/>
    </div>
    </form>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
				<tr><td colspan="5">
					<span class="iptitle"></span>战斗力前十排行榜
				</td></tr>
                <tr>
                    <td>区服</td>
                    <td>账号</td>
                    <td>角色名</td>
                    <td>战斗力</td>
                    <td>等级</td>
                </tr>
            </thead>
            <tbody class="tb">
                <?php if(is_array($datas)): $i = 0; $__LIST__ = $datas;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                        <td><?php echo ($sid); ?>服</td>
                        <td><?php echo ($vo["account"]); ?></td>
                        <td><?php echo ($vo["name"]); ?></td>
                        <td><?php echo ($vo["combat"]); ?></td>
                        <td><?php echo ($vo["level"]); ?></td>
                    <tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
    </div>
    
</div>
<script>
	$(document).ready(function(){
		$(".iplock").click(function(){
            form1.submit();
        });
	});
</script>
</body>
</html>