package com.model2.mvc.view.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class ListProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String authorization = "";

		Search search = new Search();
		HttpSession session = request.getSession();

		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			if (request.getParameter("menu") == null) {
				session.getAttribute("menuType");
			}
		} else { // �����޴� Ŭ����
			if (request.getParameter("menu") != null) {
				if (request.getParameter("menu").equals("manage")) {
					authorization = "manage";
					System.out.println("��ǰ���� (�������ɸ��)");
				} else {
					authorization = "search";
					System.out.println("��ǰ�˻� (���� �Ұ���)");
				}
				session.setAttribute("menuType", authorization);
			} else {
				System.out.println("��ǰ�޴� parameter ���̴�");
			}

		}

		search.setCurrentPage(currentPage);
		search.setSearchCondition(request.getParameter("searchCondition"));
		search.setSearchKeyword(request.getParameter("searchKeyword"));
		search.setPageSize(Integer.parseInt(getServletContext().getInitParameter("pageSize")));
		int pageUnit = Integer.parseInt(getServletContext().getInitParameter("pageUnit"));

		ProductService service = new ProductServiceImpl();
		Map<String, Object> map = service.getProductList(search);

		/*
		System.out.println("============"+currentPage);
		System.out.println("============"+((Integer)map.get("totalCount")).intValue());
		System.out.println("============"+pageUnit);
		System.out.println("============"+search.getPageSize());
		*/
		
		Page resultPage	= new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		System.out.println("ListUserAction ::"+resultPage);
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		System.out.println("Search ::"+search);

		return "forward:/product/listProduct.jsp";
	}

}
