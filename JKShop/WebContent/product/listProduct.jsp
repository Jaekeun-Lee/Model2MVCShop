<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function fncSearchConditionCheck() {
		var searchCondition = document.detailForm.searchCondition.value;
		var searchKeyword = document.detailForm.searchKeyword.value;

		if (searchKeyword == null) {
			alert("검색어를 입력해주세요");
		} else {
			if (searchCondition == 1 && isNaN(Number(searchKeyword)) == true) {
				alert("검색하실 상품의 상품 번호로 입력해주세요.");
			} else {
				document.getElementById("currentPage").value = 1;
				document.getElementById("orderCondition").value = null;
				document.detailForm.submit();
			}
		}
	}

	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}

	function fncOrderList(orderCondition) {
		document.getElementById("currentPage").value = 1;
		document.getElementById("orderCondition").value = orderCondition;
		document.detailForm.submit();
	}

	var count = 0;
	window.onscroll = function(e) {
		if ((window.innerHeight + window.scrollY) + 100 >= document.body.offsetHeight) {
			//실행할 로직 (콘텐츠 추가)
			count++;
			var addContent = '<p>'+count+'번 째 추가 테스트</p>'				
			$('form').append(addContent);
		}
	};

	/* function getList(page) {

		$.ajax({
			type : 'POST',
			dataType : 'json',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : {
				"page" : page
			},
			url : "http://localhost:8080/home/scroll",
			success : function(returnData) {
				var data = returnData.rows;
				var html = "";

				alert("JSONData : \n" + JSONData);
				/* if (returnData.startNum<=returnData.totCnt){
				    if(data.length>0){
				    	
				    }else{
				    //데이터가 없을경우
				    }
				}
				html = html.replace(/%20/gi, " ");
				if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
				    $("#list").html(html); 
				}else{
				    $("#busStopList").append(html);
				} 
			},
			error : function(e) {
				if (e.status == 300) {
					alert("데이터를 가져오는데 실패하였습니다.");
				}
				;
			}
		});
	} 
	*/
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div style="width: 98%; margin-top:200px; margin-left: 10px;">

		<form name="detailForm" action="/product/listProduct?menu=${menu}"
			method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<!-- <td width="93%" class="ct_ttl01">${ menu eq 'manage' ? '상품관리': '상품검색'}
								 -->
								<Strong>Category List</Strong>
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
					<td align="right"><c:if test="${ menu eq 'manage'}">
							<select name="searchCondition" id="searchCondition"
								class="ct_input_g" style="width: 80px">
								<option value="2"
									${ search.searchCondition eq '2' ? 'selected' : '' }>상품명</option>
								<option value="1"
									${ search.searchCondition eq '1' ? 'selected' : '' }>상품번호</option>

							</select>
						</c:if> <c:if test="${ menu eq 'search'}">
							<input type="hidden" id="searchCondition" name="searchCondition"
								value="2" />
						</c:if> <input type="text" name="searchKeyword"
						value="${ search.searchKeyword }" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>

					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncSearchConditionCheck();">검색</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin: 30px 0;">
				<tr>
					<td colspan="7">전체 ${ resultPage.totalCount } 건수, 현재 ${ resultPage.currentPage }
						페이지</td>

					<td colspan="100%" style="text-align: right;"><input
						type="hidden" id="orderCondition" name="orderCondition"
						value="${ search.orderCondition }" /> 정렬 기준 : <a
						href="javascript:fncOrderList('${menu eq 'manage'? '2' : '1'}');">${menu eq 'manage'? '결제완료 된' : '구매가능한'}
							상품만 보기</a> | <a href="javascript:fncOrderList('3');">가격 높은 순</a> | <a
						href="javascript:fncOrderList('4');">가격 낮은 순</a></td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b"></td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:if test="${resultPage.totalCount == 0}">
					<tr class="ct_list_pop">
						<td align="center" colspan="100%">검색 내역이 없습니다.</td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:if>

				<c:if test="${resultPage.totalCount > 0}">
					<c:set var="i" value="0" />
					<c:forEach var="product" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr class="ct_list_pop">
							<td id="num" align="center">${ i }</td>
							<td></td>
							<td class="con" align="left"><a
								href="/product/${ menu eq 'manage' ? 'updateProduct' : 'getProduct'}?prodNo=${ product.prodNo }&menu=${menu}">
									<img style="width: 120px; height: 150px;"
									src="../images/uploadFiles/${product.fileName}" />
							</a></td>
							<td></td>
							<td class="con" align="left"><c:choose>
									<c:when test="${ product.proTranCode eq '0' }">
										<a
											href="/product/${ menu eq 'manage' ? 'updateProduct' : 'getProduct'}?prodNo=${ product.prodNo }&menu=${menu}">${ product.prodName }</a>
									</c:when>
									<c:otherwise>
										${ product.prodName }
									</c:otherwise>
								</c:choose></td>
							<td></td>
							<td class="con" align="left">${product.price }</td>
							<td></td>
							<td class="con" align="left"><c:if
									test="${ menu eq 'manage' }">
									<c:choose>
										<c:when test="${ product.proTranCode eq '0' }">
										판매중
									</c:when>
										<c:when test="${ product.proTranCode eq '1' }">
										결제완료
										<a
												href="/purchase/updateTranCodeByProd?prodNo=${ product.prodNo }&tranCode=2&currentPage=${resultPage.currentPage}">배송하기</a>
										</c:when>
										<c:when test="${ product.proTranCode eq '2' }">
										배송중
									</c:when>
										<c:when test="${ product.proTranCode eq '3' }">
										배송완료
									</c:when>
									</c:choose>
								</c:if> <c:if test="${ menu eq 'search' }">
									<c:choose>
										<c:when test="${ product.proTranCode eq '0' }">
										판매중
									</c:when>
										<c:otherwise>
										재고없음
									</c:otherwise>
									</c:choose>
								</c:if></td>
						</tr>

						<tr>
							<td colspan="11" bgcolor="D6D7D6" height="1"></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="" /> 
					<jsp:include page="../common/pageNavigator.jsp"/>
					</td>
				</tr>
			</table>
			<!-- PageNavigation End... -->
		</form>

	</div>
</body>
</html>