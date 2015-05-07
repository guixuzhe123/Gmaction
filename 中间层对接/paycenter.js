$(document).ready(function(){
	//var clickorhover = 0;
	var oldhtml = "对应元宝数量：";
	var basebili = 10;
	var gids = new Array();
	$(".lastgameserver").each(function(index){
		//最近游戏的游戏名和服务器
		//$(".gamelist .newplay *").show();
		var gid = $(this).attr('gid');
		var gname = '';
		if(jQuery.inArray(gid,gids) == -1){
			gids[index] = gid;
			$(".gamedata").each(function(index){
				//根据gid查找对应的游戏名
				if($(this).attr('gid') == gid){
					gname = $(this).html();
					//alert($(this).html());
					//return false;
				}
			});
			var temphtml = "<input type='radio'/>&nbsp;<label gid='" + $(this).attr('gid') + "'>" + gname + "</label>";
			$(".gamelist .newplay").append(temphtml);
		}
		//alert($(this).html());

	});
	//隐藏所有游戏列表
	$(".gl").css('display','none');
	$(".sl").hide();
	$(".selectgame").click(function(){
		//显示游戏列表
		$(".serverlist").hide();
		$(".gamelist .char span").eq(0).trigger('click');
		$(".gamelist").show();
	});
	$(".selectserver").click(function(){
		//显示服务器列表
		$(".gamelist").hide();
		$(".serverlist .char span").eq(0).trigger('click');
		$(".serverlist").show();
	})
	$(".char .close").click(function(){
		//隐藏游戏列表
		$(".gamelist").hide();
		$(".serverlist").hide();
	});
	$(".char").find("span").click(function(){
	//单击不同的游戏列表显示不同的内容
		$(".char").find("span").each(function(index){
			//所有游戏指针背景清除；
			$(this).css('background','none');
		});
		var spanid = $(this).index();
		$(this).css('background','white');
		var actfor = $(this).parent().attr('actfor');
		if(actfor == 'gl'){
			$(".gl").each(function(index){
				//循环游戏列表，对序号相同的进行显示操作
				$(this).hide();
				if(index == spanid){
					$(this).show();
				}
			});
		}
		if(actfor == 'sl'){
			$(".sl").each(function(index){
				//循环服务器列表，对序号相同的进行显示操作
				$(this).hide();
				if(index == spanid){
				$(this).show();
				}
			});
		}
		
	});
	
	
	$(".gl label").click(function(){
		//点击游戏后，在对应位置显示并显示服务器列表
		$(".selectgame span").html($(this).html());
		$(".gamelist").hide();
		$.showselect($(this).attr('gid'));
		$("input[name='gid']").val($(this).attr('gid'));
		//clickorhover = 1;
	})
	$(".fr a.confirm").click(function(){
		//输入选服，点击确定
		var selectsid = $(this).prev().find("input").val();
		$(".sl label").each(function(index){
			//循环服务器列表，找到对应的服务器进行模拟点击，否则弹出警告信息
			//alert(index);
			if($(this).attr('slid') == selectsid){
				$(this).trigger('click');
				return false;
			}
		});
		if($(this).is(":visible")){
			alert('不存在该服务器');
		}
		//alert('找不到该服务器！');
	});
	$(".moneyblock span").click(function(){
		//点击充值金额，显示对应元宝
		//clickorhover = 1;
		var money1 = $(this).html();
		$(this).prev().attr('checked',1);
		money1 = money1.substr(0,money1.length - 1);
		$("input[name='payMoney']").val(money1);
		$("input[name='rate2']").val(money1);
		$("input[name='moneyNum']").val(money1);
		$("input[name='gamemoney']").val(money1 * basebili);
		$(".brtr2-tr3 .emoney").html('' + oldhtml + (money1 * basebili) +  "&nbsp;<font color='#f6611f'>[兑换比例为1:" + basebili + "]</font>");
	});
	
	$(".brtr2-tr3 .othermoney").click(function(){
		//点击其他金额，右边的单选框为选中状态
		$(this).prev().prev().attr('checked','checked');
	}).blur(function(){
		//失去焦点后在对应位置显示元宝
		var money2 = $(this).val();
		if(!isNaN(money2)){
			$("input[name='payMoney']").val(money2);
			$("input[name='rate2']").val(money2);
			$("input[name='moneyNum']").val(money2);
			$(".brtr2-tr3 .emoney").html('' + oldhtml + (money2 * 10) + "&nbsp;<font color='#f6611f'>[兑换比例为1：10]</font>");
		}else{
			alert('请输入正确的金额！');
		}
	});
	$("input[name='tradepassword']").blur(function(){
		//alert($(this).val());
		$("input[name='paymentpassword']").val($(this).val());
	})
	$(".banka").click(function(){
		//点击银行
		var inputid = $(this).attr('forradio');
		$("input[name='bankid']").val($("#" + inputid).val());
		$("#" + inputid).trigger('click');
	});
	$(".bodyleftbottom .tr1").click(function(){
		//点击一种充值方式
		//console.log($(this).index());
		$(".tr1 .td2 .current3").removeClass('current3');
		$(this).find('span').addClass('current3');
		basebili = $(this).attr('bili');
		var code = $(this).attr('code');
		$("input[name='code']").val(code);
		$(".brtr2-tr3 .emoney").html(oldhtml);
		var paytype = $(this).attr('paytype');
		switch(paytype){
			case "1":
				//银行卡（易宝）
				$(".platcoin2").hide();
				$(".gamelabel").trigger('click');
				$(".cardmoney").hide();
				$(".normalmoney .default span").trigger('click');
				$(".normalmoney").show();
				$(".banktl").show();
				$(".bank").show();
				$(".platinput,.platlabel").show();
				break;
			case "2":
				//卡类支付
				$(".normalmoney").hide();
				$(".banktl").hide();
				$(".bank").hide();
				$(".platcoin2").hide();
				$(".gamelabel").trigger('click');
				$(".cardmoney .default").find("span").trigger('click');
				$('.cardmoney').show();
				$(".platinput,.platlabel").show();
				break;
			case "3":
				//平台币支付
				$(".cardmoney").hide();
				$(".banktl").hide();
				$(".bank").hide();
				$(".platinput,.platlabel").hide();
				$(".normalmoney .default").find("span").trigger('click');
				$(".gamelabel").trigger('click');
				var temphtml = "<input type='hidden' name='paymentpassword'/>";
				$("form[name='form2']").append(temphtml);
				$(".platcoin2").show();
				$(".normalmoney").show();
				break;
			case "4":
				//支付宝
				$(".platcoin2").hide();
				$(".gamelabel").trigger('click');
				$(".cardmoney").hide();
				$(".banktl").hide();
				$(".bank").hide();
				$(".normalmoney .default span").trigger('click');
				$(".normalmoney").show();
				$(".platinput,.platlabel").show();
				break;
		}
	});
	$("input[name='pay_for']").next().click(function(){
		//选择充值到哪里
		$(this).prev().attr('checked',1);
		var payfor = $(this).attr('class');
		switch(payfor){
			case 'gamelabel':
				$(".platcoin").hide();
				$(".gamesel").show();
				$("input[name='pay_for']").val('game');
				break;
			case 'platlabel':
				$(".platcoin").show();
				$(".gamesel").hide();
				$(".gamelist").hide();
				$(".serverlist").hide();
				$("input[name='pay_for']").val('platform');
				break;
			default:
				break;
		}
	});
	$("input[name='pay_for']").click(function(){
		//选择充值方式单选按钮
		$(this).next().trigger('click');
	})
	$(".gamedata").each(function(index){
		//游戏数据更新到游戏列表中
		var gid = $(this).attr('gid');
		var firstletter = $(this).attr('firstletter').toLowerCase();
		$(".gl-" + firstletter).find("label").html($(this).html()).attr('gid',gid);
		$(".gl-" + firstletter).show();
	});
	

	$.showselect = function(gid){
		//通过gid获取最近玩过的服务器，并显示服务器列表
		$(".selectserver").trigger('click');
		//alert(gid);
		$(".serverlist .newplay").html("");
		$(".lastgameserver").each(function(index){
			//检查最近游戏中有没有这个id，有的话在服务器列表的最近玩过显示
			if($(this).attr('gid') == gid){
				var temphtml = "<input type='radio'/>&nbsp;<label sid='" + $(this).attr('sid') + "' platcode='" + $(this).attr('platcode') + "'>" + $(this).html() + "</label>";
				$(".serverlist .newplay").append(temphtml);
			}
		});
		//$.hoverstyle();
		var url = "http://www.3595.com/PayCenter/getserverlist";
		$.ajax({
				type:"POST",
				url:url,
				async:false,
				data:{gid:gid},
				success:function(data){
					var obj = jQuery.parseJSON(data);
					var len = obj.length;
					if(len <= 100){
						$(".serverlist .sl").eq(1).html("");
						$(".serverlist .char span").eq(1).show();
						for(var i = 0;i < len;i++){
							var temphtml = "<input type='radio' name='slist' value='" + obj[i]['sid'] + "'/>&nbsp;<label slid='" + (i + 1) + "' sid='" + obj[i]['sid'] + "' platcode='" + obj[i]['platcode'] + "'>" + obj[i]['name'] + "</label>";
							$(".serverlist .sl").eq(1).append(temphtml);
						}
					}else{
						if(len <= 200){
							$(".serverlist .char span").eq(1).show();
							$(".serverlist .char span").eq(2).show();
						}
					}
				}
			})
		/*$.post(url,{gid:gid},function(data){
			//console.log(data);
			var obj = jQuery.parseJSON(data);
			var len = obj.length;
			if(len <= 100){
				$(".serverlist .sl").eq(1).html("");
				$(".serverlist .char span").eq(1).show();
				for(var i = 0;i < len;i++){
					var temphtml = "<input type='radio' name='slist' value='" + obj[i]['sid'] + "'/>&nbsp;<label slid='" + (i + 1) + "' sid='" + obj[i]['sid'] + "' platcode='" + obj[i]['platcode'] + "'>" + obj[i]['name'] + "</label>";
					$(".serverlist .sl").eq(1).append(temphtml);
				}
			}else{
				if(len <= 200){
					$(".serverlist .char span").eq(1).show();
					$(".serverlist .char span").eq(2).show();
				}
			}
			//$.hoverstyle();
		});*/
		$.hoverstyle();
	}

	$.hoverstyle = function(){
		$(".gl label,.sl label,.moneyblock span").on({
			mouseover:function(){
				//添加下划线
				$(this).css('text-decoration','underline');
				$(this).css('color','#f6611f');
				//$(this).prev().trigger('click');
			},
			mouseleave:function(){
				//删除下划线
				$(this).css('color','#6a6a6a');
				$(this).css('text-decoration','none');
				/*if(clickorhover == 1){
					clickorhover = 0;
				}else{
					$(this).prev().attr('checked',false);
				}*/
			}
		});
		$(".sl label").on('click',function(){
			//点击服务器后，在对应位置显示
			$(".selectserver span").html($(this).html());
			$(".serverlist").hide();
			$("input[name='sid']").val($(this).attr('sid'));
			$(this).prev().attr('checked',1);
			var url = "http://www.3595.com/PayCenter/checkuser";
			var platcode = $(this).attr('platcode');
			var username = $("input[name='username']").val();
			$.ajax({
				type:"POST",
				url:url,
				async:false,
				data:{username:username,platcode:platcode},
				success:function(data){
					var obj = jQuery.parseJSON(data);
					if(obj.code != 1){
						alert('无法找到对应角色！');
						$(".selectserver").html("<span>请选择游戏服务器</span>");
						$("input[name='sid']").val("");
					}
				}
			})
			//console.log(platcode);
			//console.log(username);
			//clickorhover = 1;
		});
		$(".moneyblock input,.sl input,.gl input").on('click',function(){
			//点击单选按钮，右侧span模拟点击
			$(this).next().trigger('click');
		});
	}
	$.hoverstyle();
	$("input[name='bankid1']").click(function(){
		$("input[name='bankid']").val($(this).val());
	})
	$(".banka").eq(0).trigger('click');
	$(".JUN").click(function(){
		$(".hint").html("");
		var temphtml = "<p style='font-weight:bold;'>重要提示</p>" + 
						"<p style='color:red;font-size:14px;'>1、请按卡面金额进行充值，如填写额度不正确可能会无法完成充值；</p>" +
						"<p style='color:#999;font-size:14px;'>2、支持的面额：10元、15元、20元、30元、50元、100元;</p>" + 
						"<p style='color:#999;font-size:14px;'>3、不能使用特定游戏专属充值卡支付。</p>";
		$(".hint").append(temphtml);
		$("input[name='bankid']").val('JUNNET-NET');
	});
	$(".SHEN").click(function(){
		$("input[name='bankid']").val('SZX-NET');
	});
	$(".LIAN").click(function(){
		$("input[name='bankid']").val('UNICOM-NET');
	});
	$(".DIAN").click(function(){
		$("input[name='bankid']").val('TELECOM-NET');
	});
	$(".ZHENG").click(function(){
		$("input[name='bankid']").val('ZHENGTU-NET');
	});
	$(".SHENG").click(function(){
		$("input[name='bankid']").val('SNDACARD-NET');
	});
	$(".WANG").click(function(){
		$("input[name='bankid']").val('NETEASE-NET');
	});
	$(".TIAN").click(function(){
		$("input[name='bankid']").val('TIANXIA-NET');
	});
	$(".bodyleftbottom .tr1").eq($(".leftselect").html()).trigger('click');	
	$(".page1submit").on('click',function(){
		if($("input[name='pay_for']").val() == 'game'){
			if($("input[name='gid']").val() == ''){
				alert("请选择要充值的游戏！");
				return false;
			}
			if($("input[name='sid']").val() == ''){
				alert("请选择要充值的服务器！");
				return false;
			}
		}else{
			/*if($("input[name='pay_for']").val() == 'platform'){
				alert("暂不支持充值到平台！");
				return false;
			}*/
		}
		if($("input[name='gamemoney']").val() == ''){
			alert("请选择要充值的金额！");
			return false;
		}
		if($("input[name='payMoney']").val() < 10){
			alert("充值金额不能低于10元！");
			return false;
		}
		if($("input[name='code']").val() == 'platform'){
			if($("input[name='paymentpassword']").val() == ''){
				alert("请输入交易密码！");
				return false;
			}
		}
		form2.submit();
	});

});
