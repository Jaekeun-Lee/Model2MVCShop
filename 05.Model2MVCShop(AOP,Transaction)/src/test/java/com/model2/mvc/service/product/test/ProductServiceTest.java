package com.model2.mvc.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {	"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml" })

public class ProductServiceTest {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDAO;

	//@Test
	public void testGetProduct() throws Exception {

		Product product = new Product("5�� �׽�Ʈ ��", "5�� �׽�Ʈ �� ������", "20201114", 55555, "5���׽�Ʈ�ۻ���", "0");
		Assert.assertEquals(product.getProdName(), productService.getProduct(10032).getProdName());
		// Assert.assertEquals(0, productService.getProduct(10032));

	}

	//@Test
	public void testUpdateProduct() throws Exception {

		Product product = new Product("5�� �׽�Ʈ ��", "5�� �׽�Ʈ �� ������", "20201114", 55555, "5���׽�Ʈ�ۻ���", "0");
		product.setProdNo(10032);
		Assert.assertEquals(1, productService.updateProduct(product));
		// Assert.assertEquals(0, productService.updateProduct(product));

	}

	//@Test
	public void testGetProductList() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
	 	search.setPageSize(3);
		Map<String, Object> map = productService.getProductList(search);
		
		List<Object> list = (List<Object>) map.get("list");
		System.out.println("�� �˻� ���� :: "+map.get("totalCount"));
		
		Assert.assertEquals(3, list.size());
		
	}
	
	@Test
	public void testGetOrderedProductList() throws Exception {
		
		//�Ǹ����� ��ǰ �׽�Ʈ
		Search search = new Search();
		search.setCurrentPage(1);
	 	search.setPageSize(3);
		search.setOrderCondition("0");
		Map<String, Object> map = productService.getProductList(search);
		
		List<Object> list = (List<Object>) map.get("list");
		System.out.println("�� �˻� ���� :: "+map.get("totalCount"));
		
		Assert.assertEquals(3, list.size());
		
	}

}// end of class