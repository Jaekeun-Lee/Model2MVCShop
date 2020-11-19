package com.model2.mvc.view.purchase;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.user.vo.UserVO;

public class ListPurchaseAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		SearchVO searchVO = new SearchVO();
		HttpSession session = request.getSession();
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String buyerId = ((UserVO)session.getAttribute("user")).getUserId();
		
		
		searchVO.setPage(page);
		searchVO.setSearchCondition(request.getParameter("searchCondition"));
		searchVO.setSearchKeyword(request.getParameter("searchKeyword"));
		searchVO.setPageUnit(Integer.parseInt(getServletContext().getInitParameter("pageSize")));
		
		PurchaseService service = new PurchaseServiceImpl();
		HashMap<String, Object> map = service.getPurchaseList(searchVO, buyerId);
		
		request.setAttribute("map", map);
		request.setAttribute("searchVO", searchVO);
		
		
		return "forward:/purchase/listPurchase.jsp";
	}

}
