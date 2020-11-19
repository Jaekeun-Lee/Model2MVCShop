<%@ page contentType="text/html; charset=euc_kr" %>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="/javascript/CommonScript.js">
</script>

<script type="text/javascript">
<!--
function fncCreate() {
	if(FormValidation(document.detailForm) != false) {   
	    document.detailForm.action="/clientValidationCheck.jsp";
		document.detailForm.submit();
	}
}
//-->
</script>


</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm"  method="post">

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">fieldTitle</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="if you delete current value, then it shows messages for mandatory input item" required fieldTitle="fieldTitle">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of required fieldTitle="field name". If you don't define fieldTitle, then it shows 'undefined' in message box as item name</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">required</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="if you delete current value, then it shows messages for mandatory input item " required fieldTitle="required">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of required fieldTitle="required"</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">filter</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!-- begin of table -->
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="TEST" fieldTitle="filter" filter="TEST|TTT">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="filter" filter="TEST|TTTT". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">maxLength</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="12345abcde." fieldTitle="maxLength" maxLength="10">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="maxLength" maxLength="10". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">minLength</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!-- begin of table -->
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="abcd" fieldTitle="minLength" minLength="10">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="minLength" minLength="10". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">num - i</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="a" fieldTitle="num - i" num="i">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="num - i" num="i". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">num - n.m a part of a positive number+decimal places</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="1234567890.123" fieldTitle="num - n.m" num="9.2">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="num - n.m" num="9.2". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">fromNum</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="-1" fieldTitle="fromNum" num="i" fromNum="0">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="fromNum" num="i" fromNum="0". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">toNum</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="101" fieldTitle="toNum" num="i" toNum="100">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="toNum" num="i" fromNum="100". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">format</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="ab-1234" fieldTitle="format" format="ss-999">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="format" format="ss-999". Please check changes while you change input value. (s: character, 9: number)</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">char</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="ÇÑ±Û123abc" fieldTitle="char" char="skn">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="char" char="skn". Please check changes while you change input value. (<b>negative</b> checked! s: special character, k: Korean Alphabet, e: English, n:Number)</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">valCheck - MAIL</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="tester.sds#samsung.com" fieldTitle="valCheck - MAIL" valCheck="MAIL">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="valCheck - MAIL" valCheck="MAIL". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">valCheck - PHONE</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="123-456$" fieldTitle="valCheck - PHONE" valCheck="PHONE">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="valCheck - PHONE" valCheck="PHONE". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">valCheck - DATE</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" value="20061232" fieldTitle="valCheck - DATE" valCheck="DATE">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="valCheck - DATE" valCheck="DATE". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">valCheck - JUMIN</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input type="text" name="Input3" class="ct_input_g" style="width:370px; height:19px" fieldTitle="valCheck - JUMIN" valCheck="JUMIN" maxLength="13" format="9999999999999">
					</td>
				</tr>
				<tr>
					<td height="22" colspan="3">
						<font color="969696">in case of fieldTitle="valCheck - JUMIN" valCheck="JUMIN" maxLength="13" format="9999999999999". Please check changes while you change input value.</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%">

		</td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;"><a href="javascript:fncCreate()">validation Check!</a></td>
					<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
					<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;"><a href="javascript:history.go(-1);">Previous</a></td>
					<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form>

</body>
</html>
