<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

	다음과 같이 구매가 되었습니다.

	<table border=1>
		<tr>
			<td>물품번호</td>
			<td>${ purchase.purchaseProd.prodNo }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자아이디</td>
			<td>${ purchase.buyer.userId }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매방법</td>
			<td>${ purchase.paymentOption eq '1' ? '현금구매' : '신용구매' }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자이름</td>
			<td>${ purchase.buyer.userName }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자연락처</td>
			<td>${ purchase.buyer.phone }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매자주소</td>
			<td>${ purchase.buyer.addr }</td>
			<td></td>
		</tr>
		<tr>
			<td>구매요청사항</td>
			<td>${ purchase.divyRequest }</td>
			<td></td>
		</tr>
		<tr>
			<td>배송희망일자</td>
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
				href="/purchase/listPurchase">확인</a></td>
			<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
				width="14" height="23" /></td>
			<td width="30"></td>
			<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
				width="17" height="23" /></td>
			<td background="/images/ct_btnbg02.gif" class="ct_btn01"
				style="padding-top: 3px;"><a href="javascript:history.go(-1)">취소</a></td>
			<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
				width="14" height="23" /></td>
		</tr>
	</table>

</body>
</html>