$(document).ready(function() {
	jQuery.jqtab = function(tabtit,tab_conbox,shijian) {
		$(tab_conbox).find("li").hide();
		$(tabtit).find("li:first").addClass("caseli").show(); 
		$(tab_conbox).find("li:first").show();
	
		$(tabtit).find("li").bind(shijian,function(){
		  $(this).addClass("caseli").siblings("li").removeClass("caseli"); 
			var activeindex = $(tabtit).find("li").index(this);
			$(tab_conbox).children().eq(activeindex).show().siblings().hide();
			return false;
		});
	
	};
	/*调用方法如下：*/
	//$.jqtab(".accur-content",".accur_con","mouseenter");
	$.jqtab(".case-content",".casebody","click");
	$.jqtab("#From_tit","#From_con","mouseenter");
	//$.jqtab(".accur-content",".accur_con","click");
});

document.writeln('<style type="text/css">*html{background-image:url(about:blank);background-attachment:fixed;}.solu_top{display:none;width:58px;height:140px;position:fixed;_position:absolute;bottom:100px;_bottom:auto;left: 50%; margin-left:600px;cursor:pointer;z-index:200;}.solu_top a {display:block;width:58px;height:44px; font-size:18px; font-weight:bold;text-align:center;line-height:22px; padding:7px 0px;color:#fff;}.solu_top a.qqtop{background:url(/img/qq.png) no-repeat;}.solu_top a.qqtop:hover{background:#d31d02; text-decoration:none; color:#fff;}.solu_top a.qqtop span{display:none;}.solu_top a.qqtop:hover span{display:block;background:#d31d02; color:#fff;}.solu_top a#ToTop{background:url(/img/solu_top.png) no-repeat;}.solu_top a#ToTop:hover{text-decoration:none; color:#fff;}.solu_close{width:58px; height:20px; background:url(/img/close-h.jpg) no-repeat;}.solu_top a#ToTop{background-position:0 0;}.solu_top a#ToTop:hover {background-position:-60px 0;text-decoration:none}.solu_top a.solu_a{background-position:0px -60px;}.solu_top a.solu_a:hover {background-position:-60px -60px;text-decoration:none}</style>');
document.writeln('<div class="solu_top" id="solu_top">');
document.writeln('<a href="http://wpa.qq.com/msgrd?v=3&uin=4006876308&site=qq&menu=yes" class="qqtop" target="_blank"><span>QQ<br>客服</span></a>');
document.writeln('<a href="javascript:void(0);" id="ToTop" title="返回顶部"></a>');
document.writeln('<div class="solu_close" title="关闭"></div>');
document.writeln('</div>');
(function() {
	var $call=0;
	var $callhd=0;
	$(".solu_close").click(function(){$('#solu_top').hide();$call=1;});
//	$(window).bind("scroll.header", function() {
//		var st = $(document).scrollTop(), winh = $(window).height();
//		var domWidth=$(window).width();
//		if($callhd<1){(st > 50) ? $('#header').addClass("header_h") : $('#header').removeClass("header_h");}    
//        if(!window.XMLHttpRequest) { $('#header').css("top", 0);}//IE6
//	});
	$(window).bind("scroll.solu_top", function() {
		var st = $(document).scrollTop(), winh = $(window).height();
		var domWidth=$(window).width();
		if($call<1){(st > 10) ? $('#solu_top').show() : $('#solu_top').hide();
        if(!window.XMLHttpRequest) { $('#solu_top').css("top", st + winh - 365);}//IE6
		if(domWidth<1200){$('#solu_top').css("margin-left", domWidth/2-60);}}
	});
	$('#ToTop').click(function(){$('html,body').animate({scrollTop: '0px'}, 400);return false;});
})();
$(function(){
  $(".main_nav_in>li").hover(function() {
	$(this).siblings('li').find("dl").hide();	
	$(this).find("dl").fadeTo("slow",1);
  },function(){
	$(this).find("dl").hide();
  });
  
/*动态菜单 begin*/
$(document).ready(function() {
    $(".prdIntrotp .prdIn_pic").hover(function() {
        // this function is fired when the mouse is moved over
        $(".out", this).stop().animate({ 'top': '110px' }, 250); // move down - hide
        $(".over", this).stop().animate({ 'top': '0px' }, 250); // move down - show
    }, function() {
        // this function is fired when the mouse is moved off
        $(".out", this).stop().animate({ 'top': '0px' }, 250); // move up - show
        $(".over", this).stop().animate({ 'top': '-110px' }, 250); // move up - hide
    });
});
/*动态菜单 end*/

//  $(".prdIn_pic").hover(function() {
//	$(this).find("div").show();
//	
//  },function(){
//	$(this).find("div").hide();
//  });
var setTab;
   $(document).ready(function(){ 
     $(".wqcontent_txt dd").each(function(index){   
    $(this).hover(function(){
    var now=$(this);
    setTab=setTimeout(function(){
    $("div.display").removeClass("display");
    $(".wqcontent_txt dd.wqcontent_tdd").removeClass("wqcontent_tdd");
    
      $(now).addClass("wqcontent_tdd");
    $(".wqcontent_pic div").eq(index).addClass("display"); 
  },10);
  })
  .mouseout(function(){
       clearTimeout(setTab);
  }); 
 });
    });

  $("#product1").hover(function() {
	$(this).find("dt").addClass("product_pic_ico1_hover").removeClass("product_pic_ico1");
  },function(){
	$(this).find("dt").addClass("product_pic_ico1").removeClass("product_pic_ico1_hover");
  });
//  $funcA = $(".product")
//  //tabhover时修改img路径，使其变为动画
//    function hoverAlterImg(obj) {
//        var $image, srcOld, srcNew;
//        obj.hover(function() {
//            $image = $(this).find('img');
//            srcOld = $image.attr('src'); 
//            srcNew = srcOld.substr(0, srcOld.length-4) + "-hover.gif"
//            $image.attr('src', srcNew);
//        }, function() {
//            $image.attr('src', srcOld);
//        });
//    }
//    hoverAlterImg($funcA);
});
(function($){
$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _btnUp = $("#"+ opt.up);//Shawphy:向上按钮
                var _btnDown = $("#"+ opt.down);//Shawphy:向下按钮
                var timerID;
                var _this=this.eq(0).find("ul:first");
                var     lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500; //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer //?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                var scrollUp=function(){
                        _btnUp.unbind("click",scrollUp); //Shawphy:取消向上按钮的函数绑定
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                                _btnUp.bind("click",scrollUp); //Shawphy:绑定向上按钮的点击事件
                        });

                }
                //Shawphy:向下翻页函数
                var scrollDown=function(){
                        _btnDown.unbind("click",scrollDown);
                        for(i=1;i<=line;i++){
                                _this.find("li:last").show().prependTo(_this);
                        }
                        _this.css({marginTop:upHeight});
                        _this.animate({
                                marginTop:0
                        },speed,function(){
                                _btnDown.bind("click",scrollDown);
                        });
                }
               //Shawphy:自动播放
                var autoPlay = function(){
                        if(timer)timerID = window.setInterval(scrollUp,timer);
                };
                var autoStop = function(){
                        if(timer)window.clearInterval(timerID);
                };
                 //鼠标事件绑定
                _this.hover(autoStop,autoPlay).mouseout();
                _btnUp.css("cursor","pointer").click( scrollUp ).hover(autoStop,autoPlay);//Shawphy:向上向下鼠标事件绑定
                _btnDown.css("cursor","pointer").click( scrollDown ).hover(autoStop,autoPlay);

        }       
})
})(jQuery);
