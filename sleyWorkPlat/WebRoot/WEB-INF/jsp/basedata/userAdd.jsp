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
<script type="text/javascript" src="${jspath }/jquery.blockUI.js"></script>
<script type="text/javascript" src="${jspath }/public.js"></script>
<script type="text/javascript"
	src="${jspath}/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>


<script type="text/javascript">
	function save() {
		if (!confirm("确认保存吗?")) {
			return false;
		}
		var name = $.trim($("#userName").val());

		$.ajax({
			type : "GET",
			async : false,
			url : "checkUserExist?time=" + new Date(),
			data : "name=" + name,
			success : function(msg) {
				if (msg == true) {
					alert("该名字已有人使用,不能新增！");
					return false;
				} else {
					var sex = $("input[name='sex']:checked").val();
					/*var birthDate = $.trim($("#birthDate").val());
					var hireDate = $.trim($("#hireDate").val());
					var levl = $.trim($("#levl").val());
					var degree = $.trim($("#degree").val());
					var title = $.trim($("#title").val());*/
					var govState = $.trim($("#govState").val());
					//var groupName = $.trim($("#groupName").val());
					var departName = $.trim($("#departName").val());
					//var telNo = $.trim($("#telNo").val());
					//var addr = $.trim($("#addr").val());
					var role = $.trim($("#role").val());
					var tip = "";
					if (name == "" || sex == "" || govState == ""
							|| departName == "" || role == "") {
						if (name == "") {
							tip += "姓名、";
						}

						if (sex == "" || sex == null || sex == undefined) {
							tip += "性别、";
						}
						
						if (govState == "") {
							tip += "编制、";
						}
						if (departName == "") {
							tip += "科室、";
						}
						if (role == "") {
							tip += "科室职务、";
						}
						var tipstr = tip.substring(0, tip.lastIndexOf("、"));
						tipstr += "不能为空！";
						alert(tipstr);
						return false;
					}
					$("#addForm").submit();

				}
			}
		});

	}

	function codefans() {
		if (tip != "") {
			var box = document.getElementById("tip");
			box.style.display = "none";
		}
	}
	setTimeout("codefans()", 2000);//2秒，可以改动
	//根据组名查询科室
	function queryDepart() {
		var groupName = jQuery("#groupName option:selected").val();
		var departName = '${ nqd.departName}';
		$
				.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : 'queryDepartByGroup?groupName=' + groupName
							+ '&time=' + new Date(),
					cache : false,
					data : "",
					dataType : 'json',
					success : function(items) {
						var option = '<option value=""  >—全部—</option>';
						for (var i = 0; i < items.length; i++) {
							if (items[i].departName == departName) {
								option += '<option selected="selected" value='+items[i].departName+'  >'
										+ items[i].departName + '</option>';
							} else {
								option += '<option value='+items[i].departName+'  >'
										+ items[i].departName + '</option>';
							}
						}
						$('#departName').html(option);

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
	<div class="spliter h_10"></div>
	<div class="info_div">
		<div class="search_header">
			<div class="title">
				<p title="click me to see the details">新增职工</p>
			</div>
			<form:form name="addForm" id="addForm" modelAttribute="user"
				enctype="multipart/form-data" action="user" method="post">
				<form:hidden path="workState" id="workState" value="在职" />
				<table border="0" cellpadding="10" cellspacing="5"
					class="search_tab">
					<tr>
						<td>用户编号:<form:input path="userId" id="userId"
								style="height:23px;" /> <span class='manual_red'> *</span></td>
					</tr>
					<tr>
						<td>姓名:<form:input path="userName" id="userName"
								style="height:23px;" /> <span class='manual_red'> *</span></td>
						<td>入职时间：<form:input type="text" id="hireDate"
								path="hireDate" class="lbl Wdate" style="width:100px;"
								readonly="true"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',lang:'zh-cn'})" /><span
							class='manual_red'> *</span> <!-- <input name="imgFile" id="imgFile1" type="file" /> --></td>
					</tr>
					<tr>
						<td>性别: <form:radiobutton path="sex" id="gl" value="女" /> <label
							for="gl">女</label> <form:radiobutton path="sex" id="by" value="男" />
							<label for="by">男</label> <form:radiobutton path="sex" id="ot"
								value="其他" /> <label for="ot">其他</label><span
							class='manual_red'> *</span></td>
						<td>出生日期：<form:input type="text" id="birthDate"
								path="birthDate" class="lbl Wdate" style="width:100px;"
								readonly="true"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',lang:'zh-cn'})" /><span
							class='manual_red'> *</span></td>
					</tr>

					<tr>
						<td>层级: <select name="levl" id="levl" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="N0"
									<core:if test="${ user.levl=='N0'}">selected="selected"</core:if>>N0</option>
								<option value="N1"
									<core:if test="${ user.levl=='N1'}">selected="selected"</core:if>>N1</option>
								<option value="N2"
									<core:if test="${ user.levl=='N2'}">selected="selected"</core:if>>N2</option>
								<option value="N3"
									<core:if test="${ user.levl=='N3'}">selected="selected"</core:if>>N3</option>
								<option value="N4"
									<core:if test="${ user.levl=='N4'}">selected="selected"</core:if>>N4</option>
						</select><span class='manual_red'> *</span></td>
						<td>学历: <select name="degree" id="degree" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="中专"
									<core:if test="${ user.degree=='中专'}">selected="selected"</core:if>>中专</option>
								<option value="专科"
									<core:if test="${ user.degree=='专科'}">selected="selected"</core:if>>专科</option>
								<option value="本科"
									<core:if test="${ user.degree=='本科'}">selected="selected"</core:if>>本科</option>
								<option value="研究生"
									<core:if test="${ user.degree=='研究生'}">selected="selected"</core:if>>研究生</option>
						</select><span class='manual_red'> *</span></td>
					</tr>
					<tr>
						<td>职称:<select name="title" id="title" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="护理员"
									<core:if test="${ user.title=='护理员'}">selected="selected"</core:if>>护理员</option>
								<option value="护士"
									<core:if test="${ user.title=='护士'}">selected="selected"</core:if>>护士</option>
								<option value="护师"
									<core:if test="${ user.title=='护师'}">selected="selected"</core:if>>护师</option>
								<option value="主管护师"
									<core:if test="${ user.title=='主管护师'}">selected="selected"</core:if>>主管护师</option>
								<option value="副主任护师"
									<core:if test="${ user.title=='副主任护师'}">selected="selected"</core:if>>副主任护师</option>
								<option value="主任护师"
									<core:if test="${ user.title=='主任护师'}">selected="selected"</core:if>>主任护师</option>
						</select><span class='manual_red'> *</span></td>
						<td>编制: <select name="govState" id="govState" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="合同制"
									<core:if test="${ user.govState=='合同制'}">selected="selected"</core:if>>合同制</option>
								<option value="在编"
									<core:if test="${ user.govState=='在编'}">selected="selected"</core:if>>在编</option>
								<option value="临时工"
									<core:if test="${ user.govState=='临时工'}">selected="selected"</core:if>>临时工</option>
						</select><span class='manual_red'> *</span></td>
					</tr>
						<!--  <tr>
							<td>&nbsp;&nbsp;&nbsp;组:<select name="groupName"
								id="groupName" size="1" onchange="queryDepart()"
								style="width:100px;height:23px">
									<option value=""
										<core:if test="${ nqd.groupName==''}">selected="selected"</core:if>>-请选择-</option>
									<core:choose>
										<core:when test="${not empty groupList}">
											<core:forEach items="${groupList}" var="dto"
												varStatus="status">
												<option value="${dto.name }"
													<core:if test="${ dto.name==nqd.groupName}">selected="selected"</core:if>>${dto.name }</option>
											</core:forEach>
										</core:when>
									</core:choose>
							</select><span class='manual_red'> *</span>&nbsp;
							</td>
							<td>科室:<select name="departName" id="departName" size="1"
								style="height:23px"></select><span class='manual_red'> *</span></td>
						</tr>-->

					<tr>
						<td>联系电话:<form:input path="mobile" id="mobile"
								style="height:23px" /></td>
						<td>家庭住址：<form:input path="addr" id="addr"
								style="height:23px" /></td>
					</tr>

					<tr>
						<td>
						所在科室：<form:input path="departName" id="departName"
									style="height:23px" value="${user.departName}"
									readonly="true" /></td>
									<td>
							密码:<form:password
									path="password" id="password" style="height:23px;" />
							<input type="button" class="button" value="保存" onclick="save()" />
							&nbsp;</td>
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
