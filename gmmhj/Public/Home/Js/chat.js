(function(){

    var timerc = 0;//计时器
    var endtime = 1;//默认清空时间
    var counttime = 1;//默认1分钟清空
    window.CHAT = {
        genUid:function(){
            return new Date().getTime() + "" + Math.floor(Math.random() * 899 + 100);
        },
        init:function(username){
            this.userid = this.genUid();
            this.useusername;

            //连接websocket后端服务器
            this.socket = io.connect('ws://121.201.104.239:8000');

            //告诉服务器端有用户登录
            this.socket.emit('login',{userid:this.userid,username:this.username});

            //监听消息发送
            this.socket.on('message',function(obj){
                if(sid == 0){
                    if(channelid != 0){
                        if(obj.channel != channelid){
                            return false;
                        }
                    }
                }else{
                    if(obj.sid == sid){
                        if(channelid != 0){
                            if(obj.channel != channelid){
                                return false;
                            }
                        }
                    }else{
                        return false;
                    }
                }
                switch(obj.channel){
                    case '1':
                        channelname = '当前';
                        break;
                    case '2':
                        channelname = '阵营';
                        break;
                    case '3':
                        channelname = '公会';
                        break;
                    case '4':
                        channelname = '队伍';
                        break;
                    case '5':
                        channelname = '传音';
                        break;
                    case '6':
                        channelname = '交易';
                        break;
                    case '7':
                        channelname = '系统';
                        break;
                    case '8':
                        channelname = '副本';
                        break;
                    case '9':
                        channelname = '战场';
                        break;
                    case '100':
                        channelname = '私聊';
                        break;
                    default:
                        channelname = '未知';
                        break;
                }
                var addhtml = "<div class='unit'>" +
                                "<div class='leftblock'><button type='button' class='btn btn-primary lock' sid='" + obj.sid +"' account = '" + obj.account + "'>封号</button>&nbsp;" +
                                "<button type='button' class='btn btn-primary iplock' ip='" + obj.ip + "'>IP黑名单</button>&nbsp;" +
                                "<button type='button' class='btn btn-primary ipblock' ip='" + obj.ip + "'>IP段黑名单</button>&nbsp;" +
                                "&nbsp;&nbsp;<span>" + channelname + "</span>" + 
                                "&nbsp;&nbsp;<span>S" + obj.sid + "</span>" + 
                                "&nbsp;<span>" + obj.time + "</span>" + 
                                "&nbsp;&nbsp;<span class='username'>" + obj.charactername + ":</span></div><div class='rightblock'>" + 
                                "&nbsp;&nbsp;<span class='chatcontent'>" + obj.content + "</span></div>" + 
                              "</div><div class='clear'></div>";
                $(".panel-body").append(addhtml);
                var maxheight = Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
                //console.log(maxheight);
                $(".panel-body").scrollTop(999999);
                //$(".panel-body").scrollIntoView();
                var scrollHeight = $(document).height();
                console.log(scrollHeight);
            });
        },
        clear:function(minute){
            if(typeof(startend) != 'undefined'){
                clearTimeout(startend);
            }
            endtime = new Date().getTime() + minute * 60 * 1000;
            counttime = minute;
            this.countdown();
        },
        countdown:function(){
            starttime = new Date().getTime();
            if(starttime < endtime){
                clearTimeout(startend);
                if((endtime - starttime) < 10000){
                    $(".timehint").css('color','red');
                }else{
                    $(".timehint").css('color','black');
                }
                showtime = endtime - starttime;
                minutes = Math.floor(showtime / 60 / 1000);
                seconds = Math.floor((showtime - minutes * 60 * 1000) / 1000);
                minutes = minutes < 10 ? '0' + minutes : minutes;
                seconds = seconds < 10 ? '0' + seconds : seconds;
                $(".timehint").html(minutes + ":" + seconds);
                var startend  = setTimeout(function(){this.CHAT.countdown();},1000);
            }else{
                $(".panel-body").empty();
                clearTimeout(startend);
                this.clear(counttime);
            }
        }
    };
 })();
