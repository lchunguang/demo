<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导入工作量</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script type="text/javascript" src="${jspath }/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath }/public.js"></script>
<script type="text/javascript">
	function checkNum(tt) {
		var num = tt.value;
		var reg = /^\+?[1-9]\d*$/;
		if (reg.test(num)) {
			tt.className = 'text1';
			tt.title = '';
			return true;
		} else {
			tt.title = '请出入正确的格式!';
			tt.className = 'td2';
			return false;
		}
	}
<%String importMsg = "";
			if (request.getSession().getAttribute("msg") != null) {
				importMsg = request.getSession().getAttribute("msg").toString();
			}
			request.getSession().setAttribute("msg", "");%>
	//提交时检查提交信息
	function check() {
		if (!checkNum(document.getElementById("year"))) {
			return false;
		}
		if (!checkNum(document.getElementById("month"))) {
			return false;
		}
		var excel_file = $("#excel_file").val();
		if (excel_file == "" || excel_file.length == 0) {
			alert("请选择文件路径！");
			return false;
		} else {
			return true;
		}
	}

	function querySalary() {
		var year = $.trim($("#year").val());
		var month = $.trim($("#month").val());
		var userType = $("#userType").val();
		if (!checkNum(document.getElementById("year"))) {
			return false;
		}
		if (!checkNum(document.getElementById("month"))) {
			return false;
		}
		window.location.href = "querySalary?year=" + year + "&month=" + month
				+ "&userType=" + userType;
	}

	function loadTemplate() {
		window.location.href = "download?userType=2";
	}
	function deleteSalary() {
		if (!confirm("确认清空该月工资吗?")) {
			return false;
		}
		var year = $.trim($("#year").val());
		var month = $.trim($("#month").val());
		var userType = $("#userType").val();
		if (!checkNum(document.getElementById("year"))) {
			return false;
		}
		if (!checkNum(document.getElementById("month"))) {
			return false;
		}
		window.location.href = "deleteSalary?year=" + year + "&month=" + month
				+ "&userType=" + userType;
	}

	$(document).ready(function() {
		var msg = "";
		if ($("#importMsg").text() != null) {
			msg = $("#importMsg").text();
		}
		if (msg != "") {
			alert(msg);
		}
	});
</script>
<style type="text/css">
.table-head {
	padding-right: 17px;
	background-color: #999;
	color: #000;
}

.table-body {
	width: 1700px;
	height: 480px;
	overflow-y: scroll;
	overflow-x: hidden;
}

table-head table,.table-body table {
	width: 1700px;
}

table-body table tr:nth-child(2n+1) {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<div class="spliter h_10"></div>
	<div class="info_div">
		<div class="search_header">
			<div class="title">
				<p class="min" title="click me to see the details">导入合同工资条</p>
			</div>
			<div style="margin-left:20px;margin-top:10px;margin-bottom:10px">
				<form:form id="queryForm" action="batchImport"
					enctype="multipart/form-data" modelAttribute="salaryDto"
					method="post" onsubmit="return check();">
					<form:hidden path="userType" value="${salaryDto.userType}" />
					<table class="tab1">
						<tr>
							<td>年：<form:input path="year" id="year" value="${year}"
									style="height:20px;width:50px" onblur="checkNum(this)" /> 月：<form:input
									path="month" id="month" value="${month}"
									style="height:20px;width:30px" onblur="checkNum(this)" /> <input
								id="excel_file" type="file" name="filename" accept="xlsx"
								size="80" /> <input id="excel_button" type="submit"
								value="导入Excel" style="width:80px;height:25px" />&nbsp;<input
								id="query_button" type="button" value="查询工资"
								style="width:80px;height:25px" onclick="querySalary()" />&nbsp;<input id="delete_button" type="button" value="清空数据"
								style="width:80px;height:25px" onclick="deleteSalary()" />
								&nbsp;<input id="excel_button" type="button"
								value="模板下载" style="width:80px;height:25px" onclick="loadTemplate()"  /> <font
								id="importMsg" color="red"><%=importMsg%></font>
							</td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
	<core:choose>
		<core:when test="${not empty salaryList}">
			<div class="info_div_black"
				style="border:0px; margin-left:10px;margin-right:10px;margin-top:10px;display:block;overflow-x:scroll;overflow-y:hidden;height:500px">
				<center>
					<span style="font-size:14px;font-weight:bold;">${salaryDto.year}年${salaryDto.month}月工资</span>
				</center>
				<div class="table-head">
					<table cellpadding="5" cellspacing="0" style="width:1700px"
						border='0px' class="tab1">
						<thead>
							<tr style="border-bottom:1px solid #828282;" bgcolor="#eeeeee">
						<td style="text-align:center;border:1px solid #828282;width:50px;">工号</td>
								<td
									style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">姓名</td>
								<td
									style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:120px;">科室</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">基本工资</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">薪级</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">职称</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">绩效</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">夜班</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">加班</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">津贴</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">其他</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">应发合计</td>
								<td
									style="border-left:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">工会会费</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">养老金</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">失业金</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">医保</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">公积金</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">绩效</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">水电</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">其他</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">个税</td>
								<td
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">实发合计</td>
								<th
									style="border-right:1px solid #828282;border-top:1px solid #828282;width:10px;">&nbsp;</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table-body">
					<table cellpadding="5" cellspacing="0" style="width:1700px"
						border='0px' class="tab1">
						<tbody>
							<core:forEach items="${salaryList}" var="dto" varStatus="status">
								<tr
									style="border-bottom:1px solid #828282;border-left:1px solid #828282;">
									<td style="border-right:1px solid #828282;width:50px;">${dto.userId}</td>
									<td style="border-right:1px solid #828282;width:60px;">${dto.userName}</td>
									<td style="border-right:1px solid #828282;width:120px;">${dto.departName}</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.positionSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.gradeSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.titleSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.performancePay }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.nightSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.overtimePay }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.allowance }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.otherPay }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.grossSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.memberSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.oldPension }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.unemploymentPay }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.medicalSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.houseFund }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.performancePay1 }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.hydropowerSalary }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.otherPay1 }</td>
									<td style="border-right:1px solid #828282;width:60px;">${ dto.tax }</td>
									<td style="border-right:1px solid #828282;width:60px;color:red">${ dto.netPay }</td>
									<td style="border-right:1px solid #828282;width:10px;"></td>
								</tr>
							</core:forEach>
						</tbody>
					</table>
					<br />
					<br />
					<br />
				</div>
			</div>
		</core:when>
		<core:otherwise>
			<center>
				<div style="color: red;margin-top:30px;font-size:16px;">该月工资暂未导入.</div>
			</center>
		</core:otherwise>
	</core:choose>
</body>
</html>
