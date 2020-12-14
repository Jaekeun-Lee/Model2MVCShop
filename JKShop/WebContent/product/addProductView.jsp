<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>��ǰ���</title>

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
	
	//Form ��ȿ�� ����
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

 	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}

$(function() {
	
	$("button:contains('���')").on("click", function() {
		fncAddProduct();
	});
	
	$("button:contains('���')").on("click", function() {
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
   	
<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">

<h1 class="text-center">��ǰ ���</h1>
			
<form name="detailForm" enctype="multipart/form-data">

		<div class="form-group">
  			<label for="prodName" class="col-form-label">��ǰ��</label>
  			<input type="text" class="form-control" name="prodName" id="prodName" >
		</div>	
		
		<div class="form-group">
  			<label for="prodDetail" class="col-form-label">��ǰ ������</label>
  			<input type="text" class="form-control" name="prodDetail" id="prodDetail" >
		</div>	
		
		<div class="form-group">
  			<label for="manuDate" class="col-form-label">��������</label>
  			<img src="../images/ct_icon_date.gif" width="20" height="20" />
  			<input type="text" class="form-control" name="manuDate" id="manuDate">
		</div>	
		
		<div class="form-group">
  			<label for="price" class="col-form-label">����</label>
  			<input type="text" class="form-control" placeholder="��" name="price" id="price" >
		</div>	
		
    <div class="form-group">
      <label for="exampleInputFile">��ǰ �̹���</label>
      <input multiple="multiple" type="file" class="form-control-file" name="uploadFile" id="uploadFile">
    </div>
	
	<div class="form-group">
		<div class="text-center">
		<button type="button" class="btn btn-outline-primary">���</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-secondary">���</button>
		</div>
	</div>

</form>
</div>
</body>
</html>