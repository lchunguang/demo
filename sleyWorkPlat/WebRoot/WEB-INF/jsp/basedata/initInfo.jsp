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
<script type="text/javascript"  language="javascript" charset="utf-8" src="${jspath }/public.js"></script>

<script type="text/javascript">
	function updatePassword() {
		var idNumber = $.trim($("#idNumber").val());
		var mobile = $.trim($("#mobile").val());
		var shortPhone = $.trim($("#shortPhone").val());
		var nativePlace = $.trim($("#nativePlace").val());
		var degree = $("#degree").val();
		var departName = $.trim($("#departName").val());
		var departId = jQuery("#departId option:selected").val();
		var departName = jQuery("#departId option:selected").text();
		$("#departName").val(departName);
		//var degree = $.trim($("#degree").val());
		var newPassword = $.trim($("#newPassword").val());
		var newPassword1 = $.trim($("#newPassword1").val());
		if (idNumber == "") {
			alert("身份证号不能为空！");
			return false;
		}
		var tip = CheckIdCard(idNumber);
		if (tip != "验证通过!") {
			alert(tip);
			return false;
		}
		var birthDate = GetBirthday(idNumber);
		var sex = Getsex(idNumber);
		if (mobile == "") {
			alert("电话号码不能为空！");
			return false;
		}
		if (nativePlace == "") {
			alert("籍贯不能为空！");
			return false;
		}
		if (degree == "") {
			alert("请选择学历！");
			return false;
		}
		if (departId == ""||departId==undefined || departId==null) {
			alert("请选择科室！");
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
		if (newPassword != newPassword1) {
			alert("两次输入的新认密码不一致，请重新输入！");
			return false;
		}
		if (newPassword.length<6) {
				alert("密码至少大于等于6位！");
				return false;
			}
		$.ajax({
			type : "POST",
			async : false,
			url : "initInfo?time=" + new Date()+"&birthDate="+birthDate+"&sex="+sex,
			data : $('#updateForm').serialize(),
			success : function(result) {
				alert("初始化成功！密码已修改，请重新登陆！");
				window.location.href="login";
			}
		});
	}
	
	function queryDepart() {
		var parentDepartId = jQuery("#parentDepartId option:selected").val();
		//groupName = escape(encodeURIComponent(parentDepartName));
		$
				.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : 'queryDepartByParent?parentDepartId=' + parentDepartId
							+ '&time=' + new Date(),
					cache : false,
					data : "",
					dataType : 'json',
					success : function(items) {
						var option = '<option value=""  >—请选择—</option>';
						for (var i = 0; i < items.length; i++) {
								option += '<option value='+items[i].departId+'  >'
										+ items[i].departName + '</option>';
						}
						$('#departId').html(option);

					},
					error : function() {
						alert("error");
					}
				});
	}
</script>
</head>
<body>
	<script type="text/javascript">
		window.history.go(1);
	</script>
	<div style="margin-top:20px"></div>
	<form:form name="updateForm" id="updateForm" modelAttribute="user"
		action="initInfo" method="post">
		<center>
			<core:if test="${user.flag==1 }">
				<span style="font-size:16px;color:red">首次登陆，请完善信息、修改密码！</span>
			</core:if>
		</center>
		<form:hidden path="flag" value="${user.flag}" />
		<div class="info_div" style="width:830px;font-size:16px">
			<form:hidden path="masterId" name="masterId"
				value="${user.masterId}" />
			<form:hidden path="birthDate" name="birthDate" id="birthDate"/>
			<form:hidden path="sex" name="sex" id="sex"/>
			<center>
				<table border="0" cellpadding="5" cellspacing="5" class="search_tab"
					style="width:480px;margin-top:20px;margin-bottom:30px">
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;工&nbsp;&nbsp;&nbsp;号：&nbsp;${ user.userId}</td>
					</tr>
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;名：&nbsp;${ user.userName}</td>
					</tr>
					<tr style="height:35px">
						<td>身份证号：<form:input path="idNumber" id="idNumber"
								value="${ user.idNumber}" /> <span class='manual_red'> *</span></td>
					</tr>
					<tr style="height:35px">
						<td>电话长号：<form:input path="mobile" id="mobile"
								style="height:25px" value="${ user.mobile}" /><span
							class='manual_red'> *</span></td>
					</tr>
					<tr style="height:35px">
						<td>电话短号：<form:input path="shortPhone" id="shortPhone"
								style="height:25px" value="${ user.shortPhone}" /></td>
					</tr>
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;籍&nbsp;&nbsp;&nbsp;贯：<form:input
								path="nativePlace" id="nativePlace" value="${ user.nativePlace}" />
							<span class='manual_red' style="font-size:13px;">*(格式:×省×市)</span></td>
					</tr>
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;历：<select
							name="degree" id="degree" size="1" style="height:25px">
								<option value=""
									<core:if test="${ user.degree==''}">selected="selected"</core:if>>-请选择-</option>
								<core:choose>
									<core:when test="${not empty degreeList}">
										<core:forEach items="${degreeList}" var="dto"
											varStatus="status">
											<option value="${dto.name }"
												<core:if test="${ dto.name==user.degree}">selected="selected"</core:if>>${dto.name }</option>
										</core:forEach>
									</core:when>
								</core:choose>
						</select><span class='manual_red'> *</span></td>
					</tr>
					
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;区：<select
							name="parentDepartId" id="parentDepartId" size="1" style="height:25px" onchange="queryDepart()">
								<option value="">-请选择-</option>
								<core:choose>
									<core:when test="${not empty departList}">
										<core:forEach items="${departList}" var="dto"
											varStatus="status">
											<option value="${dto.departId }" >${dto.departName }</option>
										</core:forEach>
									</core:when>
								</core:choose>
						</select><span class='manual_red'> *</span>&nbsp;
						</td>
					</tr>
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;科&nbsp;&nbsp;&nbsp;室：<select name="departId" id="departId" size="1"
									style="width:120px;height:23px"></select><span class='manual_red'> *</span>&nbsp;
						<form:hidden path="departName" id="departName" />
						</td>
					</tr>
					<tr style="height:5px">
						<td></td>
					</tr>
					<tr style="height:35px">
						<td>&nbsp;&nbsp;&nbsp;新密码：<form:input path="newPassword"
								id="newPassword" type="password" style="height:25px;" /><span
							class='manual_red' style="font-size:13px;">*(大于6位)</span></td>
					</tr>
					<tr style="height:35px">
						<td>确认密码：<form:input path="newPassword1" id="newPassword1"
								type="password" style="height:25px;" /><span class='manual_red'>
								*</span><input type="button" value="保存" class="sbtn"
							onclick="updatePassword()"
							style="width:60px;height:28px;text-align:center" /></td>
					</tr>
				</table>
			</center>
		</div>
	</form:form>
	<center>
		<span style="color:red" id="tip">${tip}</span>
	</center>

</body>
</html>
