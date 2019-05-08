<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设置排班</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<link rel="stylesheet" type="text/css"
	href="${csspath}/jquery-ui-1.8.6.css" />
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="${jspath}/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>


<script type="text/javascript">
	function save() {
		if (!confirm("确定保存吗？")) {
			return false;
		}
		$("#addForm").submit();

	}

	function setTemp() {
		if (!confirm("确定存模板吗？")) {
			return false;
		}
		$("#tempFlag").val("1");//1：标识存为模板
		$("#addForm").submit();

	}

	//queryTemp
	function codefans() {
		if (tip != "") {
			var box = document.getElementById("tip");
			box.style.display = "none";
		}
	}
	setTimeout("codefans()", 2000);//2秒，可以改动

	function beforeWeek(date) {
		window.location.href = "toQuerySchedulInfo?flag=2&type=1&date=" + date;
	}
	function nextWeek(date) {
		window.location.href = "toQuerySchedulInfo?flag=3&type=1&date=" + date;
	}
	function nowWeek() {
		window.location.href = "toQuerySchedulInfo?flag=1&type=1";
	}
	//查詢模板
	function queryTemp() {
		var departName = $("#departName").val();
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		$.ajax({
			type : "GET",
			async : false,
			url : "checkTempExist?time=" + new Date(),
			data : "departName=" + departName,
			success : function(msg) {
				if (msg == false) {
					alert("无模板！");
					return false;
				} else {
					window.location.href = "toQuerySchedulInfoTemp?type=1&departName="
							+ departName + "&fromDate=" + fromDate + "&toDate="
							+ toDate;

				}
			}
		});

	}

	function query() {
		var date = $("#nowDate").val();
		if (date == "") {
			alert("请选择查询日期！");
			return false;
		}
		window.location.href = "toQuerySchedulInfo?flag=4&type=1&date=" + date;
	}
	function print() {
		var departName = $("#departName").val();
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		window.location.href = "printSchedulInfo?departName=" + departName
				+ "&fromDate=" + fromDate + "&toDate=" + toDate;
	}

	var j = ${size};//初始化个数
	//记录当前页面行个数
	var m = j;
	function deleteRow(o, st) {
		if (m == 1) {
			alert("排班列表不能为空！");
			return false;
		}
		if (!confirm("确认删除该排班信息?")) {
			return false;
		}
		$(o).parent().parent().remove();
		m--;

	}

	function addRow(o) {
		//var sm = "<div id='jqxWidget_" + j + "' class='jqxWidget'></div>";
		var sid = "<input type='text' name='sidList["+j+"].sid' id='sid_"+j+"' style='width:25px;height:22px' />";
		var groupName = "<input type='text' name='sidList["+j+"].groupName' id='groupName_"+j+"' style='width:60px;height:22px' />";
		var userName = "<input type='text' name='sidList["
				+ j
				+ "].userName' id='userName_"
				+ j
				+ "' style='width:80px;height:22px' onkeypress='EnterPress(event,this,"
				+ j + ")' onkeydown='EnterPress(this," + j + ")'/>";
		//var lb_userName = "<label id='lb_userName_"+j+"'></label>";
		var levl = "<input type='hidden' name='sidList["+j+"].levl' id='levl_"+j+"' />";
		var lb_levl = "<label id='lb_levl_"+j+"'></label>";
		var departName = "<input type='hidden' name='sidList["+j+"].departName' id='departName_"+j+"' />";
		/*var userName = "<input type='text' class='text1' style='height:22px;background-color:#eeeeff' name='sidList["
				+ j
				+ "].userName' id='userName_"
				+ j
				+ "' readonly='readonly' />";*/
		var monState = "<input type='text' name='sidList["+j+"].monState' id='monState_"+j+"' style='width:60px;height:22px' />";
		var tueState = "<input type='text' name='sidList["+j+"].tueState' id='tueState_"+j+"' style='width:60px;height:22px' />";
		var wedState = "<input type='text' name='sidList["+j+"].wedState' id='wedState_"+j+"' style='width:60px;height:22px' />";
		var turState = "<input type='text' name='sidList["+j+"].turState' id='turState_"+j+"' style='width:60px;height:22px' />";
		var friState = "<input type='text' name='sidList["+j+"].friState' id='friState_"+j+"' style='width:60px;height:22px' />";
		var satState = "<input type='text' name='sidList["+j+"].satState' id='satState_"+j+"' style='width:60px;height:22px' />";
		var sunState = "<input type='text' name='sidList["+j+"].sunState' id='sunState_"+j+"' style='width:60px;height:22px' />";
		var remark = "<input type='text' name='sidList["+j+"].remark' id='remark_"+j+"' style='width:60px;height:22px' />";
		var del = "<img src='${imagepath}/delete_img.png' onclick='deleteRow(this,"
				+ j + ")'/>";
		var str = "<tr>";
		//str += "<td class='align_center'>" + sm + "</td>";
		str += "<td class='align_center'>" + sid + "</td>";
		str += "<td class='align_center'>" + groupName + "</td>";
		str += "<td class='align_center'>" + userName + "</td>";
		str += "<td class='align_center'>" + levl + lb_levl + "</td>";
		str += "<td class='align_center'>" + monState
				+ "</select></td>";
		str += "<td class='align_center'>" + tueState
				+ "</select></td>";
		str += "<td class='align_center'>" + wedState
				+ "</select></td>";
		str += "<td class='align_center'>" + turState
				+ "</select></td>";
		str += "<td class='align_center'>" + friState
				+ "</select></td>";
		str += "<td class='align_center'>" + satState
				+ "</select></td>";
		str += "<td class='align_center'>" + sunState
				+ "</select></td>";
		str += "<td class='align_center'>" + remark + "</td>";
		str += "<td class='align_center'>" + del + "</td>";
		str += "</tr>";
		$("#tbl").append(str);
		j++;
		m++;
	}

	

	function EnterPress(e, o, i) { //传入 event 
		var e = e || window.event;
		if (e.keyCode == 13) {
			queryLevlByUserName(o, i);
		}
	}

	function queryLevlByUserName(o, i) {
		var userName = $.trim($(o).val());
		if (userName != "") {
			$.ajax({
				type : "GET",
				async : false,
				url : "queryLevlByUserName?time=" + new Date() + "&userName="
						+ userName,
				data : "",
				success : function(data) {
					if (data != null && data != "" && data != undefined) {
						$("#levl_" + i).val(data.levl);
						$("#lb_levl_" + i).text(data.levl);

					} else {
						alert("该姓名不存在！");
						$("#userName_" + i).val("");
						$("#levl_" + i).val("");
						$("#lb_levl_" + i).text("");
						return false;
					}
				}
			});
		}

	}
</script>
</head>
<body>
	<script type="text/javascript">
		window.history.go(1);
	</script>
	<div class="spliter h_10"></div>
	<form:form name="addForm" id="addForm" modelAttribute="siDto"
		action="setSchedulInfo" method="post">
		<div class="info_div">
			<div class="search_header">
				<div class="title">
					<p title="click me to see the details">排班表</p>
				</div>
				<div class="spliter h_10"></div>
				<center>
					排班日期： <input type="text" id="nowDate" name="nowDate"
						class="lbl Wdate" style="width:100px;" readonly="readonly"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',lang:'zh-cn'})"
						value="${date }" /> <input type="button" value="查询"
						class="button" onclick="query()" />&nbsp;&nbsp;<input
						type="button" value="当前周" class="button" onclick="nowWeek()" />
					&nbsp;<input type="button" value="上一周" class="button"
						onclick="beforeWeek('${siDto.fromDate}')" />&nbsp; <input
						type="button" value="下一周" class="button"
						onclick="nextWeek('${siDto.toDate}')" />&nbsp;
					<core:if test="${siDto.outFlag>=0}">
						<input type="button" value="调用模板" class="button"
							onclick="queryTemp()" />&nbsp;<input type="button" value="存为模板"
							class="button" onclick="setTemp()" />&nbsp;<input type="button"
							value="保存" class="button" onclick="save()" />&nbsp;&nbsp;<input
							type="button" value="打印" class="button" onclick="print()" />&nbsp;</core:if>
					<span style="color:red" id="tip">${tip}</span>

				</center>
				<div class="spliter h_10"></div>
			</div>
		</div>
		<div style="font-size:16px;color:red;width:100%">
			<marquee id="marquee2" direction="left" scrollamount=6
				onmouseover="this.stop()" onmouseout="this.start()">特别提醒：输入姓名后回车，可自动查询层级；排序升序（1，2,3..依次排序）,可用相同排序号</marquee>
		</div>
		<form:hidden path="tempFlag" id="tempFlag" value="${ siDto.tempFlag}" />
		<form:hidden path="departName" value="${ siDto.departName}" />
		<form:hidden path="fromDate" value="${ siDto.fromDate}" />
		<form:hidden path="toDate" value="${ siDto.toDate}" />
		<form:hidden path="type"  id="1" value="${ siDto.type}" />
		<core:if test="${siDto.outFlag>=0}">
			<div class="import" align="left">
				<a href="#" onclick="addRow(this)"><img
					src="${imagepath}/Add_img.png" />添加排班</a>
			</div>
		</core:if>
		<div class="info_div">
			<table cellpadding="5" cellspacing="0" class="data_tab" id="tbl">
				<tr>
					<!-- <th rowspan="2" style="width:130px;font-size:15px">科室</th> -->
					<th rowspan="2" style="width:60px;font-size:15px">排序号</th>
					<th rowspan="2" style="width:40px;font-size:15px">班次</th>
					<th rowspan="2" style="width:50px;font-size:15px">姓名</th>
					<th rowspan="2" style="width:40px;font-size:15px">层级</th>
					<th style="width:80px">星期一</th>
					<th style="width:80px">星期二</th>
					<th style="width:80px">星期三</th>
					<th style="width:80px">星期四</th>
					<th style="width:80px">星期五</th>
					<th style="width:80px">星期六</th>
					<th style="width:80px">星期日</th>
					<th style="width:80px">备注</th>
					<th style="width:20px">操作</th>
				</tr>
				<tr>
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
								<!-- 	<td class="align_center">
									<div id='jqxWidget_${status.index }' class="jqxWidget"></div>
								</td> -->
								<td><input type="text" name="sidList[${status.index }].sid"
									id="sid_${status.index }" value="${dto.sid}"
									style="width:25px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="text"
									name="sidList[${status.index }].groupName"
									id="groupName_${status.index }" value="${dto.groupName }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="text"
									name="sidList[${status.index }].userName"
									id="userName_${status.index }" value="${dto.userName }"
									style="width:80px;height:22px"
									onkeypress="EnterPress(event,this,${status.index })"
									onkeydown="EnterPress(this,${status.index })"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="hidden"
									name="sidList[${status.index }].levl" value="${dto.levl }"
									id="levl_${status.index }" /> <label
									id="lb_levl_${status.index }">${dto.levl }</label></td>
								<td><input type="text"
									name="sidList[${status.index }].monState"
									id="monState_${status.index }" value="${dto.monState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="text"
									name="sidList[${status.index }].tueState"
									id="tueState_${status.index }" value="${dto.tueState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> /></td>
								<td><input type="text"
									name="sidList[${status.index }].wedState"
									id="wedState_${status.index }" value="${dto.wedState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> /></td>
								<td><input type="text"
									name="sidList[${status.index }].turState"
									id="turState_${status.index }" value="${dto.turState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> /></td>
								<td><input type="text"
									name="sidList[${status.index }].friState"
									id="friState_${status.index }" value="${dto.friState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="text"
									name="sidList[${status.index }].satState"
									id="satState_${status.index }" value="${dto.satState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="text"
									name="sidList[${status.index }].sunState"
									id="sunState_${status.index }" value="${dto.sunState }"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td><input type="text"
									name="sidList[${status.index }].remark"
									id="remark_${status.index }" value="${dto.remark}"
									style="width:60px;height:22px"
									<core:if test="${siDto.outFlag<0}"> readonly=" readonly"</core:if> />
								</td>
								<td class="align_center"><core:if
										test="${siDto.outFlag>=0}">
										<img src="${imagepath}/delete_img.png" class="del"
											title="delete" onclick="deleteRow(this,${status.index})" />
									</core:if></td>

							</tr>
						</core:forEach>
					</core:when>
				</core:choose>

			</table>

			<table cellpadding="5" cellspacing="0" class="data_tab" id="tbl">
				<tr>
					<td><b>备注：</b></td>
					<td style="height:60px;"><core:if test="${siDto.outFlag<0}">
							<form:textarea path="remark" rows="2" style="width:98%"
								value="${ siDto.remark}" readonly="true" />
						</core:if> <core:if test="${siDto.outFlag>=0}">
							<form:textarea path="remark" rows="2" style="width:98%"
								value="${ siDto.remark}" />
						</core:if></td>
				</tr>
			</table>
		</div>

	</form:form>

</body>
</html>
