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

<!-- �� ��Ʈ -->
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
	<!-- ��� �׺���̼� �� -->
	<div id="nav">
		<jsp:include page="common/nav.jsp" />
	</div>
	<div id="followquick">
		<jsp:include page="history.jsp" />
	</div>
	<main>
		<section id="contents">
			<!-- �̹��� �����̵� -->
			<div id="mainImg">
				<div class="slider">
	 				<div>
						<figure>
							<img src="../images/mainImage1.jpg" alt="�̹���1">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/mainImage2.jpg" alt="�̹���2">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/mainImage3.jpg" alt="�̹���3">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/mainImage4.jpg" alt="�̹���4">
						</figure>
					</div>
					<div>
						<figure>
							<img src="../images/Maingif.gif" alt="�̹���5">
						</figure>
					</div>	 
					<div>
						<figure>
							<img src="../images/mainImage3.jpg" alt="�̹���6">
							<figcaption>
								<em>Main Image 6</em> <span>6.1 main image sub</span>
							</figcaption>
						</figure>
					</div>
				</div>
			</div>
			<!--//�̹��� �����̵� -->
			
			<!-- ��ǰ ����Ʈ -->
			<div class="container">
				<article class="column">
					<h2 class="col_tit">�Ż�ǰ</h2>
					<p class="col_desc"> Product List ${resultPage.totalCount} </p>
					
					<!-- lightbox -->
					<div class="lightbox square clearfix">
						<a href="img/light01_s.jpg">
							<img src="img/light01.jpg" alt="�̹���"> 
							<em>blur</em> 
						</a> 
						
						<a href="img/light02_s.jpg">
							<img src="img/light02.jpg" alt="�̹���"> 
							<em>brightness</em> 
						</a> 
						
						<a href="img/light03_s.jpg">
							<img src="img/light03.jpg" alt="�̹���">
							<em>contrast</em> 
						</a> 
							
						<a href="img/light04_s.jpg">
							<img src="img/light04.jpg" alt="�̹���"> 
							<em>grayscale</em> 
						</a> 
							
						<a href="img/light05_s.jpg">
							<img src="img/light05.jpg" alt="�̹���">
							<em>hue-rotate</em> 
						</a> 
							
						<a href="img/light06_s.jpg">
							<img src="img/light06.jpg" alt="�̹���"> 
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
						<li><a href="#">����Ʈ ����</a></li>
						<li><a href="#">����Ʈ �̿���</a></li>
						<li><a href="#">����Ʈ ���Ģ</a></li>
						<li><a href="#"> <strong>����������޹�ħ</strong>
						</a></li>
						<li><a href="#">å���� �Ѱ�� ��������</a></li>
						<li><a href="#">�Խ��ߴܿ�û����</a></li>
						<li><a href="#">������</a></li>
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
	
		
		//����/��ġ��
		$(window).resize(function() {
			var wWidth = $(window).width();
			if (wWidth > 600) {
				$(".nav").removeAttr("style");
			}
		});

		//����Ʈ �ڽ�
		$(".lightbox").lightGallery({
			thumbnail : true,
			autoplay : true,
			pause : 3000,
			progressBar : true
		});

		//�̹��� �����̴�
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
