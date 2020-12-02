<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>���̵� �ߺ� Ȯ��</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		/*=============jQuery ���� �ּ�ó�� =============
		 window.onload = function(){
			 document.getElementById("userId").focus();
			 document.getElementById("userId").onkeydown = function(){
				if(event.keyCode == '13')	fncCheckDuplication();
			}
		 } //========================================	*/
		$(function() {
			
			$("#userId").focus();
		
			//==> keydown Event ����
			//==> CallBackFunction  :  EventObject ���ڷ� ������ �ִ�.
			//==> ���ǽ� ������
			//==> - Event Object �� ���ڷ� ���� �� �ִ� �� Ȯ��.
			//==> - keyCode �� alert() Ȯ���ϴ� �� ���� ����
			$("#userId").on("keydown" , function(event) {
				
				alert("keyCode  : "+event.keyCode);
				
				if(event.keyCode == '13'){
					//fncCheckDuplication();
				}
			});
			
		});
		
		
		/*=============jQuery ���� �ּ�ó�� =============
		function fncCheckDuplication() {
			// Form ��ȿ�� ����
			if(document.detailForm.userId.value != null && document.detailForm.userId.value.length >0) {
				document.detailForm.action='/user/checkDuplication';
			    document.detailForm.submit();
			}else {
				alert('���̵�� �ݵ�� �Է��ϼž� �մϴ�.');
			}
			document.getElementById("userId").focus(); 
		}========================================	*/
		//==> "�ߺ�Ȯ��"  Event ó��
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.				
			$("td.ct_btn:contains('�ߺ�Ȯ��')").on("click" , function() {
				
				//==>Debug
				//alert($("td.ct_btn:contains('�ߺ�Ȯ��')").html())
				
				// Form ��ȿ�� ����
				if( $("#userId").val() != null && $("#userId").val().length >0) {
					$("form").attr("method" , "POST");
				    $("form").attr("action" , "/user/checkDuplication");
				    $("form").submit();
				}else {
					alert('���̵�� �ݵ�� �Է��ϼž� �մϴ�.');
				}
				$("#userId").focus();
			});
		});
		
		
		/*=============jQuery ���� �ּ�ó�� =============
		function fncUseId() {
			if(opener) {
				opener.document.detailForm.userId.value = "${userId}";
			}
			window.close();
		}========================================	*/
		//==>"���"  Event ó��
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			$("td.ct_btn01:contains('���')").on("click" , function() {
				
				//==>Debug
				//alert($("td.ct_btn01:contains('���')").html())
				
				if(opener) {
					opener.$("input[name='userId']").val("${userId}");
					opener.$("input[name='password']").focus();
				}
				
				window.close();
			});
		});
		
		
		//==> �߰��Ⱥκ� : "�ݱ�"  Event  ó��
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			$("td.ct_btn01:contains('�ݱ�')").on("click" , function() {
				//==>Debug
				//alert($("td.ct_btn01:contains('�ݱ�')").html())
				window.close();
			});
		});

	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
<form name="detailForm"  method="post">
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// --> 
<form>

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
									<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
									<a href="javascript:fncCheckDuplication();">�ߺ�Ȯ��</a>
									<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// --> 
									�ߺ�Ȯ��
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
							<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
							<a href="javascript:fncUseId();">���</a>
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							���
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
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="javascript:window.close();">�ݱ�</a>
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
						�ݱ�
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