<%@ page language="java" contentType="text/html;"  pageEncoding="gb2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="java.net.*" import="sley.common.FileDownload"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<title>นคืสฤฃฐๅ</title>
<%
	FileDownload fd = new FileDownload();
	String docLoction=(String)request.getAttribute("docLoction");
	String fileName=(String)request.getAttribute("fileName");
	fd.download(response, docLoction, fileName);
		out.clear();
		out = pageContext.pushBody(); 
%>
</head>
<body>
<script type="text/javascript"></script>
</body>
</html>