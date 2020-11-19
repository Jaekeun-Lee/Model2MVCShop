package com.model2.mvc.view.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.Search;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class ListSaleAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Search search = new Search();
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		search.setCurrentPage(page);
		search.setPageSize(Integer.parseInt(getServletContext().getInitParameter("pageSize")));
		
		PurchaseService service = new PurchaseServiceImpl();
		Map<String, Object> map = service.getSaleList(search);
		
		request.setAttribute("map", map);
		request.setAttribute("search", search);
		
		
		return "forward:/purchase/listPurchase.jsp";
	}

}
