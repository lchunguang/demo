$(function(){
		   $("#table1 td").dblclick(function(){
				//alert("123");
				$(this).children(".input_noborder").removeClass("input_noborder").removeAttr("disabled");	
				
		   });
		    $("#table1 td input").blur(function(){
										
				$(this).addClass("input_noborder").attr("disabled","disabled");	
			
			});
		   
});
//tbox JavaScript Document
/*var inputItem; // 输入框句柄
var g_activeItem; // 保存正在编辑的单元格
function changeToText(obj){
 if( obj && inputItem ) {
  // 如果存在正在编辑的单元格， 则取消编辑状态， 并将编辑的数据保存起来
  var str = " ";
  if(inputItem.value != "") {
      str = inputItem.value;
   }
  obj.innerText = str;   
 
 }
}
function changeToEdit(obj){
 if( !inputItem ) {
  inputItem = document.createElement('input');
  inputItem.type = 'text';
  inputItem.style.width = '100%';
  inputItem.style.height = '18px';
  inputItem.style.fontSize = '12px';
 }
 inputItem.style.display = '';
 inputItem.value = obj.innerText; // 将该单元格的数据文本读到控件上
 obj.innerHTML = ''; // 清空单元格的数据
 obj.appendChild(inputItem);
 inputItem.focus();
 g_activeItem = obj;
}
document.attachEvent('ondblclick',function(){
 if (event.srcElement.tagName.toLowerCase() == "td") {
  if( !inputItem ) {
   inputItem = document.createElement('input');
   inputItem.type = 'text';
   inputItem.style.width = '100%';
   inputItem.style.height = '18px';
   inputItem.style.fontSize = '12px';
  }
  changeToText()
  changeToEdit(event.srcElement); 
 } else {
  event.returnValue = false;
  return false;  
 }
});
document.attachEvent('onclick', function(){
 if( event.srcElement.parentNode == g_activeItem || event.srcElement == g_activeItem ) {
  return;
 } else {
  changeToText(g_activeItem);
 }
})
*/