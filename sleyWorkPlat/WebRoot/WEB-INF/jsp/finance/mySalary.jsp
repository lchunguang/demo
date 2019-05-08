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
		var num = $.trim(tt.value);
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

	//提交时检查提交信息
	function check() {
		
		var year = $.trim($("#year").val());
		var month = $.trim($("#month").val());
		if (!checkNum(document.getElementById("year"))) {
			return false;
		}
		if (!checkNum(document.getElementById("month"))) {
			return false;
		}
		window.location.href = "queryMySalary?year=" + year + "&month=" + month;
	}
</script>

</head>
<body>
	<div class="spliter h_10"></div>
	<div class="info_div">
		<div class="search_header">
			<div class="title">
				<p class="min" title="click me to see the details">我的工资条</p>
			</div>
			<div style="margin-left:20px;margin-top:10px;margin-bottom:10px">
				<form:form id="queryForm" action="queryMySalary"
					modelAttribute="salaryDto" method="get">
					<table class="tab1" style="font-size:15px">
						<tr>
							<td>年：<form:input path="year" id="year" value="${year}"
									style="height:20px;width:50px" onblur="checkNum(this)" /> 月：<form:input
									path="month" id="month" value="${month}"
									style="height:20px;width:30px" onblur="checkNum(this)" /> <input
								id="query_button" type="button" value="查询工资条" onclick="check()"
								style="width:100px;height:25px" />
							</td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>

	<core:if test="${salary==null }">
		<center>
			<div style="color: red;margin-top:20px;font-size:16px;">${month}月工资暂未发放.</div>
		</center>
	</core:if>
	<core:if test="${salary!=null }">
		<center>
			<div style="margin-top:10px;font-size:16px;font-family:'黑体'">${salary.year}年${salary.month }月工资条(&nbsp;单位：元
				)</div>
		</center>
	</core:if>
	<div class="info_div_black"
		style="border:0px; margin-left:10px;margin-right:10px;margin-top:10px;display:block;overflow-x:hidden;overflow-y:hidden;">
		<core:if test="${salary.userType==2 }">
			<table cellpadding="5" cellspacing="0" style="width:100%"
				border='0px' class="tab1">
				<tr style="border-bottom:1px solid #828282;" bgcolor="#eeeeee">
					<td style="text-align:center;border:1px solid #828282;width:50px;">工号</td>
					<td
						style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">姓名</td>
					<td
						style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:90px;">科室</td>
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
				</tr>
				<tr
					style="border-bottom:1px solid #828282;border-left:1px solid #828282;">
					<td style="border-right:1px solid #828282;width:50px;">${salary.userId}</td>
					<td style="border-right:1px solid #828282;width:60px;">${salary.userName}</td>
					<td style="border-right:1px solid #828282;width:90px;">${salary.departName}</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.positionSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.gradeSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.titleSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.performancePay }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.nightSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.overtimePay }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.allowance }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.otherPay }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.grossSalary }</td>
				</tr>
				<tr>
					<td colspan="21" style="height:2px"></td>
				</tr>
				<tr style="" bgcolor="#eeeeee">

					<td
						style="border-bottom:1px solid #828282;border-left:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">工会会费</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">养老金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">失业金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">医保</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">公积金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">绩效</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">水电</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">其他</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">个税</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;"
						colspan="2">实发合计</td>
				</tr>
				<tr style="border-left:1px solid #828282;">
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.memberSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.oldPension }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.unemploymentPay }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.medicalSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.houseFund }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.performancePay1 }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.hydropowerSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.otherPay1 }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.tax }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;color:red"
						colspan="2">${ salary.netPay }</td>
				</tr>
			</table>
		</core:if>
		<core:if test="${salary.userType==1 }">
			<table cellpadding="5" cellspacing="0" style="width:100%"
				border='0px' class="tab1">
				<tr style="border-bottom:1px solid #828282;" bgcolor="#eeeeee">
					<td style="text-align:center;border:1px solid #828282;width:60px;">工号</td>
					<td
						style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">姓名</td>
					<td
						style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:140px;">科室</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">岗位工资</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">薪级工资</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">高出</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">基础绩效</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">奖励绩效</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">浮资</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">10%护</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">护贴</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">卫贴</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">夜班费</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">房补</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">物业补</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">应发合计</td>

				</tr>
				<tr
					style="border-bottom:1px solid #828282;border-left:1px solid #828282;">
					<td style="border-right:1px solid #828282;">${ salary.userId }</td>
					<td style="border-right:1px solid #828282;">${ salary.userName }</td>
					<td style="border-right:1px solid #828282;">${ salary.departName }</td>
					<td style="border-right:1px solid #828282;">${ salary.positionSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.gradeSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.aboveSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.baseSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.encourageSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.floatSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.tenSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.nurseSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.healthSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.nightSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.houseSalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.propertySalary }</td>
					<td style="border-right:1px solid #828282;">${ salary.grossSalary }</td>
				</tr>
				<tr>
					<td colspan="21" style="height:2px"></td>
				</tr>
				<tr bgcolor="#eeeeee">
					<td
						style="border-bottom:1px solid #828282;border-left:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">水电</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">会费</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:140px;">养老金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">职业年金</td>
						<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">失业金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">医保金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">公积金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">绩效</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">其他</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">个税</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;"
						colspan="2">实发合计</td>
				</tr>
				<tr>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-left:1px solid #828282;">${ salary.hydropowerSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.memberSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.oldPension }</td>
											<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.occupAnnuity }</td>
											<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.unemploymentPay }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.medicalSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.houseFund }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.performancePay }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.otherPay }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;">${ salary.tax }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;color:red"
						colspan="2">${ salary.netPay }</td>
				</tr>
			</table>
		</core:if>
		<core:if test="${salary.userType==3}">
			<table cellpadding="5" cellspacing="0" style="width:100%;"
				border='0px' class="tab1">
				<tr style="border-bottom:1px solid #828282;" bgcolor="#eeeeee">
					<td style="text-align:center;border:1px solid #828282;width:50px;">工号</td>
					<td
						style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;"
						colspan="2">科室</td>
					<td
						style="text-align:center;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">姓名</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">岗位工资</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">薪级工资</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">基础绩效</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">奖励绩效</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">房补</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">夜班费</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">浮资</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">津贴</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">其他</td>
					<td
						style="border-right:1px solid #828282;border-top:1px solid #828282;">应发合计</td>

				</tr>
				<tr
					style="border-bottom:1px solid #828282;border-left:1px solid #828282;">
					<td style="border-right:1px solid #828282;width:50px;">${ salary.userId }</td>
					<td style="border-right:1px solid #828282;width:60px;" colspan="2">${ salary.departName }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.userName }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.positionSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.gradeSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.baseSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.encourageSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.houseSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.nightSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.floatSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.healthSalary }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.otherPay }</td>
					<td style="border-right:1px solid #828282;width:60px;">${ salary.grossSalary }</td>
				</tr>
				<tr>
					<td colspan="21" style="height:2px"></td>
				</tr>
				<tr style="" bgcolor="#eeeeee">
					<td
						style="border-bottom:1px solid #828282;border-left:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">工会会费</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">养老金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">失业金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">医保金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">公积金</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">房租</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">水电</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">其他</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;">个税</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;border-top:1px solid #828282;width:60px;"
						colspan="2"><b>实发工资</b></td>
				</tr>
				<tr style="border-left:1px solid #828282;">
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.memberSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.oldPension }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.unemploymentPay }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.medicalSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.houseFund }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.rentPay }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.hydropowerSalary }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.otherPay1 }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;">${ salary.tax }</td>
					<td
						style="border-bottom:1px solid #828282;border-right:1px solid #828282;width:60px;color:red"
						colspan="2"><b>${ salary.netPay}</b></td>
				</tr>
			</table>
		</core:if>
	</div>

</body>
</html>
