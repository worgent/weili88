$(function(){
	//首先将#back-to-top隐藏
	$(".bottom_po").hide();
	//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
	$(function () {
		$(window).scroll(function(){
			if ($(window).scrollTop()>10){
				$(".bottom_po").fadeIn();
			}
			else
			{
				$(".bottom_po").fadeOut();
			}
		});
	});
}); 
document.write('<div class="bottom_po png" style="display: block;"><div class="btmdiv"><a class="ah" target="_blank" href="http://www.taiqiu8.cn/member/invite.php?user=cwqpapertop&goto=register"></a><a class="bh" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=4006876308&site=qq&menu=yes"></a></div></div>');
document.write('<style type="text/css">.bottom_po{background:#000; z-index:20; position: fixed; bottom:0; left:0; opacity:0.8;filter:alpha(opacity=80); -moz-opacity:0.8;-khtml-opacity:0.8;width:100%;  _position:absolute;_bottom:auto;_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)))}.bottom_po .btmdiv{height:55px; margin:0 auto; width:980px;  position:relative;background:url(/img/cwq_bottom.png) center 0 no-repeat; display:block; }.bottom_po .btmdiv a{position:absolute;  top:0px; width:80px; height:55px;display:block;}.bottom_po .btmdiv a.ah{right:105px;}.bottom_po .btmdiv a.bh{right:5px;}</style>');

