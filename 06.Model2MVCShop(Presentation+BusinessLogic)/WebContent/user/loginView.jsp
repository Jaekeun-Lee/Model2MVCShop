<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>�α��� ȭ��</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

	function fncLogin() {
		var id=document.loginForm.userId.value;
		var pw=document.loginForm.password.value;
		if(id == null || id.length <1) {
			alert('ID �� �Է����� �����̽��ϴ�.');
			document.loginForm.userId.focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('�н����带 �Է����� �����̽��ϴ�.');
			document.loginForm.password.focus();
			return;
		}
	    document.loginForm.submit();
	}
	
	//Call Back Method �̿� onload �� Event ó��
	window.onload = function(){
		document.getElementById("userId").focus();
	}

</script>

</head>

<body bgcolor="#ffffff" text="#000000" >

<form name="loginForm"  method="post" action="/login.do" target="_parent">

<div align="center">

<TABLE WITH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD ALIGN="CENTER" VALIGN="MIDDLE">

<table width="650" height="390" border="5" cellpadding="0" cellspacing="0" bordercolor="#D6CDB7">
  <tr> 
    <td width="10" height="5" align="left" valign="top" bordercolor="#D6CDB7">
    	<table width="650" height="390" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="305">
            <img src="/images/logo-spring.png" width="305" height="390"/>
          </td>
          <td width="345" align="left" valign="top" background="/images/login02.gif">
          	<table width="100%" height="220" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30" height="100">&nbsp;</td>
                <td width="100" height="100">&nbsp;</td>
                <td height="100">&nbsp;</td>
                <td width="20" height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="50">&nbsp;</td>
                <td width="100" height="50">
                	<img src="/images/text_login.gif" width="91" height="32"/>
                </td>
                <td height="50">&nbsp;</td>
                <td width="20" height="50">&nbsp;</td>
              </tr>
              <tr> 
                <td width="200" height="50" colspan="4"></td>
              </tr>              
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_id.gif" width="100" height="30"/>
                </td>
                <td height="30">
                  <input 	type="text" name="userId"  class="ct_input_g" 
                  				style="width:180px; height:19px"  maxLength='50'/>          
          		</td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30">
                	<img src="/images/text_pas.gif" width="100" height="30"/>
                </td>
                <td height="30">                    
                    <input 	type="password" name="password" class="ct_input_g" 
                    				style="width:180px; height:19px"  maxLength="50" />
                </td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="20">&nbsp;</td>
                <td width="100" height="20">&nbsp;</td>
                <td height="20" align="center">
   				    <table width="136" height="20" border="0" cellpadding="0" cellspacing="0">
                       <tr> 
                         <td width="56">
                         	<a href="javascript:fncLogin();">
                         		<img src="/images/btn_login.gif" width="56" height="20" border="0"/>
                         	</a>
                         </td>
                         <td width="10">&nbsp;</td>
                         <td width="70">
                         	<a href="addUserView.jsp;">
                         		<img src="/images/btn_add.gif" width="70" height="20" border="0">
                         	</a>
                         </td>
                       </tr>
                     </table>
                 </td>
                 <td width="20" height="20">&nbsp;</td>
                </tr>
              </table>
            </td>
      	</tr>                            
      </table>
      </td>
  </tr>
</table>
</TD>
</TR>
</TABLE>

</div>

</form>

</body>
</html>