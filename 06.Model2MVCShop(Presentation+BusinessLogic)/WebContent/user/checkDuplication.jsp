<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���̵� �ߺ� Ȯ��</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

window.onload = function(){
	document.getElementById("userId").focus();
	document.getElementById("userId").onkeydown = function(){
		if(event.keyCode == '13') {
			fncCheckDuplication();
		}
	}
}

function fncCheckDuplication() {
	// Form ��ȿ�� ����
	if(document.detailForm.userId.value != null && document.detailForm.userId.value.length >0) {
	    document.detailForm.action='/checkDuplication.do';
	    document.detailForm.submit();
	}else {
		alert('���̵�� �ݵ�� �Է��ϼž� �մϴ�.');
	}
	document.getElementById("userId").focus(); 
}

function fncUseId() {
	if(opener) {
		opener.document.detailForm.userId.value = "${userId}";
	}
	window.close();
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm"  method="post">

<!-- Ÿ��Ʋ ���� -->
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ID�ߺ�Ȯ��</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>
<!-- Ÿ��Ʋ �� -->

<!-- �˻���� ���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="32" style="padding-left:12px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:3px;">
				<tr>
					<td width="8" style="padding-bottom:3px;"><img src="/images/ct_bot_ttl01.gif" width="4" height="7"></td>
					<td class="ct_ttl02">
						<c:if test="${ ! empty result }">
							${userId} �� ���
							${ result ? "" : "��" }���� �մϴ�.
						</c:if>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td background="/images/ct_line_ttl.gif" height="1"></td>
	</tr>
	
</table>
<!-- �˻���� �� -->

<!-- ��� ���̺���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">���̵� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!-- ���̺� ���� -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input type="text" name="userId" id="userId" 
									value="${ ! empty result && result ? userId : '' }" 
									class="ct_input_g" style="width:100px; height:19px"  maxLength="20" >		
					</td>
					
					<td>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="4" height="21">
									<img src="/images/ct_btng01.gif" width="4" height="21">
								</td>
								<td align="center" background="/images/ct_btng02.gif" class="ct_btn" style="padding-top:3px;">
									<a href="javascript:fncCheckDuplication();">�ߺ�Ȯ��</a>
								</td>
								<td width="4" height="21">
									<img src="/images/ct_btng03.gif" width="4" height="21"/>
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
			</table>
			<!-- ���̺� �� -->
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
</table>
<!-- ������̺� �� -->

<!-- ��ư ���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<c:if test="${ ! empty result && result }">
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/> 
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							<a href="javascript:fncUseId();">���</a>
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
					</c:if>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:window.close();">�ݱ�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- ��ư �� -->
</form>

</body>
</html>