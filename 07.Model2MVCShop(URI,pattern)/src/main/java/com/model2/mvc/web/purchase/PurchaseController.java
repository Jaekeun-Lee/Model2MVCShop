package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;

@Controller
@RequestMapping("/purchase/*")
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

	@RequestMapping(value="addPurchase/{prodNo}" , method = RequestMethod.GET)
	public ModelAndView addPurchase(@PathVariable int prodNo, HttpSession session) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", session.getAttribute("user"));
		modelAndView.addObject("product", productService.getProduct(prodNo));
		modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");

		return modelAndView;
	}

	@RequestMapping(value="addPurchase" , method = RequestMethod.POST)
	public ModelAndView addPurchase( @ModelAttribute("purchase") Purchase purchase,
			@RequestParam("buyerId") String buyerId, @RequestParam("prodNo") int prodNo) throws Exception {

		purchase.setBuyer(userService.getUser(buyerId));
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		purchase.setTranCode("1");
		
		purchaseService.addPurchase(purchase);
		
		return new ModelAndView("forward:/purchase/addPurchase.jsp","purchase", purchase);
	}

	@RequestMapping("getPurchase/{tranNo}")
	public ModelAndView getPurchase (@PathVariable int tranNo) throws Exception {
		return new ModelAndView("forward:/purchase/getPurchase.jsp","purchase",purchaseService.getPurchase(tranNo));
	}
	
	@RequestMapping("listPurchase")
	public ModelAndView listPurchase (@ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String buyerId = ((User)session.getAttribute("user")).getUserId();
		Map<String, Object> map = purchaseService.getPurchaseList(search, buyerId);

		Page resultPage = new Page( search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		System.out.println("ListPurchase ::" + resultPage);
		System.out.println("ListPurchase ::" + search);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase/{tranNo}", method = RequestMethod.GET)
	public ModelAndView updatePurchase (@PathVariable int tranNo) throws Exception {
		return new ModelAndView("forward:/purchase/updatePurchase.jsp","purchase",purchaseService.getPurchase(tranNo));
	}
	
	@RequestMapping(value="updatePurchase/{tranNo}", method = RequestMethod.POST)
	public ModelAndView updatePurchase (@ModelAttribute("purchase") Purchase purchase,@PathVariable int tranNo) throws Exception {
		
		purchaseService.updatePurchase(purchase);
		return new ModelAndView("forward:/purchase/getPurchase.jsp","tranNo",tranNo);
	}
	
	@RequestMapping("updateTranCode/{tranNo}/{tranCode}")
	public ModelAndView updateTranCode(@PathVariable int tranNo, @PathVariable String tranCode ) throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);
		
		return new ModelAndView("redirect:/purchase/listPurchase");
			
		}
	
	
	@RequestMapping("/updateTranCodeByProd/{prodNo}/{tranCode}")
	public ModelAndView updateTranCodeByProd(@PathVariable int prodNo, @PathVariable String tranCode ) throws Exception {
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);
		return new ModelAndView("forward:/product/listProduct/manage");
	}
	
	
	
	
	
	
	
	
}
