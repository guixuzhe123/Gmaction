<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>实时在线</title>
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
    <form method="post" action="<?php echo U('Apply/proplist');?>" name="form1" id="form1">
    <div class="panel-heading">
        <label>状态</label>
        <select name='status' id="status" selectst="<?php echo ($status); ?>">
            <option value="4" class="statusoption">请选择审核状态</option>
            <?php if(is_array($status_list)): $i = 0; $__LIST__ = $status_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option class="statusoption" value='<?php echo ($vo["id"]); ?>' uhref="<?php echo U('Apply/proplist',array('status' => $vo['id']));?>"><?php echo ($vo["label"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        <!-- <input type="button" value="查询" class="subclick"/> -->
    </div>
    </form>
    <div class="panel-body">
        <table class="table table-bordered" style="text-align:center;vertical-align:middle;">
            <thead>
            <tr align="center">
				<td id="col1">编号</td>
                <td>区服id</td>
                <td>角色信息</td>
                <td>申请原因</td>
                <td>申请时间</td>
                <td>道具ID</td>
                <td>道具名称</td>
                <td>道具数量</td>
                <td>是否绑定</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
				<form method="post" action="<?php echo U('Apply/propreview');?>">
                <?php if(is_array($datas)): $i = 0; $__LIST__ = $datas;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
					<td><?php echo ($vo["id"]); ?></td>
                    <td><?php echo ($vo["autoid"]); ?></td>
                    <td><?php echo ($vo["characters"]); ?></td>
                    <td><?php echo ($vo["apply_reason"]); ?></td>
                    <td><?php echo (date("Y-m-d H:i:s",$vo["apply_time"])); ?></td>
                    <td><?php echo ($vo["propid"]); ?></td>
                    <td><?php echo ($vo["propname"]); ?></td>
                    <td><?php echo ($vo["propnum"]); ?></td>
                    <td><?php if(($vo["isbind"]) == "0"): ?>绑定<?php else: ?>不绑定<?php endif; ?></td>
                    <td><?php if(is_array($status_list)): $i = 0; $__LIST__ = $status_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voo): $mod = ($i % 2 );++$i; if(($voo["id"]) == $vo["status"]): echo ($voo["label"]); endif; endforeach; endif; else: echo "" ;endif; ?></td>
					<td>
						<?php if(($vo["status"]) == "0"): ?><input name="review[<?php echo ($vo["id"]); ?>]" type="radio" value="1"/>通过
							<input name="review[<?php echo ($vo["id"]); ?>]" type="radio" value="0"/>驳回<?php endif; ?>
					</td>
                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr><td colspan="11" align="right"><?php echo ($page); ?></td></tr>
				<tr><td align="right" colspan="11">操作理由：<input size="100" type="text" name="reason" /></td></tr>
				<tr><td align="right" colspan="11"><input type="submit" value="处理" /></td></tr>
				</form>
            </tbody>
			
        </table>
    </div>
    
</div>
<script>
    $(document).ready(function(){
        $(".statusoption").each(function(index){
            if($(this).val() == $("#status").attr('selectst')){
                $(this).attr('selected','1');
            }
        })
        $("#status").change(function(){
            var url;
            var selectid = $(this).val();
            $(".statusoption").each(function(index){
                if($(this).val() == selectid){
                    url = $(this).attr('uhref');
                }
            });
            $("#form1").attr('action',url);
            form1.submit();
        })
    })
</script>
</body>
</html>