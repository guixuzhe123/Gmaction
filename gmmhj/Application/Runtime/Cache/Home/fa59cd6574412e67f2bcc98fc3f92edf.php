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
    <form method="post" action="<?php echo U('Home/Reg/ip_query');?>">
    <div class="panel-heading">
        <label>IP封禁列表查询</label>&nbsp;&nbsp;<br/>
        <label>区服:</label>
        <?php echo ($server_html); ?>
        <input type="button" value="查询" class="iplock"/>
    </div>
    </form>
    <div class="panel-body" style="display:none;">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
				<tr><td colspan="2">
					<span class="iptitle"></span>IP封禁列表
				</td></tr>
                <tr>
                    <td>封禁IP</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody class="tb">
            </tbody>
        </table>
    </div>
    
</div>
<script>
	$(document).ready(function(){
		$(".iplock").click(function(){
            $(".tb").html("");
			$(".panel-body").show();
			$(".iptitle").html($("#autoid").find('option:selected').text());
			var url = "<?php echo U('Player/loadiplocklist');?>";
			var autoid = $("#autoid").val();
			$.post(url,{autoid:autoid},function(data){
				console.log(data);
                var obj = jQuery.parseJSON(data);
                for(var i = 0;i < obj.length;i++){
                    var str = "<tr><td>" + obj[i]['ip'] + "</td>"
                                + "<td><button type='button' class='btn btn-primary unlock' ip='" + obj[i]['ip'] + "'>解封</button></td></tr>";
                    $(".tb").append(str);
                }
                //alert(data);
			})
        });
        $(document).on('click','.unlock',function(){
            var url = "<?php echo U('Player/unlockip');?>";
            var autoid = $("#autoid").val();
            var ip = $(this).attr('ip');
            var ele = $(this).parent().parent();
            $.post(url,{autoid:autoid,ip:ip},function(data){
                if(data == 0){
                    alert('删除完成！');
                    ele.remove();
                    //window.location.reload();
                }
            })
        });
	});
    function ipunlock(ip){
        var url = "<?php echo U('Player/unlockip');?>";
        var autoid = $("#autoid").val();
        alert($(this).html());
        $.post(url,{autoid:autoid,ip:ip},function(data){
            if(data == 0){
                alert('删除完成！');
                //window.location.reload();
            }
        })
    }
</script>
</body>
</html>