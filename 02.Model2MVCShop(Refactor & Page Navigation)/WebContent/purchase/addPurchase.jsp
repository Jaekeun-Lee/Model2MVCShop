<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ page import="com.model2.mvc.service.domain.Purchase" %>
<%
	Purchase vo = (Purchase)request.getAttribute("purchase");
%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

	������ ���� ���Ű� �Ǿ����ϴ�.

	<table border=1>
		<tr>
			<td>��ǰ��ȣ</td>
			<td><%=vo.getPurchaseProd().getProdNo()%></td>
			<td></td>
		</tr>
		<tr>
			<td>�����ھ��̵�</td>
			<td><%=vo.getBuyer().getUserId()%></td>
			<td></td>
		</tr>
		<tr>
			<td>���Ź��</td>
			<td>
			
				<%  if (Integer.parseInt(vo.getPaymentOption()) == 1) { %> 
						���ݱ��� 
				<%	} else { %>

					�ſ뱸�� 
				<% } %>

			</td>
			<td></td>
		</tr>
		<tr>
			<td>�������̸�</td>
			<td><%=vo.getBuyer().getUserName()%></td>
			<td></td>
		</tr>
		<tr>
			<td>�����ڿ���ó</td>
			<td><%=vo.getBuyer().getPhone()%></td>
			<td></td>
		</tr>
		<tr>
			<td>�������ּ�</td>
			<td><%=vo.getBuyer().getAddr()%></td>
			<td></td>
		</tr>
		<tr>
			<td>���ſ�û����</td>
			<td><%=vo.getDivyRequest()%></td>
			<td></td>
		</tr>
		<tr>
			<td>����������</td>
			<td><%=vo.getDivyDate()%></td>
			<td></td>
		</tr>
	</table>

</body>
</html>