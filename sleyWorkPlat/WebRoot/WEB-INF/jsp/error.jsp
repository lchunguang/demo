<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Common Error Page</title>
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
</head>
<body>
<div class="spliter h_10"></div>
<div class="spliter h_10"></div>
<div class="error_div">
<div class="title">
<div class="exception_error"><spring:message code="error.title"
	text="系统内部错误" /></div>
</div>
<div class="error_header">
<table cellpadding="0" cellspacing="0" class="error_tab">
	<tr>
		<td valign="top" class="error_exception">
		<div class="exception_error_message">
		<p>错误原因:
		${errorTip}
		</p>
		</div>
		</td>
	</tr>
</table>
<div class="spliter h_5"></div>
</div>
</div>
</body>
</html>