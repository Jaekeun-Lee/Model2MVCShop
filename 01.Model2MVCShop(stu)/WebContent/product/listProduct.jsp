<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="com.model2.mvc.common.*"%>
<%@ page import="com.model2.mvc.service.product.vo.*"%>
<%@ page import="com.model2.mvc.service.user.vo.*" %>

<%
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute("map");
	SearchVO searchVO = (SearchVO) request.getAttribute("searchVO");
   
   int total = 0;
   List<ProductVO> list = null;
   if (map != null) {
      total = ((Integer) map.get("count")).intValue();
      list = (List<ProductVO>) map.get("list");
   }
   
   int currentPage = searchVO.getPage();
   
   int totalPage = 0;
   if (total > 0) {
      totalPage = total / searchVO.getPageUnit();
      if (total % searchVO.getPageUnit() > 0)
         totalPage += 1;
   }
   
   int pageGroup = currentPage % 5;
   int startPage = currentPage / 5 * 5 + 1;
   if(pageGroup == 0) startPage -= 5;
   int endPage = startPage + 4;
   if( endPage > totalPage ) endPage = totalPage;
   

   String authorization = (String)session.getAttribute("menuType");
%>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
   
   function fncSearchConditionCheck() {
      var searchCondition = document.detailForm.searchCondition.value;
      var searchKeyword = document.detailForm.searchKeyword.value;
      
      if(searchKeyword == null){
         alert("�˻�� �Է����ּ���");
      }else{
         if(searchCondition==0 && isNaN(Number(searchKeyword))==true){
            alert("�˻��Ͻ� ��ǰ�� ��ǰ ��ȣ�� �Է����ּ���.");
         } else if(searchCondition==2 && isNaN(Number(searchKeyword))==true){
            alert("�˻��Ͻ� ��ǰ�� ������ �Է����ּ���.");
         } else {
            document.detailForm.submit();
         }
      }
      
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
                     <%
                     	if(authorization.equals("manage")) {
                     %>
                        <td width="93%" class="ct_ttl01">��ǰ ����</td>
                     <%
                     	} else {
                     %>
                        <td width="93%" class="ct_ttl01">��ǰ �˻�</td>
                     <%
                     	}
                     %>
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
               <%
               	if(searchVO.getSearchCondition() != null) {
               %>
               <td align="right">
                  <select name="searchCondition" class="ct_input_g" style="width: 80px">
                     <%
                     	if(searchVO.getSearchCondition().equals("0")){
                     %>
                        <option value="0" selected>��ǰ��ȣ</option>
                        <option value="1">��ǰ��</option>
                        <option value="2">��ǰ����</option>
                     <%
                     	} else if(searchVO.getSearchCondition().equals("1")){
                     %>
                        <option value="0">��ǰ��ȣ</option>
                        <option value="1" selected>��ǰ��</option>
                        <option value="2">��ǰ����</option>
                     <%
                     	} else {
                     %>
                        <option value="0">��ǰ��ȣ</option>
                        <option value="1">��ǰ��</option>
                        <option value="2" selected>��ǰ����</option>
                     <%
                     	}
                     %>
                  </select> 
                  <input type="text" name="searchKeyword" class="ct_input_g" style="width: 200px; height: 19px" />
               </td>
               
               <%
                              	}else{
                              %>
                  <td align="right">
                     <select name="searchCondition" class="ct_input_g" style="width:80px">
                        <option value="0">��ǰ��ȣ</option>
                        <option value="1">��ǰ��</option>
                        <option value="2">��ǰ����</option>
                     </select>
                     <input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
                  </td>
               <%
               	}
               %>

               <td align="right" width="70">
                  <table border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td width="17" height="23"><img
                           src="/images/ct_btnbg01.gif" width="17" height="23"></td>
                        <td background="/images/ct_btnbg02.gif" class="ct_btn01"
                           style="padding-top: 3px;"><a
                           href="javascript:fncSearchConditionCheck();">�˻�</a></td>
                        <td width="14" height="23"><img
                           src="/images/ct_btnbg03.gif" width="14" height="23"></td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>


         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td colspan="11" >��ü  <%=total%> �Ǽ�, ���� <%=currentPage%> ������</td>
            </tr>
            <tr>
               <td class="ct_list_b" width="100">No</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b" width="150">��ǰ��</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b" width="150">����</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b">�����</td>
               <td class="ct_line02"></td>
               <td class="ct_list_b">�������</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="808285" height="1"></td>
            </tr>

            <%
            	int no=list.size();
                                       for(int i=0; i<list.size(); i++) {
                                          ProductVO vo = (ProductVO)list.get(i);
            %>
            <tr class="ct_list_pop">
               <td align="center"><%=no--%></td>
               <td></td>
               <td align="left">
               <% if(((UserVO)session.getAttribute("user")).getRole().equals("admin") && authorization.equals("manage")) { %>
                  <a href="/updateProductView.do?prodNo=<%=vo.getProdNo()%>" ><%= vo.getProdName() %></a>
               <% } else { %>
                   <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>" ><%= vo.getProdName() %></a>
                <% } %>
                
               </td>
               <td></td>
               <td align="left"><%= vo.getPrice() %></td>
               <td></td>
               <td align="left"><%= vo.getRegDate() %></td>
               <td></td>
  
               <% if(((UserVO)session.getAttribute("user")).getRole().equals("admin") && authorization.equals("manage")) { %>
	               <% if(vo.getProTranCode().equals("0")) { %>
	               		<td align="left">�Ǹ���</td>
	               <% } else if(vo.getProTranCode().equals("1")) { %>
	               		<td align="left">
	               		�����Ϸ�
	               		<a href="updateTranCodeByProd.do?prodNo=<%= vo.getProdNo() %>&tranCode=2">����ϱ�</a>
	               		</td>
	               <% } else if(vo.getProTranCode().equals("2")) { %>
	               		<td align="left">�����</td>
	               <% } else if(vo.getProTranCode().equals("3")) { %>
	               		<td align="left">��ۿϷ�</td>
	               <% } %>
               <% } else { %>
                   <% if(vo.getProTranCode().equals("0")) { %>
	               		<td align="left">�Ǹ���</td>
	               <% } else { %>
	               		<td align="left">������</td>
	               <% } %>
               <% } %>
               </td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="D6D7D6" height="1"></td>
            </tr>
            <% } %>
         </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td align="center">
               <% for(int i=1;i<=totalPage;i++){ %>
               		<% if(searchVO.getSearchCondition()==null && searchVO.getSearchKeyword()==null) {%>
                  		<a href="/listProduct.do?page=<%=i%>"><%=i %></a>
                  	<% } else { %>
                  		<a href="/listProduct.do?searchKeyword=<%=request.getParameter("searchKeyword")%>&page=<%=i%>&searchCondition=<%=request.getParameter("searchCondition")%>"><%=i %></a>
                  	<% } %>
               <% } %>   
               </td>
            </tr>
         </table>
         <!--  ������ Navigator �� -->

      </form>

   </div>
</body>
</html>