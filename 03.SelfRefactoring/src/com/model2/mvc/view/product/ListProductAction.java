package com.model2.mvc.view.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.CommonUtil;
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
		} else { // 좌측메뉴 클릭시
			if (request.getParameter("menu") != null) {
				if (request.getParameter("menu").equals("manage")) {
					authorization = "manage";
					System.out.println("상품관리 (수정가능모드)");
				} else {
					authorization = "search";
					System.out.println("상품검색 (수정 불가능)");
				}
				session.setAttribute("menuType", authorization);
			} else {
				System.out.println("상품메뉴 parameter 널이다");
			}

		}

		//==> null 을 ""(nullString)으로 변경
		String searchCondition = CommonUtil.null2str(request.getParameter("searchCondition"));
		String searchKeyword = CommonUtil.null2str(request.getParameter("searchKeyword"));
		String orderCondition = CommonUtil.null2str(request.getParameter("orderCondition"));
		
		search.setCurrentPage(currentPage);
		search.setSearchCondition(searchCondition);
		search.setSearchKeyword(searchKeyword);
		search.setOrderCondition(orderCondition);
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
		System.out.println("ListProductAction ::"+resultPage);
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search);
		System.out.println("Search ::"+search);

		return "forward:/product/listProduct.jsp";
	}

}
