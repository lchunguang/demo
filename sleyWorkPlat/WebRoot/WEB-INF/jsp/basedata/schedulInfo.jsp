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
		window.location.href = "toQuerySchedulInfo?flag=2&date=" + date;
	}
	function nextWeek(date) {
		window.location.href = "toQuerySchedulInfo?flag=3&date=" + date;
	}
	function nowWeek() {
		window.location.href = "toQuerySchedulInfo?flag=1";
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
					window.location.href = "toQuerySchedulInfoTemp?departName="
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
		window.location.href = "toQuerySchedulInfo?flag=4&date=" + date;
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
		var monStateSelect = "<select name='sidList["+ j + "].monState' id='monState_"+ j + "' style='width:80px;height:22px' >";
		var option = "<option value=''></option><option value='行管'>行管</option><option value='主'>主</option><option value='白'>白</option><option value='治疗'>治疗</option><option value='巡回'>巡回</option><option value='夜'>夜</option><option value='晚'>晚</option><option value='休'>休</option><option value='下夜'>下夜</option><option value='听'>听</option><option value='病休'>病休</option><option value='年休'>年休</option><option value='产假'>产假</option><option value='主助'>主助</option><option value='药助'>药助</option><option value='巡助'>巡助</option><option value='责1'>责1</option><option value='责2'>责2</option><option value='责3'>责3</option><option value='责4'>责4</option><option value='责5'>责5</option>";
		var tueStateSelect = "<select name='sidList["+ j + "].tueState' id='tueState_"+ j + "' style='width:80px;height:22px' >";
		var wedStateSelect = "<select name='sidList["+ j + "].wedState' id='wedState_"+ j + "' style='width:80px;height:22px' >";
		var turStateSelect = "<select name='sidList["+ j + "].turState' id='turState_"+ j + "' style='width:80px;height:22px' >";
		var friStateSelect = "<select name='sidList["+ j + "].friState' id='friState_"+ j + "' style='width:80px;height:22px' >";
		var satStateSelect = "<select name='sidList["+ j + "].satState' id='satState_"+ j + "' style='width:80px;height:22px' >";
		var sunStateSelect = "<select name='sidList["+ j + "].sunState' id='sunState_"+ j + "' style='width:80px;height:22px' >";
		var remark = "<input type='text' name='sidList["+j+"].remark' id='remark_"+j+"' style='width:60px;height:22px' />";
		var del = "<img src='${imagepath}/delete_img.png' onclick='deleteRow(this,"
				+ j + ")'/>";
		var str = "<tr>";
		str += "<td class='align_center'>" + sid + "</td>";
		str += "<td class='align_center'>" + groupName + "</td>";
		str += "<td class='align_center'>" + userName + "</td>";
		str += "<td class='align_center'>" + levl + lb_levl + "</td>";
		str += "<td class='align_center'>" + monStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + tueStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + wedStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + turStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + friStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + satStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + sunStateSelect + option
				+ "</select></td>";
		str += "<td class='align_center'>" + remark + "</td>";
		str += "<td class='align_center'>" + del + "</td>";
		str += "</tr>";
		$("#tbl").append(str);
		j++;
		m++;
	}

	/*function autoCompleteUser(j,flg) {
		// prepare the data
		var url = "autoCompleteUser";
		var source = {
			datatype : "json",
			datafields : [ {
				name : 'sm'
			}, {
				name : 'name'
			} ],
			url : url,
			async : true
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		// Create a jqxComboBox
		$("#jqxWidget_" + j).jqxComboBox({
			selectedIndex : 0,
			source : dataAdapter,
			displayMember : "sm",
			valueMember : "name",
			width : 100,
			height : 25
		});
		// trigger the select event.
		$("#jqxWidget_" + j).on('select', function(event) {
			if (event.args) {
				var item = event.args.item;
				if (item && item.value) {
				var arr = item.value.split(",");
					$("#lb_userName_" + j).text(arr[0]);
					$("#userName_" + j).val(arr[0]);
					$("#levl_" + j).val(arr[1]);
					$("#lb_levl_" + j).text(arr[1]);
				}
			}
		});
	}
	$(document).ready(function() {
		for (var i = 0; i < ${size}; i++) {
			autoCompleteUser(i,1);
		}
	});*/

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
				onmouseover="this.stop()" onmouseout="this.start()">特别提醒：输入姓名后回车，可自动查询层级</marquee>
		</div>
		<form:hidden path="tempFlag" id="tempFlag" value="${ siDto.tempFlag}" />
		<form:hidden path="departName" value="${ siDto.departName}" />
		<form:hidden path="fromDate" value="${ siDto.fromDate}" />
		<form:hidden path="toDate" value="${ siDto.toDate}" />
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
								<td><select name="sidList[${status.index }].monState"
									id="monState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.monState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.monState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.monState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.monState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.monState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.monState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.monState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.monState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.monState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.monState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.monState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.monState=='年休'}">selected="selected"</core:if>>年休</option>
										<option value="产假"
											<core:if test="${ dto.monState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.monState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.monState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.monState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.monState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.monState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.monState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.monState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.monState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
								<td><select name="sidList[${status.index }].tueState"
									id="tueState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.tueState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.tueState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.tueState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.tueState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.tueState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.tueState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.tueState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.tueState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.tueState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.tueState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.tueState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.tueState=='年休'}">selected="selected"</core:if>>年休</option>
										<option value="产假"
											<core:if test="${ dto.tueState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.tueState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.tueState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.tueState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.tueState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.tueState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.tueState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.tueState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.tueState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
								<td><select name="sidList[${status.index }].wedState"
									id="wedState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.wedState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.wedState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.wedState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.wedState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.wedState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.wedState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.wedState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.wedState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.wedState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.wedState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.wedState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.wedState=='年休'}">selected="selected"</core:if>>年休</option>
										<option value="产假"
											<core:if test="${ dto.wedState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.wedState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.wedState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.wedState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.wedState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.wedState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.wedState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.wedState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.wedState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
								<td><select name="sidList[${status.index }].turState"
									id="turState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.turState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.turState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.turState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.turState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.turState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.turState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.turState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.turState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.turState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.turState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.turState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.turState=='年休'}">selected="selected"</core:if>>年休</option>
										<option value="产假"
											<core:if test="${ dto.turState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.turState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.turState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.turState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.turState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.turState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.turState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.turState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.turState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
								<td><select name="sidList[${status.index }].friState"
									id="friState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.friState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.friState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.friState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.friState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.friState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.friState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.friState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.friState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.friState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.friState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.friState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.friState=='年休'}">selected="selected"</core:if>>年休</option>
									<option value="产假"
											<core:if test="${ dto.friState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.friState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.friState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.friState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.friState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.friState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.friState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.friState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.friState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
								<td><select name="sidList[${status.index }].satState"
									id="satState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.satState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.satState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.satState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.satState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.satState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.satState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.satState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.satState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.satState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.satState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.satState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.satState=='年休'}">selected="selected"</core:if>>年休</option>
										<option value="产假"
											<core:if test="${ dto.satState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.satState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.satState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.satState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.satState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.satState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.satState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.satState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.satState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
								<td><select name="sidList[${status.index }].sunState"
									id="sunState_${status.index }" style="width:80px;height:22px"
									<core:if test="${siDto.outFlag<0}"> disabled="disabled"</core:if>>
										<option value=""></option>
										<option value="行管"
											<core:if test="${ dto.sunState=='行管'}">selected="selected"</core:if>>行管</option>
										<option value="主"
											<core:if test="${ dto.sunState=='主'}">selected="selected"</core:if>>主</option>
										<option value="白"
											<core:if test="${ dto.sunState=='白'}">selected="selected"</core:if>>白</option>
										<option value="晚"
											<core:if test="${ dto.sunState=='晚'}">selected="selected"</core:if>>晚</option>
										<option value="治疗"
											<core:if test="${ dto.sunState=='治疗'}">selected="selected"</core:if>>治疗</option>
										<option value="巡回"
											<core:if test="${ dto.sunState=='巡回'}">selected="selected"</core:if>>巡回</option>
										<option value="夜"
											<core:if test="${ dto.sunState=='夜'}">selected="selected"</core:if>>夜</option>
										<option value="休"
											<core:if test="${ dto.sunState=='休'}">selected="selected"</core:if>>休</option>
										<option value="下夜"
											<core:if test="${ dto.sunState=='下夜'}">selected="selected"</core:if>>下夜</option>
										<option value="听"
											<core:if test="${ dto.sunState=='听'}">selected="selected"</core:if>>听</option>
										<option value="病休"
											<core:if test="${ dto.sunState=='病休'}">selected="selected"</core:if>>病休</option>
										<option value="年休"
											<core:if test="${ dto.sunState=='年休'}">selected="selected"</core:if>>年休</option>
										<option value="产假"
											<core:if test="${ dto.sunState=='产假'}">selected="selected"</core:if>>产假</option>
										<option value="主助"
											<core:if test="${ dto.sunState=='主助'}">selected="selected"</core:if>>主助</option>
										<option value="药助"
											<core:if test="${ dto.sunState=='药助'}">selected="selected"</core:if>>药助</option>
										<option value="巡助"
											<core:if test="${ dto.sunState=='巡助'}">selected="selected"</core:if>>巡助</option>
										<option value="责1"
											<core:if test="${ dto.sunState=='责1'}">selected="selected"</core:if>>责1</option>
										<option value="责2"
											<core:if test="${ dto.sunState=='责2'}">selected="selected"</core:if>>责2</option>
										<option value="责3"
											<core:if test="${ dto.sunState=='责3'}">selected="selected"</core:if>>责3</option>
										<option value="责4"
											<core:if test="${ dto.sunState=='责4'}">selected="selected"</core:if>>责4</option>
										<option value="责5"
											<core:if test="${ dto.sunState=='责5'}">selected="selected"</core:if>>责5</option>
								</select></td>
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
