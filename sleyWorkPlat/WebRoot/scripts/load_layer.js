/*
 * JavaScript遮罩层插件
 * 当前版本：1.0
 * @author：
 *
 * @参数:
 * 		width:	//load页面的宽度
 * 		height:	//load页面的长度
 * 		url:	//load页面的url
 * 		html:	//load直接的HTML代码
 * 		注：不能同时load url和html代码
 */
jQuery.fn.cm_layer = function(options){
	var options = options || {};
	var msgDivWidth = options.width || '680px';
	var msgDivHeight = options.height || '';
	var msgDivTop = options.top || '100px';
	var msgDivLeft = options.left || '200px';
	var msgDivUrl = options.url || '';
	var msgDivHtml = options.html || '';
	
	$(window).scroll(coverAll);
	$(window).resize(coverAll);
	
	$('#cm_msgDiv').remove();
	$('#cm_shadowDiv').remove();
	
	//var wH = window.screen.availHeight;//屏幕可用高度
	//var wW = window.screen.availWidth;//屏幕可用宽度
	function cH()
	{
		return document.documentElement.clientHeight;//屏幕的高度
	}
	function cW()
	{
		return document.documentElement.clientWidth;//屏幕的宽度
	}
	function sl()
	{
		return document.documentElement.scrollLeft;//滚动条距左边的距离
	}
	function st()
	{
        //document.body.scrollTop fixed chrome
		return document.documentElement.scrollTop || document.body.scrollTop;//滚动条距顶部的距离
	}
	//----创建遮罩层Div----
	var shadowDivObj = $('<div id="cm_shadowDiv"></div>');
	shadowDivObj.css({position:"absolute",left:"0px", top: "0px", width: cW(), height: cH(), filter: "Alpha(Opacity=30)", opacity: "0.3", background: "#000000", zIndex:'100000'});
	//var shadowDivObj = $('<iframe marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=no id="cm_shadowDiv"></iframe>');	
	//shadowDivObj.css({width: cW(),height: cH(),background:"#777", display:"none",position:'absolute', top: st() + 'px',left: sl() + 'px',zIndex:'100000',opacity:'0.5'});
	shadowDivObj.append('<iframe style="position:absolute; top:0; left:0; width:100%; height:100%; filter:alpha(opacity=0); "></iframe>');
	$(document.body).append(shadowDivObj);
	//----创建显示层Div----
	$(document.body).append($('<div id="cm_msgDiv" ></div>'));
	$('#cm_msgDiv').css({width: msgDivWidth, height: msgDivHeight, display:'none', position:'absolute', background:"white", zIndex:'100002'});
	//$('#cm_msgDiv').html("<div id='cm_msgContant'>正在加载，请稍候...</div>");	
	$('#cm_msgDiv').css({top: (msgDivScrollTop(msgDivTop) + 'px'),left: (msgDivScrollLeft(msgDivLeft) + 'px')});
	$('#cm_shadowDiv').fadeIn('slow',function(){ $('#cm_msgDiv').show('fast');});
	if(msgDivUrl != '' && msgDivHtml == '')
	{
		//$('#cm_msgContant').load(msgDivUrl);
		$('#cm_msgDiv').append('<iframe id="cm_iframe" width="100%" height="100%" scrolling="auto" frameborder="0" src="'+ msgDivUrl +'"></iframe>');
	}
	if(msgDivUrl == '' && msgDivHtml != '')
	{
		$('#cm_msgContant').html(msgDivHtml);
	}
	if(msgDivUrl != '' && msgDivHtml != '')
	{
		$('#cm_msgContant').html('请不要同时传递html代码和url');
	}	
	
	//----点击关闭
	$('#cm_closeMsg').click(function(){
		$('#cm_msgDiv').remove();
		$('#cm_shadowDiv').remove();
	})
	
	function coverAll()
	{
		if($('#cm_shadowDiv').css('display') != 'none'){
			$('#cm_shadowDiv').css({width: cW(),height: cH(),top: (st() + 'px'),left: (sl() + 'px')});
			//$('#cm_msgDiv').css({top: (msgDivScrollTop(msgDivTop) + 'px'),left: (msgDivScrollLeft(msgDivLeft) + 'px')});
		}
	}	
	
	function msgDivScrollTop(msgDivTop)
	{		
		//var objT = st() + (cH() - parseInt(msgDivHeight))/2; //始终在屏幕中间
		var objT = st() + parseInt(msgDivTop);//----固定top----
		//var objT = parseInt(msgDivTop); //----固定高度、无视拖动----
		return objT;
	}
	
	function msgDivScrollLeft(msgDivLeft)
	{		
		if (parseInt(msgDivWidth) != 0)
		{
			var objL = sl() + (cW() - parseInt(msgDivWidth))/2; //始终在屏幕中间
		}
		else
		{
			var objL = sl() + parseInt(msgDivLeft);//----固定left=200px----
		}
		return objL;
	}	
}

/**
 * 以下为一些扩展函数：
 * loadLayer(obj, loadUrl)
 * removeLayer()
 */
function loadLayer(obj, loadUrl, wd, height)
{
	$(obj).cm_layer({url: loadUrl, width: wd, height: height});
	return false;
}
function removeLayer()
{
	$('#cm_shadowDiv',parent.document).remove();
	$('#cm_msgDiv',parent.document).remove();
	//alert($('#cm_shadowDiv',parent.document).length());
	return false;
}

