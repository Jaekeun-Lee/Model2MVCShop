package com.model2.mvc.web.home;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.home.HomeService;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("home/*")
public class HomeController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("homeServiceImpl")
	private HomeService homeService;

	@Value("#{commonProperties['pageUnit'] ?: 6}")
	int pageUnit;

	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;
	
	public HomeController() {
		System.out.println(this.getClass()+"Start");
	}
	
	@RequestMapping(value ="/")
	public ModelAndView getMainList(Search search)
			throws Exception {

		search.setCurrentPage(1);
		search.setPageSize(pageSize);

		List<Object> mainImageList = homeService.getMainImageList(pageSize);
		
		Map<String, Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(), 
								   ((Integer) map.get("totalCount")).intValue(),
								   pageUnit,
								   search.getPageSize());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/home.jsp");
		modelAndView.addObject("mainImageList",mainImageList);
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		return modelAndView;
	}
	
	@RequestMapping(value ="/scroll")
	public @ResponseBody Map<String, Object> getMainListByScroll(Search search, @RequestBody int page )
			throws Exception {

		search.setCurrentPage(page);
		search.setPageSize(pageSize);

		List<Object> mainImageList = homeService.getMainImageList(pageSize);
		
		Map<String, Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(), 
								   ((Integer) map.get("totalCount")).intValue(),
								   pageUnit,
								   search.getPageSize());
		
		map.put("mainImageList",mainImageList);
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);

		return map;
	}
}