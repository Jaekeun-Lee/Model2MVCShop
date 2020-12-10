<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Login</title>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">

<!-- �� ��Ʈ -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap"
	  rel="stylesheet">
	  
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#userId").focus()
		
		$("input.submit").on("click",function(){
			fncLogin();
		});
		
	});
	

	function fncLogin() {
		var id=$("#userId").val();
		var pw=$("#password").val();
		if(id == null || id.length <1) {
			alert('ID �� �Է����ּ���.');
			$("#userId").focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('��й�ȣ�� �Է����ּ���');
			$("#password").focus();
			return;
		}
	    $("#login").submit();
	}
	
</script>

</head>

<body>

	<div id="nav">
		<jsp:include page="../common/nav.jsp" />
	</div>

	<div class="layer">
		<div id="login_box">
			<h3 class="l_title">LOGIN</h3>
			<form id="login" name="loginForm" action="/user/login" method="post">
				<input type="text" class="input_box" id="userId" name="userId" placeholder="���̵�" required>
				<input type="password" class="input_box" id="password" name="password" autocomplete="new-password" placeholder="��й�ȣ" required>
				<input type="submit" class="submit" value="�α���">
				
				<div class="find">
					<a href="#">���̵� ã��</a>
					<span class="space">|</span>
					<a href="/user/addUser">��й�ȣ ã��</a>
				</div>
			</form>
            <!-- <c:if test="${not empty ERRORMSG }">
				<font color="red">
					<p>Your login attempt was not successful due to <br/>
					${ERRORMSG}</p>
				</font>
			</c:if>	 -->
		</div>
		
		<div class="signUp_box">
			<h3 class="l_title">Join</h3>
			<div class="text_wrap">
				<p class="text01">������ ȸ���� �ƴϽŰ���?</p>
				<p class="text02">ȸ�������� �Ͻø� ȸ�����Ը� �����Ǵ� <br/>�پ��� ���ð� �̺�Ʈ�� �����Ͻ� �� �־��.<br/>ȸ������ �پ��� ������ ����������!</p>
			</div>
			<div class="signup">
				<a href="/user/addUser">ȸ������</a>
			</div>
			

			<!-- �ϴ� ���� �α��ι�� 
            <div class="login_banner"><a href="#"><img src="" alt=""/></a></div>
			<!-- //�ϴ� ���� �α��ι�� -->
		</div>
	</div>
	
	
</body>
</html>