<%@ page contentType="text/html; charset=euc-kr"%>

<%@ page import="java.util.List"%>

<%@ page import="com.model2.mvc.service.domain.User"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<User> list = (List<User>) request.getAttribute("list");
	Page resultPage = (Page) request.getAttribute("resultPage");
	
	Search search = (Search) request.getAttribute("search");
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>

<html>
<head>
<title>회원 목록 조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetUserList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listUser.do" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">회원 목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="0"
								<%=(searchCondition.equals("0") ? "selected" : "")%>>회원ID</option>
							<option value="1"
								<%=(searchCondition.equals("1") ? "selected" : "")%>>회원명</option>
					</select> <input type="text" name="searchKeyword"
						value="<%=searchKeyword%>" class="ct_input_g"
						style="width: 200px; height: 20px"></td>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetUserList('1');">검색</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 <%=resultPage.getTotalCount()%> 건수, 현재
						<%=resultPage.getCurrentPage()%> 페이지
					</td>
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
					for (int i = 0; i < list.size(); i++) {
					User vo = list.get(i);
				%>
				<tr class="ct_list_pop">
					<td align="center"><%=i + 1%></td>
					<td></td>
					<td align="left"><a
						href="/getUser.do?userId=<%=vo.getUserId()%>"><%=vo.getUserId()%></a>
					</td>
					<td></td>
					<td align="left"><%=vo.getUserName()%></td>
					<td></td>
					<td align="left"><%=vo.getEmail()%></td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				<%
					}
				%>
			</table>

			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="" /> 
						<% if (resultPage.getBeginUnitPage()>1) { %>
						<a href="javascript:fncGetUserList('<%=resultPage.getBeginUnitPage() - resultPage.getPageUnit()%>')">◀이전</a> 
						<% } %> 
						
						<% for (int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) { %>
						<a href="javascript:fncGetUserList('<%=i%>');"><%=i%></a> 
						<% } %>

						<% if (resultPage.getEndUnitPage() != resultPage.getMaxPage()) { %>
						<a href="javascript:fncGetUserList('<%=resultPage.getBeginUnitPage() + resultPage.getPageUnit()%>');">이후 ▶
						<% } %>
					</td></tr>
			</table>
			<!-- PageNavigation End... -->

		</form>
	</div>

</body>
</html>