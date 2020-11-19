<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"%>

<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="com.model2.mvc.service.domain.User"%>
<%@ page import="com.model2.mvc.service.domain.Product"%>


<%
	List<Product> list = (List<Product>) request.getAttribute("list");
	Page resultPage = (Page) request.getAttribute("resultPage");
	Search search = (Search) request.getAttribute("search");
	String authorization = (String) session.getAttribute("menuType");
	
	
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

%>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncSearchConditionCheck() {
		var searchCondition = document.detailForm.searchCondition.value;
		var searchKeyword = document.detailForm.searchKeyword.value;

		if (searchKeyword == null) {
			alert("검색어를 입력해주세요");
		} else {
			if (searchCondition == 0 && isNaN(Number(searchKeyword)) == true) {
				alert("검색하실 상품의 상품 번호로 입력해주세요.");
			} else if (searchCondition == 2
					&& isNaN(Number(searchKeyword)) == true) {
				alert("검색하실 상품의 가격을 입력해주세요.");
			} else {
				document.detailForm.submit();
			}
		}

	}
	
	function fncGetProductList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listProduct.do" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">
									<%= authorization.equals("manage") ? "상품관리": "상품검색" %> 
								</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right">
						<select name="searchCondition"
							class="ct_input_g" style="width: 80px">
								<option value="0" <%= searchCondition.equals("0") ? "selected" : "" %>>상품번호</option>
								<option value="1" <%= searchCondition.equals("1") ? "selected" : "" %>>상품명</option>
								<option value="2" <%= searchCondition.equals("2") ? "selected" : "" %>>상품가격</option>
						</select> 
					<input type="text" name="searchKeyword" value="<%=searchKeyword%>" class="ct_input_g" style="width: 200px; height: 19px"  /></td>
					
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									<a href="javascript:fncSearchConditionCheck();">검색</a>
								</td>
								<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 <%=resultPage.getTotalCount()%> 건수, 현재 <%=resultPage.getCurrentPage()%> 페이지
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				
				<% int no = list.size(); %>
				<% for (Product vo:list) { %>
				
				<tr class="ct_list_pop">
					<td align="center"><%=no--%></td>
					<td></td>
					<td align="left">
						<a href="/<%=(authorization.equals("manage"))? "updateProductView" :"getProduct" %>.do?prodNo=<%=vo.getProdNo()%>"><%=vo.getProdName()%></a>
					</td>
					<td></td>
					<td align="left"><%=vo.getPrice()%></td>
					<td></td>
					<td align="left"><%=vo.getRegDate()%></td>
					<td></td>

					<td align="left">
						<% if(((User)session.getAttribute("user")).getRole().equals("admin") && authorization.equals("manage")) { %>
			               <% if(vo.getProTranCode().equals("0")) { %>
			               		판매중
			               <% } else if(vo.getProTranCode().equals("1")) { %>
			               		결제완료
			               		<a href="updateTranCodeByProd.do?prodNo=<%= vo.getProdNo() %>&tranCode=2">배송하기</a>
			               <% } else if(vo.getProTranCode().equals("2")) { %>
			               		배송중
			               <% } else if(vo.getProTranCode().equals("3")) { %>
			               		배송완료
			               <% } %>
		               <% } else { %>
		                   <% if(vo.getProTranCode().equals("0")) { %>
			               		판매중
			               <% } else { %>
			               		재고없음
			               <% } %>
		               <% } %>	
					</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				<% } // End of product list for문 %>
			</table>

			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="" /> 
						<% if (resultPage.getBeginUnitPage()>1) { %>
						<a href="javascript:fncGetProductList('<%=resultPage.getBeginUnitPage() - resultPage.getPageUnit()%>')">◀이전</a> 
						<% } %> 
						
						<% for (int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) { %>
						<a href="javascript:fncGetProductList('<%=i%>');"><%=i%></a> 
						<% } %>

						<% if (resultPage.getEndUnitPage() != resultPage.getMaxPage()) { %>
						<a href="javascript:fncGetProductList('<%=resultPage.getBeginUnitPage() + resultPage.getPageUnit()%>');">이후 ▶
						<% } %>
					</td></tr>
			</table>
			<!-- PageNavigation End... -->

		</form>

	</div>
</body>
</html>