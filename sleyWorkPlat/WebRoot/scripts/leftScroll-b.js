// JavaScript Document
	$(function(){
	$("#scroll").toggle(function(){						
		$("#scroll").removeClass("scroll_bg1").addClass("scroll_bg2");
		$(".left").hide();	
	},function(){
		$("#scroll").removeClass("scroll_bg2").addClass("scroll_bg1");
		$(".left").show();
	})
})