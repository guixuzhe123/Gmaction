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
    <form method="post" action="<?php echo U('Home/Player/info');?>">
    <div class="panel-heading">
        <label>玩家信息查询</label>
        <br/>
		<label>区服:</label>
        <?php echo ($server_html); ?>
        <label>平台来源：</label>
        <select name="resourceid" id="resourceid" class="form-control" style="width:200px;display:inline;" selectplat="<?php echo ($resourceid); ?>">
            <option value="0">请选择平台来源</option>
            <?php if(is_array($plats)): $i = 0; $__LIST__ = $plats;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["resource"]); ?>" class="platopt"><?php echo ($vo["platname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
        <label>角色ID:</label><input class="form-control" type="text" name="characterid" value="<?php echo ($info["characterid"]); ?>" style="width:150px;display:inline;"/>
        <label>角色名:</label><input class="form-control" type="text" name="charactername" value="<?php echo ($info["name"]); ?>" style="width:150px;display:inline;"/>
        <label>账号:</label><input class="form-control" type="text" name="account" value="<?php echo ($account); ?>" style="width:150px;display:inline;"/>
        &nbsp;&nbsp;<input type="submit" value="查询"/>
    </div>
    </form>
    <div class="panel-body" style="display:none;">
        <label>玩家信息</label>
        <table class="table table-bordered table-striped" style="text-align:center;vertical-align:middle;">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td align="right">账号：</td>
                    <td class="useraccount"><?php echo ($info["account"]); ?></td>
                    <td align="right">角色ID：</td>
                    <td><?php echo ($info["characterid"]); ?></td>
                    <td align="right">角色名：</td>
                    <td><?php echo ($info["name"]); ?></td>
                    <td align="right">性别：</td>
                    <td><?php if($info["profession"] == 1): ?>女
                        <?php else: ?>男<?php endif; ?></td>
                    <td align="right">等级：</td>
                    <td><?php echo ($info["level"]); ?></td>
                    <td align="right">经验：</td>
                    <td><?php echo ($info["experience"]); ?></td>
                </tr>
                <tr>
                    <td align="right">在线情况：</td>
                    <td><?php if($info["online"] == 0): ?><font style="color:#666">(当前离线)</font>
                        <?php else: ?>
                        当前在线<?php endif; ?></td>
                    <td align="right">创建时间：</td>
                    <td><?php echo ($info["create_character_time"]); ?></td>
                    <td align="right">最后登陆时间：</td>
                    <td><?php echo ($info["logintime"]); ?></td>
                    <td align="right">最后登陆IP：</td>
                    <td><?php echo ($info["loginIP"]); ?></td>
                    <td align="right">当前所在地点：</td>
                    <td><?php echo ($scenename); ?></td>
                </tr>
            </tbody>
        </table>
        <table class="table table-bordered table-striped" style="text-align:center;vertical-align:middle;">
            <thead>
                <tr>
                    <td colspan="12">角色信息</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="right">当前血量：</td>
                    <td><?php echo ($info["hp"]); ?></td>
                    <td align="right">最大血量：</td>
                    <td><?php echo ($info["maxhp"]); ?></td>
                    <td align="right">攻击：</td>
                    <td><?php echo ($info["attack"]); ?></td>
                    <td align="right">防御：</td>
                    <td><?php echo ($info["defence"]); ?></td>
                    <td align="right">命中：</td>
                    <td><?php echo ($info["hit"]); ?></td>
                    <td align="right">闪避：</td>
                    <td><?php echo ($info["dodge"]); ?></td>
                </tr>
                <tr>
                    <td align="right">暴击：</td>
                    <td><?php echo ($info["crit"]); ?></td>
                    <td align="right">韧性：</td>
                    <td><?php echo ($info["toughness"]); ?></td>
                    <td align="right">移动速度：</td>
                    <td><?php echo ($info["move_speed_second"]); ?></td>
                    <td align="right">战斗力：</td>
                    <td><?php echo ($info["combat"]); ?></td>
                    <td align="right">职业：</td>
                    <td><?php echo ($info["profession"]); ?></td>
                    <td align="right">服务器ID：</td>
                    <td><?php echo ($info["serverid"]); ?></td>
                </tr>
                <tr>
                    <td align="right">怒气：</td>
                    <td><?php echo ($info["super_power"]); ?></td>
                    <td align="right">罪恶值（PK值）：</td>
                    <td><?php echo ($info["vice"]); ?></td>
                    <td align="right">躲闪值：</td>
                    <td><?php echo ($info["body_balance"]); ?></td>
                    <td align="right">元力：</td>
                    <td><?php echo ($info["unit_power"]); ?></td>
                    <td align="right">升级道具已使用次数：</td>
                    <td><?php echo ($info["lv_item_use_num"]); ?></td>
                    <td align="right">罪恶值减少剩余时间：</td>
                    <td><?php echo ($info["vice_remain_time"]); ?></td>
                </tr>
                <tr>
                    <td align="right">元宝：</td>
                    <td><?php echo ($info["emoney"]); ?></td>
                    <td align="right">银两：</td>
                    <td><?php echo ($info["money"]); ?></td>
                    <td align="right">礼金：</td>
                    <td><?php echo ($info["vouchers"]); ?></td>
                <tr/>
            </tbody>
        </table>
        <table class="table table-bordered table-striped" style="text-align:center;vertical-align:middle;">
            <thead>
                <tr>
                    <td colspan="12">VIP信息</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="right">VIP等级：</td>
                    <td><?php echo ($vip["viplev"]); ?></td>
                    <td align="right">VIP经验：</td>
                    <td><?php echo ($vip["vipexp"]); ?></td>
                    <td align="right">充值金额：</td>
                    <td><?php echo ($summoney/10); ?>元</td>
                </tr>
            </tbody>
        </table>
        <table class="table table-bordered table-striped" style="text-align:center;vertical-align:middle;">
            <thead>
                <tr>
                    <td colspan="3">背包信息</td>
                </tr>
				<tr>
					<td colspan="2">道具</td>
					<td>装备</td>
				</tr>
				<tr>
					<td>名称</td>
					<td>数量</td>
					<td>名称</td>
				</tr>
            </thead>
            <tbody>
				<?php if(is_array($bagthing["item"])): $i = 0; $__LIST__ = $bagthing["item"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
						<td><?php echo ($vo["itemname"]); ?></td>
						<td><?php echo ($vo["overlap"]); ?></td>
						<td><?php echo ($bagthing["equipment"]["$i"]); ?></td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <table class="table table-bordered table-striped" style="text-align:center;vertical-align:middle;">
            <thead>
                <tr>
                    <td colspan="3">仓库信息</td>
                </tr>
				<tr>
					<td colspan="2">道具</td>
					<td>装备</td>
				</tr>
				<tr>
					<td>名称</td>
					<td>数量</td>
					<td>名称</td>
				</tr>
            </thead>
            <tbody>
				<?php if(is_array($storehousething["item"])): $i = 0; $__LIST__ = $storehousething["item"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
						<td><?php echo ($vo["itemname"]); ?></td>
						<td><?php echo ($vo["overlap"]); ?></td>
						<td><?php echo ($storehousething["equipment"]["$i"]); ?></td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </tbody>
        </table>
        <p>
            <button type="button" class="btn btn-primary killuser">踢玩家下线</button>
            <button type="button" class="btn btn-primary SilenceUser">玩家禁言</button>
            <button type="button" class="btn btn-primary UnsetSilenceUser">解除禁言</button>
            <button type="button" class="btn btn-primary Lock">锁定账号</button>
            <button type="button" class="btn btn-primary Unlock">解锁账号</button>
            <button type="button" class="btn btn-primary ReturnCity">强制回城</button>
        </p>
    </div>
    <input type="hidden" class="showbody" value="<?php echo ($showbody); ?>" issilence="<?php echo ($isSilence); ?>" islock="<?php echo ($isLock); ?>"><!-- isSilence为1表示已经禁言，0表示未禁言 -->
</div>
<script>
    $(document).ready(function(){
        if($(".showbody").val() == 1){
            $(".panel-body").css('display','block');
        }
        if($(".showbody").attr('isSilence') == 1){
            $(".SilenceUser").css('display','none');
            $(".UnsetSilenceUser").css('display','inline-block');
        }else{
            $(".SilenceUser").css('display','inline-block');
            $(".UnsetSilenceUser").css('display','none');
        }
        if($(".showbody").attr('islock') == 1){
            $(".Lock").css('display','none');
            $(".Unlock").css('display','inline-block');
        }else{
            $(".Lock").css('display','inline-block');
            $(".Unlock").css('display','none');
        }
        $(".killuser").click(function(){
            var url = "<?php echo U('Player/KillUser');?>";
            var autoid = $("#autoid").val();
            var characterid = $('input[name=characterid]').val();
            $.post(url,{autoid:autoid,characterid:characterid},function(data){
                if(data == 0){
                    alert('玩家已下线！');
                }else{
                    alert('操作失败！');
                }
            });
        });
        $(".SilenceUser").click(function(){
            var url = "<?php echo U('Player/SilenceUser');?>";
            var autoid = $("#autoid").val();
            var name = $('input[name=charactername]').val();
            $.post(url,{autoid:autoid,name:name},function(data){
                if(data == 0){
                    alert('禁言成功！');
                    $(".SilenceUser").css('display','none');
                    $(".UnsetSilenceUser").css('display','inline-block');
                }else{
                    alert('禁言失败！');
                }
            });
        });
        $(".UnsetSilenceUser").click(function(){
            var url = "<?php echo U('Player/UnsetSilenceUser');?>";
            var autoid = $("#autoid").val();
            var name = $('input[name=charactername]').val();
            $.post(url,{autoid:autoid,name:name},function(data){
                if(data == 0){
                    alert('解禁成功！');
                    $(".SilenceUser").css('display','inline-block');
                    $(".UnsetSilenceUser").css('display','none');
                }else{
                    alert('解禁失败！');
                }
            });
        });
        $(".Lock").click(function(){
            var url = "<?php echo U('Player/Lock');?>";
            var autoid = $("#autoid").val();
            var account = $('.useraccount').html();
            var resourceid = $("#resourceid").val();
            $.post(url,{autoid:autoid,account:account},function(data){
                if(data == 0){
                    alert('锁定成功！');
                    $(".Lock").css('display','none');
                    $(".Unlock").css('display','inline-block');
                }else{
                    alert('锁定失败！');
                }
            })
        })
        $(".Unlock").click(function(){
            var url = "<?php echo U('Player/Unlock');?>";
            var autoid = $("#autoid").val();
            var account = $('.useraccount').html();
            var resourceid = $("#resourceid").val();
            $.post(url,{autoid:autoid,account:account},function(data){
                if(data == 0){
                    alert('解锁成功！');
                    $(".Lock").css('display','inline-block');
                    $(".Unlock").css('display','none');
                }else{
                    alert('解锁失败！');
                }
            })
        })
        $(".ReturnCity").click(function(){
            var url = "<?php echo U('Player/ReturnCity');?>";
            var autoid = $("#autoid").val();
            var characterid = $('input[name=characterid]').val();
            $.post(url,{autoid:autoid,characterid:characterid},function(data){
                if(data == 0){
                    alert('回城成功！');
                }else{
                    alert('回城失败！');
                }
            })
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
    });
</script>
</body>
</html>