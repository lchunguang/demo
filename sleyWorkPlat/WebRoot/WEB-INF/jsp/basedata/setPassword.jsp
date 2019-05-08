<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改登陆密码</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script type="text/javascript" src="${jspath }/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath }/public.js"></script>

<script type="text/javascript">
	function updatePassword() {
			var password = $.trim($("#password").val());
			var newPassword = $.trim($("#newPassword").val());
			var newPassword1 = $.trim($("#newPassword1").val());
			if (password == "") {
				alert("原始密码不能为空！");
				return false;
			}
			if (newPassword == "") {
				alert("新密码不能为空！");
				return false;
			}
			if (newPassword1 == "") {
				alert("确认密码不能为空！");
				return false;
			}
			var oldPassword = '${oldPassword}';
			if (password != oldPassword) {
				alert("原密码输入不正确！");
				return false;
			}
			if (newPassword != newPassword1) {
				alert("两次输入的新认密码不一致，请重新输入！");
				return false;
			}
			if (newPassword.length<6) {
				alert("密码至少大于等于6位！");
				return false;
			}
			$("#updateForm").submit();
		}
</script>
</head>
<body>
	<script type="text/javascript">
		window.history.go(1);
	</script>
	<div class="spliter h_10"></div>
	<div class="info_div">
		<div class="search_header" >
			<div class="title">
				<p title="click me to see the details">修改密码</p>
			</div>
			<form:form name="updateForm" id="updateForm" modelAttribute="user"
				 action="setPassword" method="post">
				<form:hidden path="flag" value="${user.flag}"/>
				<table border="0" cellpadding="10" cellspacing="5"
					class="search_tab">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;原密码：<form:input path="password" id="password" type="password"
								 style="height:23px;" /> <span
							class='manual_red'> *</span></td>
					</tr>

					<tr>
						<td>&nbsp;&nbsp;&nbsp;新密码：<form:input path="newPassword" id="newPassword" type="password"
								style="height:23px;" /><span
							class='manual_red' style="font-size:13px;"> *(大于6位)</span></td>
					</tr>
					<tr>
						<td>确认密码：<form:input path="newPassword1" id="newPassword1" type="password"
								style="height:23px;" /><span
							class='manual_red'> *</span><input type="button" value="保存" class="sbtn"
						onclick="updatePassword()"
						style="width:60px;height:28px;text-align:center" /></td>
					</tr>
				</table>
			</form:form>
		</div>
		<br />
	</div>
	<br />
	<center>
		<span style="color:red" id="tip">${tip}</span>
	</center>

</body>
</html>
