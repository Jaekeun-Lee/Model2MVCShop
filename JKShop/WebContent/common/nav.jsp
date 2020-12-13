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
										href="#">��������</a>
									</li>
									<li><a
										href="#">�̺�Ʈ</a>
									</li>
									<li><a
										href="#">������</a>
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
								<p><a href="/user/getUser?userId=${user.userId}">${ user.userId }</a>�� ȯ���մϴ�.</p>
								
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
		                        	<span>�Խù� ����</span>
		                        	<span class="caret"></span>
				                </a>
				                <ul class="dropdown-menu">
				                	<li><a
										href="#">����������</a>
									</li>
				                	<li><a
										href="#">��������</a>
									</li>
									<li><a
										href="#">�̺�Ʈ</a>
									</li>
									<li><a
										href="#">������</a>
									</li>
				                    <li class="divider"></li>
				                    	<li><a href="#">etc...</a>
			                    	</li>
								</ul>
							</li>
							<li class="dropdown">
								<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                        	<span>ȸ������</span>
		                        	<span class="caret"></span>
				                </a>
				                <ul class="dropdown-menu">
				                	<li>
				                		<a href="/user/getUser?userId=${user.userId}">����������ȸ</a>
			                		</li>
				                         
		                        	<li><a href="#">ȸ��������ȸ</a></li>
				                         
				                    <li class="divider"></li>
				                    	<li><a href="#">etc...</a>
			                    	</li>
								</ul>
							</li>
				              
							<c:if test="${sessionScope.user.role == 'admin'}">
								<li class="dropdown">
									<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
										<span >�ǸŻ�ǰ����</span>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><a href="/product/addProduct">�ǸŻ�ǰ���</a></li>
										<li><a href="/product/listProduct?menu=manage&currentPage=1">�ǸŻ�ǰ����</a></li>
										<li class="divider"></li>
										<li><a href="#">etc..</a></li>
				                    </ul>
								</li>
							</c:if>
				                 
				            <!-- ���Ű��� DrowDown -->
				            <li class="dropdown">
								<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
									<span >��ǰ����</span>
									<span class="caret"></span>
				                </a>
				                <ul class="dropdown-menu">
				                	<li>
				                		<a href="/product/listProduct?menu=search&currentPage=1">�� ǰ �� ��</a>
			                		</li>
				                         
				                	<c:if test="${sessionScope.user.role == 'user'}">
				                    	<li><a href="#">�����̷���ȸ</a></li>
			                    	</c:if>
				                         
				                    <li>
				                    	<a href="#">�ֱٺ���ǰ</a>
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
