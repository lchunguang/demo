// JavaScript Document
$(function(){
		   $(".modify").toggle(function(){
				$(this).attr("src","../images/save_img.png").attr("title","save");
				$(this).parent().siblings().children(".input_noborder").removeClass("input_noborder").addClass("input_right").removeAttr("disabled");
		   },function(){
			
				$(this).attr("src","../images/edit_img.png").attr("title","modify");;
				$(this).parent().siblings().children(".input_right").removeClass("input_right").addClass("input_noborder").attr("disabled","disabled");   
		});

})   

