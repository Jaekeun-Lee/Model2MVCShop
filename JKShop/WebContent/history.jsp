<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<html>

<body>
<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-body">
    <h4 class="card-title">Quick Menu</h4>
    <p class="card-text">--</p>
    <p class="card-text">qucik menu</p>
    <p class="card-text">qucik menu</p>
    <p class="card-text">qucik menu</p>
    <p class="card-text">qucik menu</p>
    <p class="card-text">qucik menu</p>
  </div>
</div>
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
<a href="/getProduct.do?prodNo=<%=h[i]%>&menu=search"
	target="rightFrame"><%=h[i]%></a>
<br>

<%
				}
			}
		}
	}
%>

</body>
</html>