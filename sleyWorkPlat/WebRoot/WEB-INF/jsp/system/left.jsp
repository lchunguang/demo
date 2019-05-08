<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>left page</title>
<link href="${csspath}/left.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${csspath}/public.css" />
<script src="${jspath}/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="${jspath}/leftTree.js" type="text/javascript"></script>
<script type="text/javascript">
	function change_bg(obj) {
		var a = $(".current");
		$(a).removeClass("current");
		$(obj).addClass("current");
	}

	function closeOtherMenu(o) {
		if (o.className == "min") {
			$(o).removeClass("min").addClass("max").parent().next("div")
					.slideUp("fast");
			return false;
		}
		$(".min").removeClass("min").addClass("max").parent().next("div")
				.slideUp("fast");
		$(o).removeClass("max").addClass("min").parent().next("div").slideDown(
				"fast");
	}
</script>
<style>
.ulcss .current {
	color: #FF0000;
}
</style>

</head>
<body>
	<div class="h5"></div>
	<div id="tree" class="tree" name="tree">
		<core:forEach items="${rightList}" var="item">
			<div class="title">
				<p class="max" onclick="closeOtherMenu(this)">
					<core:out value="${item.rightName}" />
				</p>
			</div>
			<core:if test="${item.subRightList != null}">
				<div class="link"  style="display:none">
					<ul class="ulcss">
						<core:forEach items="${item.subRightList}" var="subItem">
							<core:if test="${empty subItem.subRightList}">
								<li><a href="${webcontext}${subItem.url}"
									target="mainFrame" onclick="change_bg(this)">${subItem.rightName}</a>
								</li>
							</core:if>
							<core:if test="${not empty subItem.subRightList}">
								<li><a href="javascript:void(0)">${subItem.rightName}</a>
									<ul>
										<core:forEach items="${subItem.subRightList}" var="nodeItem">
											<li><a href="${webcontext}${nodeItem.url}"
												target="mainFrame" onclick="change_bg(this)">${nodeItem.rightName}</a></li>
										</core:forEach>
									</ul></li>
							</core:if>
						</core:forEach>
					</ul>
				</div>
			</core:if>
			<div class="h_10"></div>
		</core:forEach>
	</div>


</body>
</html>
