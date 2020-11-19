package com.model2.mvc.view.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class ListProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String authorization = "";
		
		SearchVO searchVO = new SearchVO();
		HttpSession session = request.getSession();
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			if(request.getParameter("menu")==null){
				session.getAttribute("menuType");
			}
		} else {
			if(request.getParameter("menu")!=null){
				if(request.getParameter("menu").equals("manage")){
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
		
		
		searchVO.setPage(page);
		searchVO.setSearchCondition(request.getParameter("searchCondition"));
		searchVO.setSearchKeyword(request.getParameter("searchKeyword"));
		searchVO.setPageUnit(Integer.parseInt(getServletContext().getInitParameter("pageSize")));
		
		ProductService service = new ProductServiceImpl();
		Map<String, Object> map = service.getProductList(searchVO);
		
		
		request.setAttribute("map", map);
		request.setAttribute("searchVO", searchVO);
		
		
		return "forward:/product/listProduct.jsp";
	}

}
