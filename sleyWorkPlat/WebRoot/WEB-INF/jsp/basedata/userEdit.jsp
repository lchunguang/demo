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
		var sex = $("input[name='sex']:checked").val();
		//var birthDate = $.trim($("#birthDate").val());
		//var hireDate = $.trim($("#hireDate").val());
		//var levl = $.trim($("#levl").val());
		//var degree = $.trim($("#degree").val());
		//var title = $.trim($("#title").val());
		var govState = $.trim($("#govState").val());
		//var groupName = $.trim($("#groupName").val());
		var departName = $.trim($("#departName").val());
		//var telNo = $.trim($("#telNo").val());
		//var addr = $.trim($("#addr").val());
		var role = $.trim($("#role").val());
		var workState = $.trim($("#workState").val());
		var leaveReason = $.trim($("#leaveReason").val());
		var leaveDate = $.trim($("#leaveDate").val());
		var tip = "";
		if (sex == "" || govState == "" || departName == "" || role == ""
				|| workState == "") {
			if (name == "") {
				tip += "姓名、";
			}
			if (sex == "" || sex == null || sex == undefined) {
				tip += "性别、";
			}
			/*if (hireDate == "") {
				tip += "入职时间、";
			}
			if (birthDate == "") {
				tip += "出生日期、";
			}

			if (levl == "") {
				tip += "层级、";
			}
			if (degree == "") {
				tip += "学历、";
			}
			if (title == "") {
				tip += "职称、";
			}*/
			if (govState == "") {
				tip += "编制、";
			}
			if (departName == "") {
				tip += "科室、";
			}
			/*if (telNo == "") {
				tip += "联系电话、";
			}
			if (addr == "") {
				tip += "家庭住址、";
			}*/
			if (role == "") {
				tip += "科室职务、";
			}
			if (workState == "") {
				tip += "在职状态、";
			}
			var tipstr = tip.substring(0, tip.lastIndexOf("、"));
			tipstr += "不能为空！";
			alert(tipstr);
			return false;
		}
		if (workState == "离职") {
			if (leaveDate == "") {
				alert("离职时间不能为空！");
				return false;
			}
			if (leaveReason == "") {
				alert("离职原因不能为空！");
				return false;
			}
		}
		$("#addForm").submit();
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
		var departName = '${ nurseInfo.departName}';
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
	$(document).ready(function() {
		queryDepart();
	});

	function change(o) {
		var workState = $.trim($("#workState").val());
		if (workState == "离职") {
			$("#tr_leaveReason").show();
		} else {
			$("#tr_leaveReason").hide();
			$("#leaveReason").val("");
			$("#leaveDate").val("");
		}
	}

	function goback() {
		window.location.href = "toQueryNurseList?flag=1";
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
				<p title="click me to see the details">修改护士信息</p>
			</div>
			<form:form name="addForm" id="addForm" modelAttribute="nurseInfo"
				enctype="multipart/form-data" action="updateNurseInfo" method="post">
				<form:hidden path="id" name="id" value="${nurseInfo.id }" />
				<table border="0" cellpadding="10" cellspacing="5"
					class="search_tab">
					<tr>
						<td>姓名:<form:input path="userName" id="userName"
								value="${ nurseInfo.userName}"
								style="height:23px;background-color:#eeeeff" readonly="true" />
							<span class='manual_red'> *</span></td>
						<td>入职时间：<form:input type="text" id="hireDate"
								value="${ nurseInfo.hireDate}" path="hireDate" class="lbl Wdate" style="width:100px;"
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
								readonly="true" value="${ nurseInfo.birthDate}"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',lang:'zh-cn'})" /><span
							class='manual_red'> *</span></td>
					</tr>

					<tr>
						<td>层级: <select name="levl" id="levl" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="N0"
									<core:if test="${ nurseInfo.levl=='N0'}">selected="selected"</core:if>>N0</option>
								<option value="N1"
									<core:if test="${ nurseInfo.levl=='N1'}">selected="selected"</core:if>>N1</option>
								<option value="N2"
									<core:if test="${ nurseInfo.levl=='N2'}">selected="selected"</core:if>>N2</option>
								<option value="N3"
									<core:if test="${ nurseInfo.levl=='N3'}">selected="selected"</core:if>>N3</option>
								<option value="N4"
									<core:if test="${ nurseInfo.levl=='N4'}">selected="selected"</core:if>>N4</option>
						</select><span class='manual_red'> *</span></td>
						<td>学历: <select name="degree" id="degree" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="中专"
									<core:if test="${ nurseInfo.degree=='中专'}">selected="selected"</core:if>>中专</option>
								<option value="专科"
									<core:if test="${ nurseInfo.degree=='专科'}">selected="selected"</core:if>>专科</option>
								<option value="本科"
									<core:if test="${ nurseInfo.degree=='本科'}">selected="selected"</core:if>>本科</option>
								<option value="研究生"
									<core:if test="${ nurseInfo.degree=='研究生'}">selected="selected"</core:if>>研究生</option>
						</select><span class='manual_red'> *</span></td>
					</tr>
					<tr>
						<td>职称:<select name="title" id="title" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="护理员"
									<core:if test="${ nurseInfo.title=='护理员'}">selected="selected"</core:if>>护理员</option>
								<option value="护士"
									<core:if test="${ nurseInfo.title=='护士'}">selected="selected"</core:if>>护士</option>
								<option value="护师"
									<core:if test="${ nurseInfo.title=='护师'}">selected="selected"</core:if>>护师</option>
								<option value="主管护师"
									<core:if test="${ nurseInfo.title=='主管护师'}">selected="selected"</core:if>>主管护师</option>
								<option value="副主任护师"
									<core:if test="${ nurseInfo.title=='副主任护师'}">selected="selected"</core:if>>副主任护师</option>
								<option value="主任护师"
									<core:if test="${ nurseInfo.title=='主任护师'}">selected="selected"</core:if>>主任护师</option>
						</select><span class='manual_red'> *</span></td>
						<td>编制: <select name="govState" id="govState" size="1"
							style="width:100px;height:23px">
								<option value="">-请选择-</option>
								<option value="合同制"
									<core:if test="${ nurseInfo.govState=='合同制'}">selected="selected"</core:if>>合同制</option>
								<option value="在编"
									<core:if test="${ nurseInfo.govState=='在编'}">selected="selected"</core:if>>在编</option>
								<option value="临时工"
									<core:if test="${ nurseInfo.govState=='临时工'}">selected="selected"</core:if>>临时工</option>
						</select><span class='manual_red'> *</span></td>
					</tr>
					
					<tr>
						<td>联系电话:<form:input path="telNo" id="telNo"
								style="height:23px" value="${ nurseInfo.telNo}" /></td>
						<td>家庭住址：<form:input path="addr" id="addr"
								style="height:23px" value="${ nurseInfo.addr}" /></td>
					</tr>
					<tr>
						<td>科室职务：<core:if test="${loginUser.role=='管理员'}">
								<select name="role" id="role" size="1"
									style="width:100px;height:23px">
								<option value="">-请选择-</option>
									<option value="院长"
										<core:if test="${ nurseInfo.role=='院长'}">selected="selected"</core:if>>院长</option>
										<option value="主任"
										<core:if test="${ nurseInfo.role=='主任'}">selected="selected"</core:if>>主任</option>
									<option value="护士长"
										<core:if test="${ nurseInfo.role=='护士长'}">selected="selected"</core:if>>护士长</option>
									<option value="副护士长"
										<core:if test="${ nurseInfo.role=='副护士长'}">selected="selected"</core:if>>副护士长</option>
								<option value="护士"
										<core:if test="${ nurseInfo.role=='护士'}">selected="selected"</core:if>>护士</option>
										<option value="管理员"
										<core:if test="${ nurseInfo.role=='管理员'}">selected="selected"</core:if>>管理员</option>
								</select>
							</core:if> <core:if test="${loginUser.role!='管理员'}">
								<select name="role" id="role" size="1"
									style="width:100px;height:23px">
									<option value="">-请选择-</option>
									<option value="护士"
										<core:if test="${ nurseInfo.role=='护士'}">selected="selected"</core:if>>护士</option>
									<option value="副护士长"
										<core:if test="${ nurseInfo.role=='副护士长'}">selected="selected"</core:if>>副护士长</option>
									<option value="护士长"
										<core:if test="${ nurseInfo.role=='护士长'}">selected="selected"</core:if>>护士长</option>
								</select>
							</core:if> <span class='manual_red'> *</span></td>
						<td>在职状态:<select name="workState" id="workState" size="1"
							style="width:100px;height:23px" onclick="change(this)">
								<option value="">-请选择-</option>
								<option value="在职"
									<core:if test="${ nurseInfo.workState=='在职'}">selected="selected"</core:if>>在职</option>
							       <option value="产假"
								<core:if test="${ nurseInfo.workState=='产假'}">selected="selected"</core:if>>产假</option>
								<option value="哺乳"
								<core:if test="${ nurseInfo.workState=='哺乳'}">selected="selected"</core:if>>哺乳</option>
								<option value="孕期"
								<core:if test="${ nurseInfo.workState=='孕期'}">selected="selected"</core:if>>孕期</option>
										<option value="休假"
								<core:if test="${ nurseInfo.workState=='休假'}">selected="selected"</core:if>>休假</option>
						<option value="离职"
									<core:if test="${ nurseInfo.workState=='离职'}">selected="selected"</core:if>>离职</option>
						</select><span class='manual_red'> *</span>
						</td>
					</tr>
					<tr id="tr_leaveReason"
						<core:if test="${ nurseInfo.workState=='在职'}">style="display:none"</core:if>>
						<td>离职时间：<form:input type="text" id="leaveDate"
								path="leaveDate" class="lbl Wdate" style="width:100px;"
								readonly="true" value="${ nurseInfo.leaveDate}"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',lang:'zh-cn'})" /><span
							class='manual_red'> *</span></td>
						<td>离职原因:<form:input path="leaveReason" id="leaveReason"
								style="height:23px;" /><span class='manual_red'> *</span></td>

					</tr>
					<!-- <core:if test="${loginUser.role=='管理员'}">
					<tr>
					<td>组：${nurseInfo.groupName }</td>
					<td>科室：${nurseInfo.departName }</td>
					</tr>
						 <tr>
							<td>&nbsp;&nbsp;&nbsp;组:<select name="groupName"
								id="groupName" size="1" onchange="queryDepart()"
								style="width:100px;height:23px">
									<option value=""
										<core:if test="${ nurseInfo.groupName==''}">selected="selected"</core:if>>-请选择-</option>
									<core:choose>
										<core:when test="${not empty groupList}">
											<core:forEach items="${groupList}" var="dto"
												varStatus="status">
												<option value="${dto.name }"
													<core:if test="${ dto.name==nurseInfo.groupName}">selected="selected"</core:if>>${dto.name }</option>
											</core:forEach>
										</core:when>
									</core:choose>
							</select><span class='manual_red'> *</span>&nbsp;
							</td>
							<td>科室:<select name="departName" id="departName" size="1"
								style="height:23px"></select><span class='manual_red'> *</span></td>
						</tr>
					</core:if>-->
					<tr>
						<td>
						所在科室：<form:input path="departName" id="departName"
									style="height:23px;background-color:#eeeeff" value="${nurseInfo.departName}"
									readonly="true" />
							</td>
						<td>
								<core:if test="${loginUser.role=='管理员'}">密码:<form:password path="password" id="password"
								style="height:23px;"  value="${nurseInfo.password}"/></core:if><input type="button" class="button" value="保存" onclick="save()"
									 />
							</td>
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
