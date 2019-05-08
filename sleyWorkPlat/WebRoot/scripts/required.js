$(document).ready(function(){
	 $("input.tbox_id").blur(function(){
			var user=$(".tbox_id").val();
			if(user==""||user==null){
					$(".tip_user").text("The username can't be null!").removeClass("tip_user_r").addClass("tip_user");					
					}else{
					$(".tip_user").text("The username's format is correct!").removeClass("tip_user").addClass("tip_user_r");	
					}
	 })
	 $("input.tbox_pwd").blur(function(){
			var pwd=$(".tbox_pwd").val();
			if(pwd==""||pwd==null){
					$(".tip_pwd").text("The password can't be null!").removeClass("tip_pwd_r").addClass("tip_pwd");						
					}else{
					$(".tip_pwd").text("The password's format is correct!").removeClass("tip_pwd").addClass("tip_pwd_r");	
					}
	 })
	 
	 $("a.a_sign").click(function(){
			var user=$(".tbox_id").val();
			var pwd=$(".tip_pwd").val(); 
			if(user=="123" && pwd=="123"){
					//$("div.tip_user").text("logining!");
					$("a.a_sign").attr("href","index.html");
					}else{
					//$("div.tip_user").text("The username cannot match the password!");	
					$("a.a_sign").attr("href","#");
					}
	 })
	
});