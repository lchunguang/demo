<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增护士</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script type="text/javascript" src="${jspath }/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath }/public.js"></script>
<script type="text/javascript">
	function goback() {
		window.location.href = "toQueryNurseList?flag=1";
	}

	function update() {
		if (!confirm("确认保存吗?")) {
			return false;
		}
		var mobile = $.trim($("#mobile").val());
		var addr = $.trim($("#addr").val());
		if (mobile == "") {
			alert("电话长号不能为空！");
			return false;
		}
		if (addr == "") {
			alert("现住址不能为空！");
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
		<div class="search_header">
			<div class="title">
				<p class="min" title="click me to see the details">个人资料</p>
			</div>
			<form:form name="updateForm" id="updateForm" action="updateUserById"
				modelAttribute="user" method="post">
				<form:hidden path="masterId" name="masterId"
					value="${user.masterId }" />
				<form:hidden path="userId" name="userId" value="${user.userId }" />
				<table border="0" cellpadding="10" cellspacing="5"
					class="search_tab">
					<tr>
						<td style="width:90px;text-align:right">工&nbsp;&nbsp;&nbsp;&nbsp;号：&nbsp;</td>
						<td style="width:300px;text-align:left">${ user.userId}</td>
						<td style="width:90px;text-align:right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;</td>
						<td>${ user.userName}</td>
					</tr>
					<tr>
						<td style="text-align:right">身份证号：&nbsp;</td>
						<td>${ user.idNumber}</td>
						<td style="text-align:right">性&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;</td>
						<td>
						<core:if test="${ user.sex=='F'}">女</core:if>
						<core:if test="${ user.sex=='M'}">男 </core:if></td>
					</tr>
					<tr>
						<td style="text-align:right">出生日期：&nbsp;</td>
						<td>${ user.birthDate}</td>
						<td style="text-align:right">学&nbsp;&nbsp;&nbsp;&nbsp;历：&nbsp;</td>
						<td>${ user.degree}</td>
					</tr>

					<tr>
						<td style="text-align:right">入职时间：&nbsp;</td>
						<td>${ user.hireDate}</td>
						<td style="text-align:right">所在科室：&nbsp;</td>
						<td>${ user.departName}</td>
					</tr>
					<tr>
						<td style="text-align:right">电话长号：&nbsp;</td>
						<td><form:input path="mobile" id="mobile"
								value="${user.mobile}" /></td>
						<td style="text-align:right">电话短号：&nbsp;</td>
						<td><form:input path="shortPhone" id="shortPhone"
								value="${user.shortPhone}" /></td>
					</tr>
					<tr>
					   <td style="text-align:right">籍&nbsp;&nbsp;&nbsp;&nbsp;贯：&nbsp;</td>
						<td>${user.nativePlace }</td>
						<td style="text-align:right">现&nbsp;住&nbsp;址：&nbsp;&nbsp;</td>
						<td ><form:input path="addr" id="addr" value="${user.addr}" style="width:250px"/>
							</td>
							<td><input type="button" value="保存" class="sbtn" onclick="update()"
							style="width:70px;height:26px;text-align:center" /></td>
					</tr>
				</table>
			</form:form>
			<br/>
		</div>

	</div>
	<center>
		<span style="color:red" id="tip">${tip}</span>
	</center>
</body>
</html>
