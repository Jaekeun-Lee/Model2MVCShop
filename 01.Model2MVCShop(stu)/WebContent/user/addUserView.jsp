<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>ȸ������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
<!--
function fncAddUser() {
	// Form ��ȿ�� ����
	var id=document.detailForm.userId.value;
	var pw=document.detailForm.password.value;
	var pw_confirm=document.detailForm.password2.value;
	var name=document.detailForm.userName.value;
	
	if(id == null || id.length <1){
		alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(pw == null || pw.length <1){
		alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(pw_confirm == null || pw_confirm.length <1){
		alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(name == null || name.length <1){
		alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	if(document.detailForm.password.value != document.detailForm.password2.value) {
		alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
		document.detailForm.password2.focus();
		return;
	}
		
	if(document.detailForm.phone2.value != "" && document.detailForm.phone2.value != "") {
		document.detailForm.phone.value = document.detailForm.phone1.value + "-" + document.detailForm.phone2.value + "-" + document.detailForm.phone3.value;
	} else {
		document.detailForm.phone.value = "";
	}
		
	document.detailForm.action='/addUser.do';
	document.detailForm.submit();
}

function check_email(frm) {
	alert
	var email=document.detailForm.email.value;
    if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
    	alert("�̸��� ������ �ƴմϴ�.");
		return false;
    }
    return true;
}

function checkSsn() {
	var ssn1, ssn2; 
	var nByear, nTyear; 
	var today; 

	ssn = document.detailForm.ssn.value;
	// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
	if(!PortalJuminCheck(ssn)) {
		alert("�߸��� �ֹι�ȣ�Դϴ�.");
		return false;
	}
}

function PortalJuminCheck(fieldValue){
    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
	var num = fieldValue;
    if (!pattern.test(num)) return false; 
    num = RegExp.$1 + RegExp.$2;

	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (var i=0; i<12; i++) {
		if (isNaN(num.substring(i,i+1))) return false;
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return ((11 - mod) % 10 == last) ? true : false;
}

function fncCheckDuplication() {
	popWin = window.open("/user/checkDuplication.jsp","popWin", "left=300,top=200,width=300,height=200,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
}

function resetData() {
	document.detailForm.reset();
}
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm"  method="post" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			���̵� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input type="text" name="userId" class="ct_input_bg" style="width:100px; height:19px"  maxLength="20" >
					</td>
					<td>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="4" height="21">
									<img src="/images/ct_btng01.gif" width="4" height="21"/>
								</td>
								<td 	align="center" background="/images/ct_btng02.gif" class="ct_btn" 
										style="padding-top:3px;">
									<a href="javascript:fncCheckDuplication();" id="btnCmfID">ID�ߺ�Ȯ��</a>
								</td>
								<td width="4" height="21">
									<img src="/images/ct_btng03.gif" width="4" height="21">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			��й�ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="password" name="password" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="10" minLength="6"  />
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			��й�ȣ Ȯ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="password" name="password2" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="10" minLength="6"  />
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			�̸�<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="userName" class="ct_input_g" 
							style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�ֹι�ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="ssn" class="ct_input_g" 
							style="width:100px; height:19px" onChange="javascript:checkSsn();"  maxLength="13" >
			-����, 13�ڸ� �Է�
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="addr" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100"/>
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�޴���ȭ��ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="phone1" class="ct_input_g" style="width:50px" 
							onChange="document.detailForm.phone2.focus();">
				<option value="010" >010</option>
				<option value="011" >011</option>
				<option value="016" >016</option>
				<option value="018" >018</option>
				<option value="019" >019</option>
			</select>
			<input type="text" name="phone2" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="9" />
			- 
			<input type="text" name="phone3" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="9" />
			<input type="hidden" name="phone" class="ct_input_g"  >
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�̸��� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input 	type="text" name="email" class="ct_input_g" 
										style="width:100px; height:19px" onChange="check_email(this.form);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncAddUser();">����</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:resetData();">���</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form>

<script type="text/javascript">
document.getElementById("btnCmfID").focus();
</script>

</body>
</html>
