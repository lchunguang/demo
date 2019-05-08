<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Expires" CONTENT="0" />
<meta http-equiv="Cache-Control" CONTENT="no-cache" />
<meta http-equiv="Pragma" CONTENT="no-cache" />
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script src="${jspath }/LodopFuncs.js" type="text/javascript"></script>
<script src="${jspath }/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${jspath}/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath}/public.js"></script>
<script type="text/javascript" src="${jspath}/jquery.dataTables.js"></script>
<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
</head>
<body>
	<center>
		<div id="div1">
			<form:form id="printForm" modelAttribute="siDto">
				<table width="750px" border="0px" cellspacing="0" cellpadding="0"
					align="center"
					style="table-layout：fixed;border-collapse: collapse;">
					<thead>
					
						<tr>
							<th colspan="10"
								style="text-align: center; border:'0px';height:40px; "><font
								style="font-size:18px; font-family:'黑体';">${siDto.departName} 排班表</font></th>
						</tr>
						<tr>
							<th rowspan="2"
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">班次</th>
							<th rowspan="2"
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">姓名</th>
							<th rowspan="2"
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">层级</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周一</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周二</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周三</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周四</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周五</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周六</th>
							<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">周日</th>
								<th
								style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 25px;">备注</th>
						</tr>
						<tr>
							<core:choose>
								<core:when test="${not empty weekDateList}">
									<core:forEach items="${weekDateList}" var="dto"
										varStatus="status">
										<th
											style="font-size:11px;text-align:center;border: 1px solid #333333;">${dto}</th>
									</core:forEach>
								</core:when>
							</core:choose>
							<th style="font-size:11px;text-align:center;border: 1px solid #333333;"></th>
						</tr>
					</thead>

					<tbody>
						<core:choose>
							<core:when test="${not empty siDto.sidList}">
								<core:forEach items="${siDto.sidList}" var="dto"
									varStatus="status">
									<tr>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.groupName}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.userName}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.levl}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.monState}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.tueState}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.wedState}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.turState}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.friState}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.satState}</td>
										<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.sunState}</td>
											<td
											style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 15px;color: #000000;height: 22px;">${dto.remark}</td>
									</tr>
								</core:forEach>
							</core:when>
						</core:choose>
						<tr>
						<td style="text-align:center;border: 1px solid #333333;font-family: '宋体';font-size: 14px;width:40px">备注</td>
						<td style="text-align:left;border: 1px solid #333333;font-family: '宋体';font-size: 14px;" colspan="10">${siDto.remark}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="9"
								style="text-align:right;border-bottom: 0px solid #333333;border-right: 0px solid #333333;border-left: 0px solid #333333;font-family: '宋体';font-weight:bold;font-size: 15px;color: #000000;height: 25px;">当前是第<font
								tdata="PageNO" color="blue">##</font>页/共<font tdata="PageCount"
								color="blue">##</font>页
							</th>
						</tr>
					</tfoot>
				</table>
			</form:form>
		</div>
		<center class="onlyShow">
			<button onclick='PrintBrouse()' class="button">&nbsp;打&nbsp;印&nbsp;预&nbsp;览</button>
			&nbsp;&nbsp;
			<button onclick='Print()' class="button">&nbsp;打&nbsp;印&nbsp;</button>
		</center>
	</center>
	<script language="javascript">
		function Print() {
			LODOP = getLodop(document.getElementById('LODOP_OB'), document
					.getElementById('LODOP_EM'));
			LODOP.PRINT_INIT("排班表打印");
			LODOP.ADD_PRINT_TABLE(10, 0, "100%", "100%", document
					.getElementById("printForm").innerHTML);
			LODOP.SET_PRINT_STYLEA(0, "Vorient", 3);
			LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");//高度和寬度默認單位是0.1mm
			//LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);//横向时的正向显示
			LODOP.PRINT();
		};
		function PrintBrouse() {
			LODOP = getLodop(document.getElementById('LODOP_OB'), document
					.getElementById('LODOP_EM'));
			LODOP.PRINT_INIT("排班表打印");
			LODOP.ADD_PRINT_TABLE(10, 0, "100%", "100%", document
					.getElementById("printForm").innerHTML);
			LODOP.SET_PRINT_STYLEA(0, "Vorient", 3);
			LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4");//高度和寬度默認單位是0.1mm
			//LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED", 1);//横向时的正向显示
			LODOP.PREVIEW();
		};
	</script>
</body>
</html>
