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
		window.location.href = "toAddNurseInfoPage";
	}

	function update(o, id) {
		window.location.href = "queryNurseInfoDetail?flag=modify&id=" + id;
	}

	function query(o, id) {
		window.location.href = "queryNurseInfoDetail?flag=query&id=" + id;
	}

	function changeDepart(o, id, userName, departName) {
		loadLayer(o, "toChangeDepart?id=" + id + "&userName=" + userName
				+ "&departName=" + departName, 600, 180);
	}

	function queryDepart() {
		var groupName = jQuery("#groupName option:selected").val();
		var departName = '${ nqd.departName}';
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

	function clickImg(obj) {
		var dv = document.getElementById("div1");
		dv.innerHTML = "<img src=" + obj.src
				+ " width=500 height=500  onclick='hideImg()'/>";
	}
	function hideImg() {
		var dv = document.getElementById("div1");
		dv.innerHTML = "";
	}

	function deleteGoodsDic(o, id, imgName) {
		if (!confirm("确认刪除此物品?")) {
			return false;
		}
		$.ajax({
			type : "GET",
			url : "checkGoodsState?id=" + id,
			data : "",
			error : function() {
				alert('Error');
			},
			success : function(data) {
				if (data > 0) {
					alert("该物品已产生业务，不可以删除！");
					return;
				} else {
					$
							.ajax({
								type : "GET",
								url : "deleteGoodsDic?id=" + id + "&imgName="
										+ imgName,
								data : "",
								error : function() {
									alert('系统出错！');
								},
								success : function(msg) {
									if (msg == "success") {
										alert("刪除成功！");
										$("#queryForm").submit();
									} else {
										alert("刪除出錯！");
									}
								}
							});
				}
			}
		});

	}
</script>
</head>
<body>
	<form:form id="queryForm" method="get" action="toQueryChangeDepartLog"
		modelAttribute="cdlDto">
		<!--the part of header -->
		<div class="spliter h_10"></div>
		<div class="info_div">
			<div class="search_header">
				<div class="title">
					<p title="click me to see the details">调科查询</p>
				</div>
					<table class="search_tab">
						<tr>
							<td>姓名: <form:input path="userName" id="userName"
									class="lbl" style="width:80px;;height:23px" /> <input
								name="ok" type="submit" class="button" value="确认" />
							</td>
						</tr>
					</table>
				<div class="spliter h_5"></div>
			</div>
		</div>

		<div class="spliter h_10"></div>

		<div class="import"></div>
		<!-- /page_div -->
		<!-- data_div -->
		<!-- /data_div -->
		<div class="data_div">
			<table cellpadding="0" cellspacing="0" class="data_tab">
				<tr>
					<th>姓名</th>
					<th>原科室</th>
					<th>调入科室</th>
					<th>调整日期</th>
				</tr>
				<core:choose>
					<core:when test="${not empty cdlList}">
						<core:forEach items="${cdlList}" var="dto" varStatus="status">
							<tr>
								<td>${dto.userName}</td>
								<td>${dto.oldDepartName}</td>
								<td>${dto.newDepartName}</td>
								<td>${dto.changeDate}</td>
							</tr>
						</core:forEach>
					</core:when>
					<core:otherwise>
						<tr>
							<td colspan="4"><span style="color: red;">没有检索数据.</span></td>
						</tr>
					</core:otherwise>
				</core:choose>
			</table>
		</div>
		<%@ include file="/WEB-INF/jsp/include/page.jsp"%>
	</form:form>

</body>
</html>