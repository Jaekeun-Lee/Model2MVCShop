package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.product.vo.ProductVO;

public class AddPurchaseViewAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int prodNo = Integer.parseInt(request.getParameter("prod_no"));
		
		ProductService service = new ProductServiceImpl();
		ProductVO productVO = service.getProduct(prodNo);
		
		request.setAttribute("productVO", productVO);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}

}
