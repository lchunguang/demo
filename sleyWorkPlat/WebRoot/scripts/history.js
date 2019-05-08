// JavaScript Document
$(function(){
		   $(".history").toggle(function(){
				$(this).parent().parent().next("tr").show();
				$(this).attr("src","../images/down.png")
		   },function(){
		   		$(this).parent().parent().next("tr").hide(); 
				$(this).attr("src","../images/right.png")
		   })
})