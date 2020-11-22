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
			<td> ${ purchase.paymentOption eq '1' ? '현금구매' : '신용구매' }</td>
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

</body>
</html>