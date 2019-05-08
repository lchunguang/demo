<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<META content="text/html; charset=UTF-8" http-equiv="Content-Type" />
<META http-equiv="Pragma" content="no-cache" />
<META http-equiv="Cache-Control" content="no-cache" />
<META http-equiv="Expires" content="0" />
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script src="${jspath }/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath}/public.js"></script>
<script type="text/javascript" src="${jspath}/load_layer.js"></script>
<script type="text/javascript" src="${jspath }/jquery.blockUI.js"></script>
<script language="javascript">
	function search() {
		$("#queryForm").submit();
	}
	function deleteGoodsDic(id) {
		if (!confirm("确定删除此记录?")) {
			return false;
		}
		$.ajax({
			type : "POST",
			url : "updateGoodsDic?time=" + new Date(),
			data : "id=" + id,
			error : function() {
				alert('Error');
			},
			success : queryGoodsDic
		});

	}
	function toAddPage(o) {
	alert("暂未开放！");
	//	window.location.href = "toAddUserPage";
	}

	function update(o, id) {
	alert("暂未开放！");
		//window.location.href = "queryUserDetail?flag=modify&id=" + id;
	}

	function query(o, id) {
		window.location.href = "queryUserDetail?flag=query&id=" + id;
	}

	function changeDepart(o, userId, userName, departName) {
		loadLayer(o, "toChangeDepart?userId=" + userId + "&userName="
				+ userName + "&departName=" + departName, 600, 140);
	}

	function queryDepart() {
		var parentDepartId = jQuery("#parentDepartId option:selected").val();
		var departId = '${ uqd.departId}';
		//groupName = escape(encodeURIComponent(groupName));
		$
				.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : 'queryDepartByParent?parentDepartId='
							+ parentDepartId + '&time=' + new Date(),
					cache : false,
					data : "",
					dataType : 'json',
					success : function(items) {
						var option = '<option value=""  >—全部—</option>';
						for (var i = 0; i < items.length; i++) {
							if (items[i].departId == departId) {
								option += '<option selected="selected" value='+items[i].departId+'  >'
										+ items[i].departName + '</option>';
							} else {
								option += '<option value='+items[i].departId+'  >'
										+ items[i].departName + '</option>';
							}
						}
						$('#departId').html(option);

					},
					error : function() {
						alert("error");
					}
				});
	}

	$(document).ready(function() {
		queryDepart();
	});

	function clickImg(obj) {
		var dv = document.getElementById("div1");
		dv.innerHTML = "<img src=" + obj.src
				+ " width=500 height=500  onclick='hideImg()'/>";
	}
	function hideImg() {
		var dv = document.getElementById("div1");
		dv.innerHTML = "";
	}
</script>
</head>
<body>
	<form:form id="queryForm" method="get" action="queryUserList"
		modelAttribute="uqd">
		<!--the part of header -->
		<div class="spliter h_10"></div>
		<div class="info_div">
			<div class="search_header">
				<div class="title">
					<p class="min" title="click me to see the details">职工查询</p>
				</div>

				<table class="search_tab">
					<tr>
						<td>院区:<select name="parentDepartId" id="parentDepartId"
							size="1" onchange="queryDepart()" style="width:80px;height:23px">
								<option value=""
									<core:if test="${ uqd.parentDepartId==''}">selected="selected"</core:if>>-全部-</option>
								<core:choose>
									<core:when test="${not empty departList}">
										<core:forEach items="${departList}" var="dto"
											varStatus="status">
											<option value="${dto.departId }"
												<core:if test="${ dto.departId==uqd.parentDepartId}">selected="selected"</core:if>>${dto.departName }</option>
										</core:forEach>
									</core:when>
								</core:choose>
						</select>&nbsp;科室:<select name="departId" id="departId" size="1"
							style="width:120px;height:23px"></select> 学历: <select
							name="degree" id="degree" size="1" style="width:80px;height:25px">
								<option value=""
									<core:if test="${ uqd.degree==''}">selected="selected"</core:if>>-请选择-</option>
								<core:choose>
									<core:when test="${not empty degreeList}">
										<core:forEach items="${degreeList}" var="dto"
											varStatus="status">
											<option value="${dto.name }"
												<core:if test="${ dto.name==uqd.degree}">selected="selected"</core:if>>${dto.name }</option>
										</core:forEach>
									</core:when>
								</core:choose>
						</select>&nbsp;工作年限:<form:input path="fromWorkYear" id="fromWorkYear" class="lbl"
								style="width:40px;height:23px" onblur="checkInteger(this)" /> ~<form:input
								path="toWorkYear" id="toWorkYear" class="lbl"
								style="width:40px;height:23px" onblur="checkInteger(this)" />&nbsp;年龄:<form:input
								path="fromAge" id="fromAge" class="lbl"
								style="width:40px;height:23px" onblur="checkInteger(this)" /> ~<form:input
								path="toAge" id="toAge" class="lbl"
								style="width:40px;height:23px" onblur="checkInteger(this)" /></td>
					</tr>
					<tr>

						<td>&nbsp;性别: <select name="sex" id="sex" size="1"
							style="width:60px;height:23px">
								<option value="">-全部-</option>
								<option value="F"
									<core:if test="${ uqd.sex=='F'}">selected="selected"</core:if>>女</option>
								<option value="M"
									<core:if test="${ uqd.sex=='M'}">selected="selected"</core:if>>男</option>
						</select> 姓名: <form:input path="userName" id="userName" class="lbl"
								style="width:60px;;height:23px" /> 身份证号: <form:input path="idNumber" id="idNumber" class="lbl"
								style="width:130px;;height:23px" />  <input
							name="ok" type="submit" class="button" value="确认" /><input
							name="ok" type="button" class="button" value="导出" /></td>
					</tr>
				</table>
				<div class="spliter h_5"></div>
			</div>
		</div>

		<div class="spliter h_10"></div>
		&nbsp;&nbsp;&nbsp;<span style="color:red">总人数：${num}</span>
		<div class="import">
			<a onclick="toAddPage(this)"><img src="${imagepath}/Add_img.png" />新增</a>
		</div>
		<div class="data_div">
			<table cellpadding="0" cellspacing="0" class="data_tab">
				<tr>

					<th>工号</th>
					<th>姓名</th>
					<th>科室</th>
					<th>性别</th>
					<th>出生日期</th>
					<th>年龄</th>
					<th>电话号码</th>
					<th>学历</th>
					<th>职称</th>
					<th>入职日期</th>
					<th>工作年限</th>
					<th style="width:7%">操作</th>
				</tr>
				<core:choose>
					<core:when test="${not empty userList}">
						<core:forEach items="${userList}" var="dto" varStatus="status">
							<tr>

								<td>${dto.userId}</td>
								<td>${dto.userName}</td>
								<td>${dto.departName}</td>
								<td>
								<core:if test="${ dto.sex=='F'}">女</core:if>
								<core:if test="${ dto.sex=='M'}">男</core:if></td>
								<td>${dto.birthDate}</td>
								<td>${dto.age}</td>
								<td>${dto.mobile}</td>
								<td>${dto.degree}</td>
								<td>${dto.title}</td>
								<td>${dto.hireDate}</td>
								<td>${dto.workYear}</td>
								<td>
									<a
									onclick="update(this,'${dto.userId}');"><img
										src="${imagepath}/edit_img.png" /></a> &nbsp;<!--  <a
									onclick="changeDepart(this,'${dto.userId}','${dto.userName}','${dto.departName }');">调科</a>--> 

								</td>
							</tr>
						</core:forEach>
					</core:when>
					<core:otherwise>
						<tr>
							<td colspan="13"><span style="color: red;">没有检索数据.</span></td>
						</tr>
					</core:otherwise>
				</core:choose>
			</table>
		</div>

		<%@ include file="/WEB-INF/jsp/include/page.jsp"%>
	</form:form>

</body>
</html>