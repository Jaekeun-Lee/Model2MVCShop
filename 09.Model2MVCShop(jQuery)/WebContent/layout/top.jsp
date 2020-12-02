<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>Model2 MVC Shop</title>
	
	<link href="/css/left.css" rel="stylesheet" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		//==> jQuery ���� �߰��� �κ�
		 $(function() {
			 
			//==> login Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( "td[width='115']:contains('login')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td[width='115']:contains('login')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/login");
			});
			
			
			//==> login Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( "td[width='56']:contains('logout')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td[width='56']:contains('logout')" ).html() );
				$(window.parent.document.location).attr("href","/user/logout");
			}); 
		});	
		 
	</script>		
	
</head>

<body topmargin="0" leftmargin="0">
 
<table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td height="10"></td>
	<td height="10" >&nbsp;</td>
  </tr>
  <tr>
    <td width="800" height="30"><h2>Model2 MVC Shop</h2></td>
  </tr>
  <tr>
    <td height="20" align="right" background="/images/img_bg.gif">
	    <table width="200" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td width="115">
		          <c:if test="${ empty user }">
		              <!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
						<a href="/user/login" target="rightFrame">login</a>	
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
						login
		           </c:if>   
	          </td>
	          <td width="14">&nbsp;</td>
	          <td width="56">
		          <c:if test="${ ! empty user }">
		          		 <!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
		            	<a href="/logout.do" target="_parent">logout</a>
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
		            	logout
		           </c:if>
	          </td>
	        </tr>
	      </table>
      </td>
    <td height="20" background="/images/img_bg.gif">&nbsp;</td>
  </tr>
</table>

</body>

</html>