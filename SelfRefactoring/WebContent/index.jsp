<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="author" content="JaeKeun-Lee">

<!-- style -->

<!-- À¥ ÆùÆ® -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@700&display=swap" rel="stylesheet">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#click_btn p").on("click",function(){
			self.location="http://localhost:8080/home/";
		});
	});
</script>

<title>JK's Shop</title>

<style>

	body {padding:0; margin:0; overflow:hidden; background-color:#000; }
	
	#front {
		background-image : url("images/iuad.gif");
		background-repeat : no-repeat;
		background-size:cover;	
		width:100%;
		height:100%;
	}
	
	#front_box {
		background-color: rgba(0, 0, 0, 0.5);
		width:100%;
		height: 100%;
	}
	
	#front_txt {
		position:absolute;
		top:32%;
		right:55%;
		color:#fff;
		font-size: 30px;
		font-weight: bold;
		font-family: 'Josefin Sans', sans-serif;
	}
	
	#front_txt1 {
		position:absolute;
		top:30%;
		right:20%;
		color:#fff;
		font-size: 100px;
		font-weight: bold;
		font-family: 'Josefin Sans', sans-serif;
	}
	
	#click_btn {
		position:absolute;
		top:70%;
		right:40%;
		border: 3px #fff solid;
		color:#fff;
		width:350px;
		height:100px;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
	}

</style>

</head>
<body>
	<div id="front">
		<div id="front_box">
			<p id="front_txt">#011 JK'S SHOP REFACTORING</p>
			<p id="front_txt1">MVC SHOPPING MALL</p>
			<div id="click_btn">
				<p>ENTER</p>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>
