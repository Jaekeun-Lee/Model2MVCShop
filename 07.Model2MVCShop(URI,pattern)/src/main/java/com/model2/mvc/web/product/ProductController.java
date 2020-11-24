package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit'] ?: 5}")
	int pageUnit;

	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;

	@RequestMapping(value="addProduct", method = RequestMethod.GET)
	public ModelAndView addProduct()  {
		System.out.println("addProduct : GET");

		return new ModelAndView("forward:/product/addProductView.jsp");
	}

	
	@RequestMapping(value="addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product) throws Exception {

		System.out.println("addProduct : POST");
		productService.addProduct(product);
		
		return new ModelAndView("forward:/product/addProductResult.jsp","product",product);
	}

	@RequestMapping("listProduct/{menu}")
	public ModelAndView listProduct(@PathVariable String menu, 
									@ModelAttribute("search") Search search)
			throws Exception {

		System.out.println("listProduct/"+menu);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(), 
								   ((Integer) map.get("totalCount")).intValue(),
								   pageUnit,
								   search.getPageSize());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/listProduct.jsp");
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		return modelAndView;
	}

	@RequestMapping(value="getProduct/{menu}/{prodNo}" , method = RequestMethod.GET)
	public ModelAndView getProduct( @PathVariable String menu,
									@PathVariable int prodNo, 
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception {

		System.out.println("getProduct/"+menu);

		Product product = productService.getProduct(prodNo);
		setCookie(request, response, prodNo);
		String viewName = menu.equals("manage")?"forward:/product/updateProductView.jsp":"forward:/product/getProduct.jsp";
		
		System.out.println("viewName = "+viewName);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("product", product);
		modelAndView.addObject("menu",menu);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateProduct/{prodNo}" , method = RequestMethod.GET)
	public ModelAndView updateProduct( @PathVariable int prodNo ) throws Exception {

		System.out.println("updateProduct/"+prodNo);
		
		return new ModelAndView("forward:/product/updateProductView.jsp","product",productService.getProduct(prodNo));
	}
	
	@RequestMapping(value="updateProduct/{prodNo}" , method = RequestMethod.POST)
	public ModelAndView updateProduct( @ModelAttribute("product") Product product , Model model) throws Exception {
		
		System.out.println("updateProduct : POST");
		
		productService.updateProduct(product);
		product = productService.getProduct(product.getProdNo());
		
		return new ModelAndView("forward:/product/getProduct.jsp","product", product);
		
	}

	private void setCookie(HttpServletRequest request, HttpServletResponse response,int prodNo) {

		Cookie[] cookies = request.getCookies();
		String history = "";
		String newProdNo = String.valueOf(prodNo);
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("history")) {
				if (cookie.getValue().contains(newProdNo)) {
					history = cookie.getValue();
				} else {
					history = newProdNo + "," + cookie.getValue();
				}
			} else {
				history = newProdNo + ",";
			}
			cookie = new Cookie("history", history);
			response.addCookie(cookie);
		}
	}

}