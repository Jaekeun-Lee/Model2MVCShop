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
			<td>${ purchase.paymentOption eq '1' ? '���ݱ���' : '�ſ뱸��' }</td>
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

	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
				width="17" height="23" /></td>
			<td background="/images/ct_btnbg02.gif" class="ct_btn01"
				style="padding-top: 3px;"><a
				href="/purchase/listPurchase">Ȯ��</a></td>
			<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
				width="14" height="23" /></td>
			<td width="30"></td>
			<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
				width="17" height="23" /></td>
			<td background="/images/ct_btnbg02.gif" class="ct_btn01"
				style="padding-top: 3px;"><a href="javascript:history.go(-1)">���</a></td>
			<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
				width="14" height="23" /></td>
		</tr>
	</table>

</body>
</html>