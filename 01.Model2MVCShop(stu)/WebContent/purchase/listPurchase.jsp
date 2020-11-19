<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"%>
<%@ page import="com.model2.mvc.common.*"%>
<%@ page import="com.model2.mvc.service.product.vo.*"%>
<%@ page import="com.model2.mvc.service.user.vo.*"%>
<%@ page import="com.model2.mvc.service.purchase.vo.*" %>

<%
	Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
	SearchVO searchVO = (SearchVO) request.getAttribute("searchVO");
   
   int total = 0;
   List<PurchaseVO> list = null;
   if (map != null) {
      total = ((Integer) map.get("count")).intValue();
      list = (List<PurchaseVO>) map.get("list");
   }
   
   int currentPage = searchVO.getPage();
   
   int totalPage = 0;
   if (total > 0) {
      totalPage = total / searchVO.getPageUnit();
      if (total % searchVO.getPageUnit() > 0)
         totalPage += 1;
   }
%>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList() {
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/listUser.do" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü <%=total%> �Ǽ�, ���� <%=currentPage%> ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ��ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ȭ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

			
			
			<%
										if(total==0) {
									%>
			<tr class="ct_list_pop"> 
				<td align="center" colspan="100%">���� ������ �����ϴ�.</td>
			</tr>
			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>
			<%
				} else {
			%>
			<%
				int no=list.size();
				               for(int i=0; i<list.size(); i++) {
				                  PurchaseVO vo = (PurchaseVO)list.get(i);
			%>

				<tr class="ct_list_pop">
					<td align="center"><a href="/getPurchase.do?tranNo=<%= vo.getTranNo() %>"><%=no--%></a>
					</td>
					<td></td>
					<td align="left"><a href="/getUser.do?userId=<%= vo.getBuyer().getUserId() %>"><%= vo.getBuyer().getUserId() %></a></td>
					<td></td>
					<td align="left"><%= vo.getBuyer().getUserName() %></td>
					<td></td>
					<td align="left"><%= vo.getBuyer().getPhone() %></td>
					<td></td>
					<td align="left">
					<% if(vo.getTranCode().equals("1")) { %>
					���ſϷ� // ��� �غ����Դϴ�.
					<% } else if(vo.getTranCode().equals("2")) { %>
					�����Ͻ� ��ǰ�� ������Դϴ�.
					<% } else if(vo.getTranCode().equals("3")) { %>
					[��ǰ ���� �Ϸ�] == ��ǰ �ŷ��� �������ϴ�.
					<% } %> 
					</td>
					<td></td>
					<td align="left">
					<% if(vo.getTranCode().equals("2")) { %>
					<a href="updateTranCode.do?tranNo=<%= vo.getTranNo() %>&tranCode=3"/>���� ����(���� Ȯ��)</a>
					<% } %> 
					</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			<%} %>
			<%} %>
			</table>
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						<% for(int i=1;i<=totalPage;i++){ %> <a
						href="/listPurchase.do?page=<%=i%>"><%=i %></a> <% } %>
					</td>
				</tr>
			</table>
			<!--  ������ Navigator �� -->
		</form>

	</div>

</body>
</html>