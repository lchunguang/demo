<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%> 
<%@page import="sley.common.Pager"%>
<%@page import="sley.common.SmConstant"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	int pageSize = 10;
int currentPage = 1;
int totalPage = 0;
int totalSize = 0;

	Pager pager = (Pager)request.getAttribute(SmConstant.REQUEST_ATTRIBUTE_PAGER);
	if(pager != null){
		pageSize = pager.getPageSize();
		currentPage = pager.getCurrentPage();
		totalPage = pager.getTotalPages();
		totalSize = pager.getTotalSize();
	}
%>

<script LANGUAGE="JavaScript">
var pageSize = <%=pageSize%>;
var currentPage = <%=currentPage%>;
var totalPage = <%=totalPage%>;
var totalSize = <%=totalSize%>;

function toPage(pageNo){
	document.getElementById("currentPage").value=pageNo;		
	search();
}

function goToPage(){
	var page=document.getElementById("pageNumber").value;
	var re = /^[0-9]+$/;
	if(!re.test(page)||page==0)
		alert("请输入有效页码！");
	else if(currentPage==page)
		alert("已是当前页!");
	else if(page>totalPage)
		alert("请输入有效页码！");
	else
		toPage(page);
}
function gotoFirst(){
	if(currentPage == 1)
		alert("已经是第一页! ");
	else
		toPage(1);
}
function gotoLast(){
	if(currentPage == totalPage)
		alert("已经是最后一页!");
	else
		toPage(totalPage);
}
function gotoPre(){
	if(currentPage>1)
		toPage(currentPage-1);
	else
		alert("已经是第一页!");
}
function gotoNext(){
	if(currentPage<totalPage)
		toPage(currentPage-0+1);
	else
		alert("已经是最后一页!");

}
</script>
<table border='0px' class="tab2" style="width:100%">
  <tr>
  <td width="1%" >&nbsp;</td>
    <td width="10%" style="color:grey"><%=currentPage%>/<%=totalPage%></td>

    <td width="70%" align="right" >
	<table >
      <tr align="right">
        <td width="50" >
          <img style="cursor:hand" src="<%=contextPath%>/images/paging/arrow_01.gif" width="15" height="12" align="absmiddle" onclick="javascript:gotoFirst();return false;"/> 
         &nbsp; <img style="cursor:hand" src="<%=contextPath%>/images/paging/arrow_pre.gif" width="13" height="12" align="absmiddle" onclick="javascript:gotoPre();return false;"/>
        </td>
        <td width="3" >&nbsp;</td>
        <td width="50" >
          <img style="cursor:hand" src="<%=contextPath%>/images/paging/arrow_next.gif" width="13" height="12" align="absmiddle" onclick="javascript:gotoNext();return false;"/> 
          &nbsp;<img style="cursor:hand" src="<%=contextPath%>/images/paging/arrow_end.gif" width="15" height="12" align="absmiddle" onclick="javascript:gotoLast();return false;"/>
        </td>

        <td class="right"> 跳转至
          <input name="pageNumber" id="pageNumber" type="text" size="3"  style="height:20px;" class="page_input"/>
     	    页 <label><input type="button" style="cursor:hand;" value="跳转" onclick="javascript:goToPage();return false;"></label></td>
        <td width="2" >&nbsp;</td>
       
      </tr>
    </table>
	</td>
  </tr>
</table>

<input name="<%=SmConstant.REQUEST_ATTRIBUTE_PAGER%>.currentPage" id="currentPage" value="<%=currentPage%>"  type=hidden>
