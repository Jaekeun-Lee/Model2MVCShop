<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
<link rel="stylesheet" href="/css/style.css">

<!-- À¥ ÆùÆ® -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap"
	  rel="stylesheet">
	  
</head>

<body>
<p>===========</p>
<p>||&nbsp;&nbsp;&nbsp;&nbsp;HISTORY&nbsp;&nbsp;&nbsp;&nbsp;||</p>
<p>===========</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
<p>@@@@@@@@</p>
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
<a href="/getProduct.do?prodNo=<%=h[i]%>&menu=search"><%=h[i]%></a>
<br>
<%
				}
			}
		}
	}
%>
</body>
</html>