<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="header">
		<div class="title">
			<div class="container">
				<c:if test="${ user.role != 'admin' }">
					<div class="mainmenu">
						<ul>
							<li>
								<a href="#">
									<img class="menu" src="../images/icon/icon_notice.png"> 
								</a>
								<ul id="submenu">
									<li><a
										href="#">공지사항</a>
									</li>
									<li><a
										href="#">이벤트</a>
									</li>
									<li><a
										href="#">고객센터</a>
									</li>
								</ul>
							</li>
							
						</ul>
					</div>
				</c:if>
				
				<div class="mainmenu">
					<ul>
						<li>
							<a href="/home/" class="logo">
								<img class="logo" src="../images/logo.png"> 
							</a>
						</li>
					</ul>
				</div>
				
				<div id="tophead">
					<ul>
						<c:if test="${ empty user }">
							<li id="layer"><a href="/user/login">LOGIN</a></li>
						</c:if>
						<c:if test="${ ! empty user }">
							<li><a href="/user/logout">LOGOUT</a></li>
							<li>
								<p><a href="/user/getUser?userId=${user.userId}">${ user.userId }</a>님 환영합니다.</p>
								
							</li>
						
							<li>
								<a href="/purchase/listPurchase">
									<img class="cart" src="../images/icon/icon_top_cart.png"> 
								</a>
							</li>
						</c:if>
					</ul>
					
				</div>
				
				
				<c:if test="${ user.role == 'admin' }">
					<div class="navbar-header">
					    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					    </button>
					</div>
					
					<div class="collapse navbar-collapse" id="target" data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                        	<span>게시물 관리</span>
		                        	<span class="caret"></span>
				                </a>
				                <ul class="dropdown-menu">
				                	<li><a
										href="#">메인페이지</a>
									</li>
				                	<li><a
										href="#">공지사항</a>
									</li>
									<li><a
										href="#">이벤트</a>
									</li>
									<li><a
										href="#">고객센터</a>
									</li>
				                    <li class="divider"></li>
				                    	<li><a href="#">etc...</a>
			                    	</li>
								</ul>
							</li>
							<li class="dropdown">
								<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                        	<span>회원관리</span>
		                        	<span class="caret"></span>
				                </a>
				                <ul class="dropdown-menu">
				                	<li>
				                		<a href="/user/getUser?userId=${user.userId}">개인정보조회</a>
			                		</li>
				                         
		                        	<li><a href="#">회원정보조회</a></li>
				                         
				                    <li class="divider"></li>
				                    	<li><a href="#">etc...</a>
			                    	</li>
								</ul>
							</li>
				              
							<c:if test="${sessionScope.user.role == 'admin'}">
								<li class="dropdown">
									<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
										<span >판매상품관리</span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><a href="/product/addProduct">판매상품등록</a></li>
										<li><a href="/product/listProduct?menu=manage&currentPage=1">판매상품관리</a></li>
										<li class="divider"></li>
										<li><a href="#">etc..</a></li>
				                    </ul>
								</li>
							</c:if>
				                 
				            <!-- 구매관리 DrowDown -->
				            <li class="dropdown">
								<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
									<span >상품구매</span>
									<span class="caret"></span>
				                </a>
				                <ul class="dropdown-menu">
				                	<li>
				                		<a href="/product/listProduct?menu=search&currentPage=1">상 품 검 색</a>
			                		</li>
				                         
				                	<c:if test="${sessionScope.user.role == 'user'}">
				                    	<li><a href="#">구매이력조회</a></li>
			                    	</c:if>
				                         
				                    <li>
				                    	<a href="#">최근본상품</a>
			                    	</li>
				                        <li class="divider"></li>
				                    <li>
				                    	<a href="#">etc..</a>
			                    	</li>
								</ul>
			                </li>
						</ul>
				             
			            <ul class="nav navbar-nav navbar-right">
			            	<li><a href="/user/getUser?userId=${user.userId}">${ user.userId }</a></li>
			            </ul>
				             
					</div>
				</c:if>
			</div>
		</div>
	</div>
</header>
