<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>二院工作平台</title>
<link href="${csspath}/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${jspath}/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${csspath}/validationEngine.jquery.css" />
<script type="text/javascript"
	src="${jspath}/jquery.validationEngine.js"></script>
<script type="text/javascript">
	var keyStr = "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv"
			+ "wxyz0123456789+/" + "=";
	function encode64(input) {
		input = escape(input);
		var output = "";
		var chr1, chr2, chr3 = "";
		var enc1, enc2, enc3, enc4 = "";
		var i = 0;
		do {
			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);
			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;
			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}
			output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2)
					+ keyStr.charAt(enc3) + keyStr.charAt(enc4);
			chr1 = chr2 = chr3 = "";
			enc1 = enc2 = enc3 = enc4 = "";
		} while (i < input.length);
		return output;
	}

	//检查用户口令是否输入正确，若正确进入对应人员的操作页面
	function login() {
		var userId = $.trim($("#userId").val());
		var password = $.trim($("#password").val());
		if (userId == "") {
			alert("请输入用户编号！");
			return false;
		}
		if (password == "") {
			alert("请输入密码！");
			return false;
		}
		
		if ($("#password").val() != $("#rightPassword").val()) {
			alert("用户密码有误！");
			return false;
		} else {
			$("#loginForm").submit();
		}
		//var password64 = encode64(password);

		/*$.ajax({
			type : "POST",
			url : "getUserByUserId",
			data : "userId=" + userId + "&password=" + password,
			error : function() {
				alert("error");
			},
			success : function(data) {
				if (data != "" && data != null) {
					$("#loginForm").submit();
				} else {
					alert("用户名或密码错误！或您无权登陆！");
				}
			}
		});*/
	}
	
	function getUserByEnter(e, o) {
		var e = e || window.event;
		if (e.keyCode == 13) {
			getUserByRybh(o);
		}
	}

	function EnterPress(e) { //传入 event 
		var e = e || window.event;
		if (e.keyCode == 13) {
			login();
		}
	}
	
	//根据用户编号查找用户基本信息，主要包括用户姓名，所在科室，科室编号，用户口令，口令设置到隐藏域
	function getUserByUserId(o) {
		var userId = $("#userId").val();
		if (userId == "") {
			alert("请输入工号！");
			return false;
		}
			alert(userId)
		$.ajax({
			type : "POST",
			url : "getUserByUserId",
			data : "userId=" + userId,
			error : function() {
				alert("error");
			},
			success : function(data) {
				if (data != "" && data != null) {
				alert(data.userName);
					$("#userName_lb").html(data.userName);
					$("#userName").val(data.userName);
					$("#rightPassword").val(data.password);
					$("#password").focus();
				} else {
					alert("用户不存在！");
				}
			}
		});

	}
	
	function getUserByEnter(e, o) {
		var e = e || window.event;
		if (e.keyCode == 13) {
			getUserByUserId(o);
		}
	}
</script>
</head>

<body>
	<div id="body">
		<div class="logo"></div>
		<div class="login3">
		<div style="height:100px"></div>
			<form:form id="loginForm" method="post" action="login"
				modelAttribute="loginDto">
				<input type="hidden" id="rightPassword" />
				<table style="margin-left:600px;margin-top:5px;border:2px solid #ffffff;" >
                <tr>
						<td class="title">工号：</td>
						<td><form:input path="userId" id="userId" onkeypress="getUserByEnter(event,this)" onkeydown="getUserByEnter(this)"
								cssClass="validate[required,custom[noSpecialCaracters]] tbox_id" /></td>
					</tr>
					<tr>
						<td class="title">用户名：</td>
						<td>&nbsp;
						 <label id="userName_lb" style="color:#fff"></label>
								<form:hidden path="userName" id="userName" />
						</td>
					</tr>
					<tr>
						<td class="title">用户密码：</td>
						<td><form:password path="password" id="password"
								cssClass="validate[required,custom[noSpecialCaracters]] tbox_id"
								onkeypress="EnterPress(event)" onkeydown="EnterPress()" /></td>
					</tr>
					<tr style="height:40px;">
						<td class="title">&nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="登陆"
							onclick="login()" class="btn" style="width:150px;align:center" />
							</td>
					</tr>
				</table>
			</form:form>
		</div>
		<div class="copyright">枣庄市精神卫生中心. ©2019 All Rights Reserved</div>
	</div>
</body>
</html>