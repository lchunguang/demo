<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left page</title>
<link href="${csspath}/left.css" type="text/css" rel="stylesheet" />
<script src="${jspath}/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${jspath}/leftTree.js" type="text/javascript"></script>
</head>

<body>
	<div class="leftTreeTop"></div>
	<div class="h5"></div>
	<div id="tree" class="tree" name="tree">
		<div class="title"><p class="min">AA </p></div>
		<div>
			<ul class="ulcss">
			
			<li><a href="#" target="mainFrame">dddd</a>
			</li>
		
			</ul>
		</div>
		<div class="h_10"></div>		
	</div>
	
</body>
</html>
