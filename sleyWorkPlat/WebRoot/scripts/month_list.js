// JavaScript Document
$(function(){
	$(".icon").toggle(function(){
				$(this).css("background","url(../images/index/triangle_darkblue_open.png) no-repeat scroll 0 0");
				$(this).parent().siblings().show();
				
			},function(){
				$(this).css("background","url(../images/index/triangle_darkblue.png) no-repeat scroll 0 0");
				$(this).parent().siblings().hide();
			});
})
			