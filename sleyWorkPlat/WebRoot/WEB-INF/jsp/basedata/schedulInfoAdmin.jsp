<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设置排班</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script type="text/javascript" src="${jspath }/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery.blockUI.js"></script>
<script type="text/javascript" src="${jspath }/public.js"></script>
<script type="text/javascript"
	src="${jspath}/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	function codefans() {
		if (tip != "") {
			var box = document.getElementById("tip");
			box.style.display = "none";
		}
	}
	setTimeout("codefans()", 2000);//2秒，可以改动

	function beforeWeek(date) {
		$("#flag").val("2");
		$("#date").val(date);
		var departName = $("#departName").val();
		if (departName == "" || departName == null) {
			alert("请选择查询科室！");
			return false;
		}
		$("#queryForm").submit();
	}
	function nextWeek(date) {
		$("#flag").val("3");
		$("#date").val(date);
		var departName = $("#departName").val();
		if (departName == "" || departName == null) {
			alert("请选择查询科室！");
			return false;
		}
		$("#queryForm").submit();
	}
	function query() {
		$("#flag").val("4");
		var date = $("#nowDate").val();
		if (date != null) {
			$("#date").val(date);
		}else{
			alert("请选择排班日期！");
			return false;
		}
		var departName = $("#departName").val();
		if (departName == "" || departName == null) {
			alert("请选择查询科室！");
			return false;
		}
		$("#queryForm").submit();
	}

	function queryDepart() {
		var groupName = jQuery("#groupName option:selected").val();
		var departName = '${ siDto.departName}';
		groupName = escape(encodeURIComponent(groupName));
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
	function nowWeek() {
	    $("#flag").val("1");
		$("#date").val(date);
		var departName = $("#departName").val();
		if (departName == "" || departName == null) {
			alert("请选择查询科室！");
			return false;
		}
		$("#queryForm").submit();
	}
</script>
</head>
<body>
	<script type="text/javascript">
		window.history.go(1);
	</script>
	<div class="spliter h_10"></div>
	<form:form name="queryForm" id="queryForm" modelAttribute="siDto"
		action="querySchedulInfoByAdmin" method="post">
		<form:hidden path="flag" id="flag" />
		<form:hidden path="date" id="date" />
		<div class="info_div" style="width:90%;">
			<div class="search_header">
				<div class="title">
					<p title="click me to see the details">排班表</p>
				</div>
				<div class="spliter h_10"></div>
				<center>
					组:<select name="groupName" id="groupName" size="1"
						onchange="queryDepart()" style="width:100px;height:23px">
						<option value=""
							<core:if test="${ siDto.groupName==''}">selected="selected"</core:if>>-全部-</option>
						<core:choose>
							<core:when test="${not empty groupList}">
								<core:forEach items="${groupList}" var="dto" varStatus="status">
									<option value="${dto.name }"
										<core:if test="${ dto.name==siDto.groupName}">selected="selected"</core:if>>${dto.name }</option>
								</core:forEach>
							</core:when>
						</core:choose>
					</select>&nbsp; 科室:<select name="departName" id="departName" size="1"
						style="height:23px"></select> 排班日期： <input type="text"
						id="nowDate" name="nowDate" class="lbl Wdate" style="width:100px;"
						readonly="readonly"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',lang:'zh-cn'})"
						value="${date }" /> <input type="button" value="查询" class="button"
						onclick="query()" /> &nbsp;
			<input type="button" value="当前周" class="button"
				onclick="nowWeek()" /> &nbsp;<input type="button" value="上一周" class="button"
				onclick="beforeWeek('${siDto.fromDate}')" />&nbsp; <input type="button"
				value="下一周" class="button" onclick="nextWeek('${siDto.toDate}')" />
		
				</center>
			</div>
			<div class="spliter h_10"></div>
		</div>
		<form:hidden path="fromDate" value="${ siDto.fromDate}" />
		<form:hidden path="toDate" value="${ siDto.toDate}" />
		<div class="spliter h_10"></div>
		<div class="info_div" style="width:90%;">
			<table cellpadding="5" cellspacing="0" class="data_tab" id="tbl">
				<tr>
					<th style="width:130px;font-size:15px">科室</th>
					<th  style="width:60px;font-size:15px">姓名</th>
					<th  style="width:60px;font-size:15px">层级</th>
					<th style="width:80px">星期一</th>
					<th style="width:80px">星期二</th>
					<th style="width:80px">星期三</th>
					<th style="width:80px">星期四</th>
					<th style="width:80px">星期五</th>
					<th style="width:80px">星期六</th>
					<th style="width:80px">星期日</th>
				</tr>
				<tr>
				<td></td>
				<td></td>
					<td></td>
					<core:choose>
						<core:when test="${not empty weekDateList}">
							<core:forEach items="${weekDateList}" var="dto"
								varStatus="status">
								<td>${dto}</td>
							</core:forEach>
						</core:when>
					</core:choose>
				</tr>
				<core:choose>
					<core:when test="${not empty siDto.sidList}">
						<core:forEach items="${siDto.sidList}" var="dto"
							varStatus="status">
							<tr style="height:28px">
								<td>${dto.departName }</td>
								<td>${dto.userName }</td>
								<td>${dto.levl}</td>
								<td><input  type="text" value="${dto.monState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<td><input  type="text" value="${dto.tueState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<td><input  type="text" value="${dto.wedState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<td><input  type="text" value="${dto.turState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<td><input  type="text" value="${dto.friState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<td><input  type="text" value="${dto.satState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<td><input  type="text" value="${dto.sunState }" style="text-align:center;width:60px;height:23px" readonly="readonly"/> </td>
								<!-- 
								<td>${dto.monState }</td>
								<td>${dto.tueState }</td>
								<td>${dto.wedState }</td>
								<td>${dto.turState }</td>
								<td>${dto.friState }</td>
								<td>${dto.satState }</td>
								<td>${dto.sunState }</td> -->
							</tr>
						</core:forEach>
					</core:when>
				</core:choose>
			</table>
			<br />
		</div>
		
	</form:form>


</body>
</html>
