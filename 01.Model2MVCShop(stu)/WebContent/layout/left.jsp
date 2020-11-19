<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="com.model2.mvc.service.user.vo.*" %>

<%
	UserVO vo=(UserVO)session.getAttribute("user");

	String role="";

	if(vo != null) {
		role=vo.getRole();
	}
%>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function history(){
	popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		<%
			if(vo != null){
		%>
		<tr>
		<td class="Depth03">
			<a href="/getUser.do?userId=<%=vo.getUserId() %>" target="rightFrame">개인정보조회</a>
		</td>
		</tr>
		<%
			}
		%>
		<%
			if(role.equals("admin")){
		%>
		<tr>
		<td class="Depth03" >
			<a href="/listUser.do" target="rightFrame">회원정보조회</a>
		</td>
		</tr>
		<%
			}
		%>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>

	<%
		if(role.equals("admin")){
	%>
<!--menu 02 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<a href="../product/addProductView.jsp;" target="rightFrame">판매상품등록</a>
			</td>
		</tr>
		<td class="Depth03">
				<a href="/listProduct.do?menu=manage" target="rightFrame">판매상품관리</a>
			</td>
		</tr>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>
	<%
				}
	%>

<!--menu 03 line-->
<tr>
<td valign="top">
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<a href="/listProduct.do?menu=search" target="rightFrame">상 품 검 색</a>
			</td>
		</tr>
		<%
			if(vo != null){
				if(role.equals("user")){
		%>
		<tr>
			<td class="Depth03">
				<a href="/listPurchase.do" target="rightFrame">구매이력조회</a>
			</td>
		</tr>
		<%
				}
			}
		%>
		<tr>
		<td class="DepthEnd">&nbsp;</td>
		</tr>
		<tr>
			<td class="Depth03">
				<a href="javascript:history()">최근 본 상품</a>
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
</body>
</html>