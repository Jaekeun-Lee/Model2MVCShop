<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

	������ ���� ���Ű� �Ǿ����ϴ�.

	<table border=1>
		<tr>
			<td>��ǰ��ȣ</td>
			<td>${ purchase.purchaseProd.prodNo }</td>
			<td></td>
		</tr>
		<tr>
			<td>�����ھ��̵�</td>
			<td>${ purchase.buyer.userId }</td>
			<td></td>
		</tr>
		<tr>
			<td>���Ź��</td>
			<td> ${ purchase.paymentOption eq '1' ? '���ݱ���' : '�ſ뱸��' }</td>
			<td></td>
		</tr>
		<tr>
			<td>�������̸�</td>
			<td>${ purchase.buyer.userName }</td>
			<td></td>
		</tr>
		<tr>
			<td>�����ڿ���ó</td>
			<td>${ purchase.buyer.phone }</td>
			<td></td>
		</tr>
		<tr>
			<td>�������ּ�</td>
			<td>${ purchase.buyer.addr }</td>
			<td></td>
		</tr>
		<tr>
			<td>���ſ�û����</td>
			<td>${ purchase.divyRequest }</td>
			<td></td>
		</tr>
		<tr>
			<td>����������</td>
			<td>${ purchase.divyDate }</td>
			<td></td>
		</tr>
	</table>

</body>
</html>