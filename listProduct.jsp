<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetProductList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
	$("input[name='currentPage']").val(currentPage);
   	//document.detailForm.submit();		
   	$('form').attr('method',"POST").attr("action","/product/listProduct").submit();
}

$(function() {
	$("td.ct_btn01:contains('검색')").on("click", function() {
		fncGetProductList(1);
	});
	$("#searchKeyword").on("keydown", function(event) {
		//alert(event.keyCode);
		if(event.keyCode =='13'){
			fncGetProductList(1);
		}
		
	})
	$(document).on("mouseleave",".ct_list_pop td:nth-child(3) img",function(){
	//$( ".ct_list_pop td:nth-child(3) img" ).on("mouseleave" , function() {
		$("h3").remove();
	}
	);
	$(document).on("mouseover",".ct_list_pop td:nth-child(3) img",function(){
	//$( ".ct_list_pop td:nth-child(3) img" ).on("mouseover" , function() {
		// alert("접근")
	//	alert($(this).attr("id"))
		var prodNo = $(this).attr("id");
		$.ajax( 
				{
					url : "/product/json/getProduct/"+prodNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {

						//Debug...
						//alert(status);
						//Debug...
						//alert("JSONData : \n"+JSONData);
						//alert(JSONData.userId)
						//var link = "<a href=\"/user/getUser?userId="+userId+"\"\">수정</a>";
						var displayValue = "<h3>"
													+"상품명 : "+JSONData.prodName+"<br/>"
													+"가	 격 : "+JSONData.price+"<br/>"
													+"제조일자 : "+JSONData.manuDate+"<br/>"
													+"</h3>";
						//Debug...									\
						//alert(displayValue);<div id=\""+"update\""+">수정</div>"+
						$("h3").remove();
						$( "#"+prodNo+"view" ).html(displayValue);
					}
			});
		/* self.location ="/product/getProduct?prodNo="+prodNo; */
}); 

	$( "#배송하기" ).css('color','red').on("click" , function() {
		self.location ="/purchase/updateTranCode?tranCode="+$(this).find("input[name='proTranCode']").val()+"&prodNo="+$(this).find("input[name='prodNo']").val()
});
	
	var page = $("#currentPage").val(); 
	$(window).scroll(function() {
		
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    	$("#currentPage").val(page++);
	    	var searchKeyword = $("#searchKeyword").val();
	    	var searchCondition = $("#searchCondition").val();
	      console.log(page);
	      $.ajax( 
					{
						url : "/product/json/getProductList/" ,
						method : "POST" ,
						data : JSON.stringify({currentPage : page, searchKeyword : searchKeyword, searchCondition : searchCondition  }),
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//alert(JSONData)
							
							
							//Debug...
							//console.log("JSONData : \n"+JSON.stringify(JSONData.list[0]));
							//console.log("내용"+JSONData.list[0].prodName);
							//console.log("사이즈"+JSONData.list.length)
							var pageNumber = $(".ct_list_pop td:nth-child(1):last").text().trim();
							//console.log( $(".view:last"));
							
								var menu = '${menu}';
								
							
							
							
							//alert(${menu})
							$.each(JSONData.list, function(index, item) {
								//console.log(item.prodName);
								//alert(item.proTranCode)
								//var str2 = item.proTranCode
								//console.log("코드='"+str2+"'")
								
								pageNumber = Number(pageNumber)+1;
								var str = "";
								str = '<tr class="ct_list_pop">'
								+'<td align="center">'+pageNumber+'</td>'
								+'<td></td>'
								+'<td align="left">'
								+'<a href="/product/getProduct?prodNo='+item.prodNo+'&menu=${menu}">';
								if(item.fileName!=null ){
									str+='<img id="'+item.prodNo+'"  src="/images/uploadFiles/'+item.fileName+'" width="100" height="100"  />';
								}else{
									str+='<img id="'+item.prodNo+'" src="http://placehold.it/100X100" />';
								}
								str+='</a>'+item.prodName+'</td>'
								
								+'<td></td>'
								+'<td align="left">'+item.price+'</td>'
								+'<td></td>'
								+'<td align="left">'+item.regDate+'</td>';
								if(menu!='manage'){
									if(item.proTranCode==null){
										str+='<td align="left">판매중';
									}else{
										str+='<td align="left">재고없음';
									}
									
								}else if(menu=='manage'){
									if(item.proTranCode==null){
										str+='<td align="left">판매중';
									}else if(item.proTranCode=='0  '){
										str+='<td align="left"> '
											+'<div align="letf" >구매완료</div> '
											+'<div align="letf" id="배송하기"><input type="hidden" name="prodNo" value="'+item.prodNo+'">'
											+'<input type="hidden" name="proTranCode" value="'+item.proTranCode+'">'
											+'(배송하기)</div> ';
									}else if(item.proTranCode=='1  '){
										str+='<td align="left">배송중</td>';
									}else if(item.proTranCode=='2  '){
										str+='<td align="left">배송완료</td>';
									}
								}str+='<td></td>'
								+'</tr>'
								+'<tr >'
								+'<td class="view" id="'+item.prodNo+'view" colspan="11" bgcolor="D6D7D6" height="1"></td>'
								+'</tr>';
								//console.log(pageNumber);
								//'<h1>pageNumber<h1>' )
								
								
								//console.log(item.regDate)
								//console.log(pageNumber)
								//alert("11111111"+$(".ct_list_pop:last").html())
								console.log(str)
								
						 		$("#abc").append(''+str+'') ;
								 
								//alert("222222222222222"+$(".ct_list_pop:last").html())
								
								
							})
						}
				});
	      
	    }
	});

	
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
														
<form name="detailForm" >

<input type="hidden"  name="menu" value=${menu} />

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				
				<c:if test="${menu eq 'manage' }">
			<%-- 	<%if(menu.equals("manage")){ %>--%>
					<td width="93%" class="ct_ttl01">상품 관리</td>
				</c:if>
			
			
		<%--<%}else{ %>--%>
		<c:if test="${ !(menu eq 'manage') }">
			<td width="93%" class="ct_ttl01">상품 목록조회</td>
	</c:if>
				</tr>
			</table>
		</td>
		
		<%--<%} %>--%>
		
		
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	
		<td align="right">
		<select name="searchCondition" id="searchCondition" class="ct_input_g" style="width:80px">
			<%-- 	<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
					<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option>--%>
					<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
					<option value="1" ${search.searchCondition==1 ? "selected" : "" }>상품명</option>
					<option value="2" ${search.searchCondition==2 ? "selected" : "" }>낮은가격순</option>
					<option value="3" ${search.searchCondition==3 ? "selected" : "" }>높은가격순</option>
			</select>
			
			<input 	type="text" name="searchKeyword"  id="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
							class="ct_input_g" style="width:200px; height:19px"  >
							</td>
			<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!--  <button id="search" onclick="javascript:fncGetProductList('1');">검색</button>-->
						검색
					</td>
							
							
							
							
							
							
							
						
		
	
					
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table id="abc" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount } 건수, 현재  ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" >No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >등록일</td>	
		<td class="ct_list_b" >현재상태</td>
		<td class="ct_line02"></td>
		
			
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	 
	<%--<% 	
		int no=list.size();
		System.out.println(no);
		for(int i=0; i<list.size(); i++) {
			ProductVO vo = (ProductVO)list.get(i);
	--%>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
	<c:set var="i" value="${i+1 }"/>
	<tr class="ct_list_pop">
			<td align="center">${ i }</td>
		<td></td>
		<td align="left">
			<!--  <a href="/product/getProduct?prodNo=${product.prodNo }&menu=${menu}">${product.prodName}</a>-->
		<a href="/product/getProduct?prodNo=${product.prodNo }&menu=${menu}">
		<c:if test="${!empty product.fileName}">
		<img id="${product.prodNo}"  src="/images/uploadFiles/${product.fileName}" width="100" height="100"  />
		</c:if>
		<c:if test="${ empty product.fileName}">
		<img id="${product.prodNo}" src="http://placehold.it/100X100" />
		</c:if>
		</a>
		${product.prodName}
		
		</td>
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}
		</td>
		
		<c:if test="${! (menu eq 'manage') }">
		<c:if test="${product.proTranCode==null}">
		<%--<%if(vo.getProTranCode()==null){ --%>		
		<td align="left">판매중
		</c:if>
		<c:if test="${!(product.proTranCode==null)}">
		<td align="left">재고없음.
		</c:if>
		</c:if>
		
		<c:if test="${ menu eq 'manage' }">
		<c:if test="${product.proTranCode==null}">
		<td align="left">판매중
		</c:if>
		<c:if test="${product.proTranCode=='0  '}">
		<td align="left"> 
		
		<div align="letf" >구매완료</div> 
		<div align="letf" id="배송하기"><input type="hidden" name="prodNo" value="${product.prodNo }">
		<input type="hidden" name="proTranCode" value="${product.proTranCode }">
		(배송하기)</div> 
		</c:if>
		<c:if test="${product.proTranCode=='1  '}">
			<td align="left">배송중</td>	
		</c:if>
		<c:if test="${product.proTranCode=='2  '}">
			<td align="left">배송완료</td>	
		<td></td>
		</c:if>
		</c:if>
		
		<%--<%}else{ --%>
		
		<%--<%} --%>
	</tr>
	<tr >
	
	<td  id="${product.prodNo}view"  class="view" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	
	
	<%--<% } --%>
	</c:forEach>
</table>

	
	

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<td align="center">
	<input type="hidden" id="currentPage" name="currentPage" value="1"/>
	
	<!-- jsp include 말고 EL의 import를 사용 해서 pageNavigator를 인터페이스화 시킴 .. 장점 어떤 page던 페이지 value(fnc)만 바꿔주면 다 사용가능 -->
	<%-- <c:set var="fnc" value="fncGetProductList" scope="request" />
	
	<c:import var="pageNavi" url="/common/pageNavigator.jsp" scope="request"/>
	${pageNavi}
	 --%>
	
		
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->
</form>
</div>

</body>
</html>
