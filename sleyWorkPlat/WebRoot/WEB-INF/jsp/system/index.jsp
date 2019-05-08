<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>工资查询系统</title>
<link href="${csspath }/index.css" type="text/css" rel="stylesheet" />
<link href="${csspath }/left.css" type="text/css" rel="stylesheet" />
<script src="${jspath }/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${jspath }/leftScroll.js" type="text/javascript"></script>
<script src="${jspath }/leftTree.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
	// iframe 自适应高度
	function setIframeHeight() {

		var leftFrame = document.getElementById("leftFrame");
		var mainFrame = document.getElementById("mainFrame");

		try {
			var bHeight = leftFrame.contentWindow.document.body.scrollHeight;
			var dHeight = mainFrame.contentWindow.document.body.scrollHeight;
			var heightTemp = Math.max(bHeight, dHeight);
			leftFrame.height = heightTemp;
			mainFrame.height = heightTemp;
		} catch (ex) {
		}
	}
	function iframeload() {
		interval = setInterval("setIframeHeight()", 10);
	}
	iframeload();

	function loginOut() {
		window.location.href = "loginOut";
	}
</script>
</head>
<body>
	<div id="top_ding"></div>
	<div class="divGlobal">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="3" height="85px" class="top_bg">
					<div class="top">
						<div class="topLeft">
							<div class="logo"></div>
						</div>
						<div class="topRight">
							<div class="sysName">
								<img src="${imagepath}/index/fbs.png" />
							</div>
						</div>
						<div class="top_repeat">
							<div class="means">【${loginUser.departName}】欢迎您,${loginUser.userName}
							</div>
							<div class="icon2" onclick="loginOut()"></div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td valign="top" class="left"><iframe src="left" id="leftFrame"
						name="leftFrame" frameborder="0" onload="iframeload(this)"
						scrolling="no" noresize="noresize" height="100%" width="200px"></iframe>
				</td>
				<td height="100%" valign="top">
					<div id="scroll" class="scroll_bg1"></div>
				</td>
				<td width="100%" height="100%" valign="top"><iframe src="main"
						id="mainFrame" name="mainFrame" frameborder="0" scrolling="no"
						noresize="noresize" width="100%" height="1050px"></iframe></td>
			</tr>

		</table>
	</div>
</body>
</html>

