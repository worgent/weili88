$(function(){
	var bWidth = $("#focus_right").width(); //获取banner宽度
	var picNumber = $("#focus_right .focus_list li").length;  //获取图片张数
	var picTimer;
	//$("#focus_right .focus_list").css("width",bWidth*picNumber);  //设置图片列表的宽度
//	var btn = "<ul class='btn'>";  //构建按钮的DOM
//	for(var i=0; i < picNumber; i++) {
//		btn += "<li></li>";
//	}
//	btn += "</ul>";
//	$(".fmenu").append(btn);
})
;(function($) {
		   
	$.fn.featureList = function(options) {
		var tabs	= $(this);
		var output	= $(options.output);

		new jQuery.featureList(tabs, output, options);

		return this;	
	};

	$.featureList = function(tabs, output, options) {
		function slide(nr) {
			if (typeof nr == "undefined") {
				nr = visible_item + 1;
				nr = nr >= total_items ? 0 : nr;
			}

			tabs.removeClass('active').filter(":eq(" + nr + ")").addClass('active');
			var rol_shwP = "banner"+nr;
			$("#banner").attr("class",rol_shwP);
			//output.removeClass(rol_shwP);
			//var rol_shwP = "banner"+nr;
			//output.filter(":eq(" + nr + ")").addClass(rol_shwP);

			output.stop(true, true).filter(":visible").fadeOut();
			output.filter(":eq(" + nr + ")").fadeIn(function() {
				visible_item = nr;	
			});
		}

		var options			= options || {}; 
		var total_items		= tabs.length;
		var visible_item	= options.start_item || 0;

		options.pause_on_hover		= options.pause_on_hover		|| true;
		options.transition_interval	= options.transition_interval	|| 5000;

		output.hide().eq( visible_item ).show();
		tabs.eq( visible_item ).addClass('active');

		tabs.click(function() {
			if ($(this).hasClass('active')) {
				return false;	
			}

			slide( tabs.index( this) );
		});

		if (options.transition_interval > 0) {
			var timer = setInterval(function () {
				slide();
			}, options.transition_interval);

			if (options.pause_on_hover) {
				tabs.mouseenter(function() {
					clearInterval( timer );

				}).mouseleave(function() {
					clearInterval( timer );
					timer = setInterval(function () {
						slide();
					}, options.transition_interval);
				});
			}
		}
	};
})(jQuery);    
