// max min JavaScript Document
$(function(){
		   $(".min").toggle(function(){
				$(this).attr("src","../img/max.gif").attr("title","10000");
				$(".search_div").slideUp("slow");
		  },function(){
			  $(this).attr("src","../img/min.gif").attr("title","10000");
				$(".search_div").slideDown("slow");
		})
 })