<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>상품등록</title>

<link rel="stylesheet" href="https://raw.githack.com/cdnjs/cdnjs/master/ajax/libs/bootswatch/4.5.3/simplex/bootstrap.css" >
	<style>
       body > div.container{
            margin-top:  50px;
        }

    </style>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

function fncAddProduct(){
	
	//Form 유효성 검증
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}

 	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}

$(function() {
	
	$("button:contains('등록')").on("click", function() {
		fncAddProduct();
	});
	
	$("button:contains('취소')").on("click", function() {
		$("form")[0].reset(); // reset 
	});
	
	$("img[src='../images/ct_icon_date.gif']").on("click", function() {
		show_calendar('document.detailForm.manuDate', $("input[name='manuDate']").val());
		//$("input[name='manuDate']").text().replace('-', '');
	});
});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
<!-- ToolBar End /////////////////////////////////////-->	
   	
<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container">

<h1 class="text-center">상품 등록</h1>
			
<form name="detailForm" enctype="multipart/form-data">

		<div class="form-group">
  			<label for="prodName" class="col-form-label">상품명</label>
  			<input type="text" class="form-control" name="prodName" id="prodName" >
		</div>	
		
		<div class="form-group">
  			<label for="prodDetail" class="col-form-label">상품 상세정보</label>
  			<input type="text" class="form-control" name="prodDetail" id="prodDetail" >
		</div>	
		
		<div class="form-group">
  			<label for="manuDate" class="col-form-label">제조일자</label>
  			<img src="../images/ct_icon_date.gif" width="20" height="20" />
  			<input type="text" class="form-control" name="manuDate" id="manuDate">
		</div>	
		
		<div class="form-group">
  			<label for="price" class="col-form-label">가격</label>
  			<input type="text" class="form-control" placeholder="원" name="price" id="price" >
		</div>	
		
    <div class="form-group">
      <label for="exampleInputFile">상품 이미지</label>
      <input multiple="multiple" type="file" class="form-control-file" name="uploadFile" id="uploadFile">
    </div>
	
	<div class="form-group">
		<div class="text-center">
		<button type="button" class="btn btn-outline-primary">등록</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-secondary">취소</button>
		</div>
	</div>

</form>
</div>
</body>
</html>