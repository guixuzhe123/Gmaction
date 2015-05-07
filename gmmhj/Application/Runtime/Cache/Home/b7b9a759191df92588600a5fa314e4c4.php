<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>申请充值</title>
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
            <form method="post" action="">
                <div class="panel-heading">
                    <h4>全服申请礼金</h4>
                    <label>区服:</label>
                    <?php echo ($server_html); ?><br/><br/>
                    <label>申请礼金数量(*发送的为五礼金礼包):</label><br/>
                    <input type="text" size="20" value="" name="apply_gold" id="apply_gold" /><br/><br/>
                    <label>邮件内容(*):</label><br/>
                    <!-- <input type="text" size="20" value="" name="apply_content" /><br/><br/> -->
                    <textarea class="form-control apply_content" rows="3" name="apply_content"></textarea>
                    <input type="button" value="申请" class="submit"/>
                </div>
            </form>
        </div>
        <script>
        $(document).ready(function(){
            $(".submit").click(function(){
                var url = "<?php echo U('Home/Apply/sendcashgift');?>";
                var autoid = $('#autoid').val();
                var apply_gold = $('#apply_gold').val();
                var apply_content = $(".apply_content").val();
                var isbind = $("#isBind").val();
                $.post(url,{autoid:autoid,apply_gold:apply_gold,apply_content:apply_content,isbind:isbind},function(data){
                    if(data == 0){
                        alert('申请成功！');
                    }else{
                        alert('申请失败！');
                    }
                    //alert(data);
                })
            });
            $(".content").keydown(function(){
                if($(this).val().length >= 300){
                    alert('字数超过限制！');
                    $(this).val($(this).val().substr(0,299));
                }
            })
        });
</script>
    </body>
</html>