<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<core:set var ="webcontext" scope="request" value="${pageContext.request.contextPath}"/>
<core:set var ="imagepath" scope="request" value="${webcontext}/images"/>
<core:set var ="csspath" scope="request" value="${webcontext}/styles"/>
<core:set var ="jspath" scope="request" value="${webcontext}/scripts/"/>
<core:set var ="jsppath" scope="request" value="${webcontext}/jsp"/>
<core:set var ="htmlpath" scope="request" value="${webcontext}/html"/>
