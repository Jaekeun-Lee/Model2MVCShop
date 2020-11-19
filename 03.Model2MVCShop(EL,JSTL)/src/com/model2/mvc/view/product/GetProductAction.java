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

		System.out.println("��ǰ��ȣ : " + prodNo);

		ProductService service = new ProductServiceImpl();
		Product product = service.getProduct(prodNo);
		
		String history = String.valueOf(product.getProdNo())+",";

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
		
		
		request.setAttribute("product", product);

		
		return "forward:/product/getProduct.jsp";
	}
}
