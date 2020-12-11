<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="author" content="JaeKeun-Lee">

<!-- style -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/lightgallery.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel"
	  rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap"
	  rel="stylesheet">

<title>JK's Shop</title>
</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<div id="nav">
		<jsp:include page="common/nav.jsp" />
	</div>
	<div id="followquick">
		<jsp:include page="history.jsp" />
	</div>
	<main>
		<section id="contents">
			<!-- 이미지 슬라이드 -->
			<div id="mainImg">
				<div class="slider">
	 				<div>
						<figure>
							<img src="../images/mainImage1.jpg" alt="이미지1">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/mainImage2.jpg" alt="이미지2">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/mainImage3.jpg" alt="이미지3">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/mainImage4.jpg" alt="이미지4">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/Maingif.gif" alt="이미지5">
						</figure>
					</div>	 
					<div>
						<figure>
							<img src="../images/mainImage3.jpg" alt="이미지6">
							<figcaption>
								<em>Main Image 6</em> <span>6.1 main image sub</span>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>
			<!--//이미지 슬라이드 -->
			
			<!-- 상품 리스트 -->
			<div class="container">
				<article class="column">
					<h2 class="col_tit">신상품</h2>
					<p class="col_desc"> Product List ${resultPage.totalCount} </p>
					
					<!-- lightbox -->
					<div class="lightbox square clearfix">
						<a href="img/light01_s.jpg">
							<img src="img/light01.jpg" alt="이미지"> 
							<em>blur</em> 
						</a> 
						
						<a href="img/light02_s.jpg">
							<img src="img/light02.jpg" alt="이미지"> 
							<em>brightness</em> 
						</a> 
						
						<a href="img/light03_s.jpg">
							<img src="img/light03.jpg" alt="이미지">
							<em>contrast</em> 
						</a> 
							
						<a href="img/light04_s.jpg">
							<img src="img/light04.jpg" alt="이미지"> 
							<em>grayscale</em> 
						</a> 
							
						<a href="img/light05_s.jpg">
							<img src="img/light05.jpg" alt="이미지">
							<em>hue-rotate</em> 
						</a> 
							
						<a href="img/light06_s.jpg">
							<img src="img/light06.jpg" alt="이미지"> 
							<em>invert</em> 
						</a>
					</div>
					<!--//lightbox -->
				</article>
				<!-- //col5 -->
			</div>
			
		</section>
		<!-- //contents -->
	</main>

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="footer">
					<ul>
						<li><a href="#">사이트 도움말</a></li>
						<li><a href="#">사이트 이용약관</a></li>
						<li><a href="#">사이트 운영원칙</a></li>
						<li><a href="#"> <strong>개인정보취급방침</strong>
						</a></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">게시중단요청서비스</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<address>
						Copyright &copy; <a href="https://github.com/Jaekeun-Lee"> <strong>JaeKeun-Lee</strong>
						</a> All Rights Reserved.
					</address>
				</div>
			</div>
		</div>
	</footer>
	<!-- //footer -->

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../javascript/modernizr-custom.js"></script>
	<script src="../javascript/slick.min.js"></script>
	<script src="../javascript/lightgallery.min.js"></script>
	<script src="../javascript/custom.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/a9d35991b2.js" crossorigin="anonymous"></script>
	<script>
	
		$(function(){
			$('#followquick').animate({'top':$(document).scrollTop()+200+'px'});
			//follow quick menu
			$(window).scroll(function(){
				$("#followquick").stop();
				$('#followquick').animate({'top':$(document).scrollTop()+200+'px'},1000);
			});
		})	
	
		
		//접기/펼치기
		$(window).resize(function() {
			var wWidth = $(window).width();
			if (wWidth > 600) {
				$(".nav").removeAttr("style");
			}
		});

		//라이트 박스
		$(".lightbox").lightGallery({
			thumbnail : true,
			autoplay : true,
			pause : 3000,
			progressBar : true
		});

		//이미지 슬라이더
		$(".slider").slick({
			dots : true,
			autoplay : true,
			autoplaySpeed : 3000,
			arrows : true,
			responsive : [ {
				breakpoint : 768,
				settings : {
					autoplay : false
				}
			} ]
		});
	</script>

</body>
</html>
