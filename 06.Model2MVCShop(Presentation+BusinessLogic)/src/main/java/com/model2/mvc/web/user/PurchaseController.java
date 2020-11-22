package com.model2.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;

@Controller
public class PurchaseController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;

	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	@RequestMapping("/addPurchaseView.do")
	public ModelAndView addPurchaseView(@RequestParam("prodNo") int prodNo, HttpSession session) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", session.getAttribute("user"));
		modelAndView.addObject("product", productService.getProduct(prodNo));
		modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");

		return modelAndView;
	}

	@RequestMapping("/addPurchase.do")
	public ModelAndView addPurchase( @ModelAttribute("purchase") Purchase purchase,
			@RequestParam("buyerId") String buyerId, @RequestParam("prodNo") int prodNo) throws Exception {

		purchase.setBuyer(userService.getUser(buyerId));
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		purchase.setTranCode("1");
		
		purchaseService.addPurchase(purchase);
		
		return new ModelAndView("forward:/purchase/addPurchase.jsp","purchase", purchase);
	}

	//@RequestMapping
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
