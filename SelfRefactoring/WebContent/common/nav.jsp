<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="header">
		<div class="title">
			<div class="container">
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
								<c:if test="${user.role == 'admin'}">
									<li>
										<a href="/product/addProduct">상품 등록</a>
									</li>
									<li>
										<a href="/product/listProduct?menu=manage">상품 관리</a>
									</li>
								</c:if>
							</ul>
						</li>
						
					</ul>
				</div>
				
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
			</div>
		</div>
	</div>
</header>
