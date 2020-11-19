<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.user.vo.*" %>
<%@ page import="com.model2.mvc.common.*" %>

<%
	HashMap<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	SearchVO searchVO=(SearchVO)request.getAttribute("searchVO");
	
	int total=0;
	ArrayList<UserVO> list=null;
	if(map != null){
		total=((Integer)map.get("count")).intValue();
		list=(ArrayList<UserVO>)map.get("list");
	}
	
	int currentPage=searchVO.getPage();
	
	int totalPage=0;
	if(total > 0) {
		totalPage= total / searchVO.getPageUnit() ;
		if(total%searchVO.getPageUnit() >0)
	totalPage += 1;
	}
%>

<html>
<head>
<title>회원 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetUserList(){
	document.detailForm.submit();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listUser.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">회원 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<%
		if(searchVO.getSearchCondition() != null) {
	%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
		<%
				if(searchVO.getSearchCondition().equals("0")){
		%>
				<option value="0" selected>회원ID</option>
				<option value="1">회원명</option>
		<%
				}else {
		%>
				<option value="0">회원ID</option>
				<option value="1" selected>회원명</option>
		<%
				}
		%>
			</select>
			<input 	type="text" name="searchKeyword"  value="<%=searchVO.getSearchKeyword() %>" 
							class="ct_input_g" style="width:200px; height:19px" >
		</td>
	<%
		}else{
	%>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0">회원ID</option>
				<option value="1">회원명</option>
			</select>
			<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
		</td>
	<%
		}
	%>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList();">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체  <%= total%> 건수, 현재 <%=currentPage %> 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">이메일</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<% 	
		int no=list.size();
		for(int i=0; i<list.size(); i++) {
			UserVO vo = (UserVO)list.get(i);
	%>
	<tr class="ct_list_pop">
		<td align="center"><%=no--%></td>
		<td></td>
		<td align="left">
			<a href="/getUser.do?userId=<%=vo.getUserId() %>"><%= vo.getUserId() %></a>
		</td>
		<td></td>
		<td align="left"><%= vo.getUserName() %></td>
		<td></td>
		<td align="left"><%= vo.getEmail() %>
		</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<% } %>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		    <% 
		    
			int startPage = currentPage / 5 * 5+1;
		    if( currentPage % 5 == 0) startPage -= 5;
		    int endPage = startPage + 4;
		    int preGroup = startPage - 5;
		    int nextGroup = startPage + 5;
		    if(endPage>totalPage) endPage = totalPage;
		    %>
		    <% if(startPage > 1) { %>
		    	<% if(searchVO.getSearchCondition()==null && searchVO.getSearchKeyword()==null) {%>
		    			<a href="/listUser.do?page=<%=preGroup%>">이전</a>
		    		<% } else { %>
   						<a href="/listUser.do?searchKeyword=<%=request.getParameter("searchKeyword")%>&page=<%=preGroup%>&searchCondition=<%=request.getParameter("searchCondition")%>">이전</a>
  					<% } %>
   			<% } %>
   			
   			<% for(int i=startPage;i<=endPage;i++){ %>
				<% if(searchVO.getSearchCondition()==null && searchVO.getSearchKeyword()==null) {%>
	           		<a href="/listUser.do?page=<%=i%>"><%=i %></a>
	           	<% } else { %>
		           		<a href="/listUser.do?searchKeyword=<%=request.getParameter("searchKeyword")%>&page=<%=i%>&searchCondition=<%=request.getParameter("searchCondition")%>"><%=i %></a>
        		<% } %>
           	<% } %>
           	
           	<% if(!(endPage==totalPage)) { %>
           		<% if(searchVO.getSearchCondition()==null && searchVO.getSearchKeyword()==null) {%>
		    			<a href="/listUser.do?page=<%=nextGroup%>">다음</a>
	    		<% } else { %>
        				<a href="/listUser.do?searchKeyword=<%=request.getParameter("searchKeyword")%>&page=<%=nextGroup%>&searchCondition=<%=request.getParameter("searchCondition")%>">다음</a>
	         	<% } %>
			<% } %>
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>

</body>
</html>