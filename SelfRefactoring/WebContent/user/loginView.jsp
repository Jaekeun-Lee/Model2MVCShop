<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Login</title>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">

<!-- 웹 폰트 -->
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
			alert('ID 를 입력해주세요.');
			$("#userId").focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('비밀번호를 입력해주세요');
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
				<input type="text" class="input_box" id="userId" name="userId" placeholder="아이디" required>
				<input type="password" class="input_box" id="password" name="password" autocomplete="new-password" placeholder="비밀번호" required>
				<input type="submit" class="submit" value="로그인">
				
				<div class="find">
					<a href="#">아이디 찾기</a>
					<span class="space">|</span>
					<a href="/user/addUser">비밀번호 찾기</a>
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
				<p class="text01">아직도 회원이 아니신가요?</p>
				<p class="text02">회원가입을 하시면 회원에게만 제공되는 <br/>다양한 혜택과 이벤트에 참여하실 수 있어요.<br/>회원만의 다양한 혜택을 누려보세요!</p>
			</div>
			<div class="signup">
				<a href="/user/addUser">회원가입</a>
			</div>
			

			<!-- 하단 공통 로그인배너 
            <div class="login_banner"><a href="#"><img src="" alt=""/></a></div>
			<!-- //하단 공통 로그인배너 -->
		</div>
	</div>
	
	
</body>
</html>