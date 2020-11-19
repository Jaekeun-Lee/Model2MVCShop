package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public class GetPurchaseAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("tranNo = "+Integer.parseInt(request.getParameter("tranNo")));

		PurchaseService service = new PurchaseServiceImpl();
		PurchaseVO vo = service.getPurchase(Integer.parseInt(request.getParameter("tranNo")));
		
		request.setAttribute("vo", vo);
		
		return "forward:/purchase/getPurchase.jsp";
	}

}
