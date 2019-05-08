<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>护士调科</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script src="${jspath }/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${jspath }/jquery.ui.min.js"></script>
<script type="text/javascript" src="${jspath }/jquery.blockUI.js"></script>
<script type="text/javascript" src="${jspath}/load_layer.js"></script>
<script type="text/javascript" src="${jspath }/public.js"></script>

<script type="text/javascript">
	function queryDepart() {
		var groupName = jQuery("#groupName option:selected").val();
		groupName = escape(encodeURIComponent(groupName));

		$.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : 'queryDepartByGroup?groupName=' + groupName + '&time='
					+ new Date(),
			cache : false,
			data : "",
			dataType : 'json',
			success : function(items) {
				var option = '<option value=""  >—全部—</option>';
				for (var i = 0; i < items.length; i++) {
					option += '<option value='+items[i].departName+'  >'
							+ items[i].departName + '</option>';
				}
				$('#newDepartName').html(option);

			},
			error : function() {
				alert("error");
			}
		});
	}

	$(function() {
		$("#save").click(function() {
			var oldDepart = '${cdl.oldDepartName}';
			var newDepart = $('#newDepartName').val();
			if (oldDepart == newDepart) {
				alert("调入科室不能同原科室一样！");
				return false;
			}
			if (newDepart == ""||newDepart==null) {
				alert("请选择调入科室！");
				return false;
			}
			$.ajax({
				type : "POST",
				async : false,
				url : "changeDepart?time=" + new Date(),
				data : $('#updateForm').serialize(),
				success : function(msg) {
					parent.search();
					removeLayer();
				}
			});

		});
		$("#cancel").click(function() {
			parent.search();
			removeLayer();
		});
		
			queryDepart();
	});
</script>
</head>
<body>
	<div class="spliter h_10"></div>
	<div class="search_m">
		<form:form name="updateForm" id="updateForm"
			modelAttribute="cdl" action="changeDepart" method="post">
			<form:hidden path="userId" id="userId" value="${cdl.userId }"/>
			<table border="0" cellpadding="0" cellspacing="0" class="data_tab">
				<tr>
					<th colspan="4">护士调科</th>
				</tr>
				<tr>
					<td style="height:28px">姓名:</td>
					<td><form:input path="userName" id="userName" readonly="true"
							style="width:100px;height:23px" /></td>
					<td>当前科室:</td>
					<td><form:input path="oldDepartName" id="oldDepartName"
							readonly="true" style="width:100px;height:23px" /></td>
				</tr>
				<tr>
					<td style="height:28px">组</td>
					<td><select name="groupName" id="groupName" size="1"
						onchange="queryDepart()" style="width:100px;height:23px">
							<option value="">-全部-</option>
							<core:choose>
								<core:when test="${not empty groupList}">
									<core:forEach items="${groupList}" var="dto" varStatus="status">
										<option value="${dto.name }">${dto.name }</option>
									</core:forEach>
								</core:when>
							</core:choose>
					</select></td>
					<td>调入科室:</td>
					<td><select name="newDepartName" id="newDepartName" size="1"
						style="width:130px;height:23px"></select></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button"
						class="button" value="保存" id="save" /> &nbsp;<input type="button"
						class="button" value="返回" id="cancel" /></td>
				</tr>
			</table>
			<br />
		</form:form>
	</div>


</body>
</html>
