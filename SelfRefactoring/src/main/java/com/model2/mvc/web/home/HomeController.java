package com.model2.mvc.web.home;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("home/*")
public class HomeController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Value("#{commonProperties['pageUnit'] ?: 6}")
	int pageUnit;

	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;
	
	@Value("#{commonProperties['path']}")
	String path;
	
	public HomeController() {
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping(value ="/")
	public ModelAndView getMainList(Search search)
			throws Exception {

		System.out.println("HomeController Start");

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
		modelAndView.setViewName("forward:/home.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		return modelAndView;
	}

}