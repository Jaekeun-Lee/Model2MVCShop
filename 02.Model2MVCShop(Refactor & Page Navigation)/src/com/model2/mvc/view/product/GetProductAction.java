package com.model2.mvc.view.product;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class GetProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int prodNo = Integer.parseInt(request.getParameter("prodNo"));

		System.out.println("상품번호 : " + prodNo);

		ProductService service = new ProductServiceImpl();
		Product vo = service.getProduct(prodNo);
		
		String history = String.valueOf(vo.getProdNo())+",";

		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			if (c.getName().equals("history")) {
				String check = c.getValue();
				if(check != history) {
					c.setValue(check.concat(history));
					response.addCookie(c);
				} 
			} else {
				response.addCookie(new Cookie("history", history));
			}
		}
		
		
		request.setAttribute("vo", vo);

		
		return "forward:/product/getProduct.jsp";
	}
}
