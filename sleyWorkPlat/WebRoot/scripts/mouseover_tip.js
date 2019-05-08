// 滑过链接弹出提示JavaScript Document

$(function(){
    var x = 10;  
	var y = 20;
	$("a.pointer").mouseover(function(e){
       
	    var tooltip="<div class='data_div_tip'><table cellpadding='0' cellspacing='0' class='data1_tab' ><tr><th colspan='3'>Batch#</th></tr><tr><td>AAA-1</td><td>BBB-2</td><td>CCC-3</td></tr></table></div>";
		$("body").append(tooltip);	//把它追加到文档中
		$(".data_div_tip")
			.css({
				"top": (e.pageY+y) + "px",
				"left": (e.pageX+x)  + "px"
			}).show("fast");	  //设置x坐标和y坐标，并且显示
    }).mouseout(function(){		
	
		$(".data_div_tip").remove();   //移除 
    }).mousemove(function(e){
		$(".data_div_tip")
			.css({
				"top": (e.pageY+y) + "px",
				"left": (e.pageX+x)  + "px"
			});
	});
})