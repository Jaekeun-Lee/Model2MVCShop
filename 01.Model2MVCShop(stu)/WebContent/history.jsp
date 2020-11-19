<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*" %>
<html>
<head>

<title>열어본 상품 보기</title>

</head>
<body>
	최근 본 상품 목록
<br>
<br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("history")) {
				history = cookie.getValue();
			}
		}
		if (history != null) {
			String[] h = history.split(",");
			
			for (int i = 0; i < h.length; i++) {
				if (!h[i].equals("null")) {
					%>
					<a href="/getProduct.do?prodNo=<%=Integer.parseInt(h[i])%>&menu=search"	target="rightFrame"><%=h[i]%></a>
					<br>
					<%
				} else {
					break;
				}
			}
			
		}
	}
%>

</body>
</html>