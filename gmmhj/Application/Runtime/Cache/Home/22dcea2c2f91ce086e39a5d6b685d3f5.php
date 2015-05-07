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
    <style>
    *{margin:0;padding: 0;font-family: '微软雅黑';list-style: none;}
    .selectimitate{width: 157px;border: 1px solid #999;border-top: none;position: absolute;background: #fff;display: none;}
    .optionimitate:hover{background: #2d6ca2;color: #fff;}
    </style>
</head>
<body>
    <div class="panel panel-danger" style="margin:50px auto;min-width:1000px;width:90%;">
        <form method="post" action="">
            <div class="panel-heading">
                <h4>申请道具（通过邮件发送）</h4>
                <label>区服:</label>
                <?php echo ($server_html); ?><br/><br/>
                <label>角色列表(*):(可以输入角色id、账号、角色名，注意中英文符号区别)</label><br/>
                <input type="text" size="100" name="characters" value="" id="characters" /><br/><br/>
                <label>申请道具名称(*):(支持模糊查询)</label><br/>
                <input type="text" size="20" value="" name="propname" id="propname" />
                <div class="selectimitate">
                    <?php if(is_array($props)): $i = 0; $__LIST__ = $props;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="optionimitate" propid="<?php echo ($vo["propid"]); ?>"><?php echo ($vo["propname"]); ?></div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <input type="hidden" name="tempid" id="tempid">
                <br/><br/>道具对应ID&nbsp;<input class="form-control" id="propid" style="width:100px;display:inline-block;"><br/><br/>
                <label>申请道具数量(*):</label><br/>
                <input type="text" size="20" value="" name="propnum" id="propnum" /><br/><br/>
                <label>是否绑定(*):</label><br/>
                <select name="isBind" id="isBind">
                    <option value="0" selected>绑定</option>
                    <option value="1">不绑定</option>
                </select><br/><br/>
                <label>邮件内容(*):</label><br/>
                <input type="text" size="20" value="" name="apply_content" /><br/><br/>
                <label>申请原因(*):</label><br/>
                <input type="text" size="100" value="" name="reason" /><br/><br/>
                <input type="button" value="申请" class="submit"/>
            </div>
        </form>
    </div>
</body>
<script>
$(document).ready(function(){
    $(".submit").click(function(){
        var url = "<?php echo U('Apply/setprop');?>";
        var autoid = $("#autoid").val();
        var characters = $("#characters").val();
        var apply_reason = $("input[name='reason']").val()
        var content = $("input[name='apply_content']").val();
        var propid = $("#propid").val();
        var propnum = $("#propnum").val();
        var isbind = $("#isBind").val();
        var propname = $("#propname").val();
        $.post(url,{autoid:autoid,characters:characters,apply_reason:apply_reason,content:content,propid:propid,propnum:propnum,isbind:isbind,propname:propname},function(data){
            if(data == 1){
                alert('申请成功！');
                window.location.reload();
            }else{
                alert(data);
            }
        })
    });
    $("#propname").keyup(function(){
        var keyword = $(this).val();
        if(keyword == ''){
            $(".selectimitate").css('display','none');
        }else{
            $(".optionimitate").each(function(index){
                if($(this).html().indexOf(keyword) > -1){
                    $(this).css('display','block');
                }else{
                    $(this).css('display','none');
                }
            });
            $(".selectimitate").css('display','block');
        }
    });
    $(".optionimitate").click(function(){
        //alert($(this).html());
        $("#propname").val($(this).html());
        $("#tempid").val($(this).attr('propid'));
        $("#propid").val($(this).attr('propid'));
        $(".selectimitate").css('display','none');
    })
    $(".selectimitate").mouseleave(function(){
        $(this).css('display','none');
    });
});
    </script>
    </html>