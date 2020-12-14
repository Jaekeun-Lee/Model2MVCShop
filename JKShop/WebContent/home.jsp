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
				
					<c:forEach var="imageList" items="${mainImageList}">
						<div>
							<figure>
								<img src="../images/${imageList.fileName}"/>
							</figure>
						</div>
					</c:forEach>
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
						<c:set var="i" value="0" />
						<c:forEach var="product" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<a class="pic" id="${ product.prodNo }" href="/product/getProduct?prodNo=${ product.prodNo }&menu=search">
								<img src="/images/uploadFiles/${product.fileName}"/>
								<em>${product.prodName}</em> 
							</a>
						</c:forEach>
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
			
			$(".pic").on("click", function() {
				var prodNo = $(this).attr('id')
				self.location='http://localhost:8080/product/getProduct?prodNo='+prodNo+'&menu=search'
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
