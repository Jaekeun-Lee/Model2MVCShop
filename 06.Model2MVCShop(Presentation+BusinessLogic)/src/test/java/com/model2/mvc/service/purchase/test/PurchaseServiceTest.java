package com.model2.mvc.service.purchase.test;


import java.util.HashMap;
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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })

public class PurchaseServiceTest {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;

	//@Test
	public void addPurchase() throws Exception {
		
		User user = new User();
		Product product = new Product();
		Purchase purchase = new Purchase();
		
		user.setUserId("user16");
		product.setProdNo(10008);
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		
		purchaseService.addPurchase(purchase);
		
	}
	
	//@Test
	public void getPurchaseTest() throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(10000);
		Assert.assertEquals("user16", purchase.getBuyer().getUserId());
		
	}

	//@Test
	public void getPurchase2Test() throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(10000);
		Assert.assertEquals("user16", purchase.getBuyer().getUserId());
		
	}

	//@Test
	public void getPurchaseListTest() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = purchaseService.getPurchaseList(search, "user16");
		
		List<Object> list = (List<Object>) map.get("list");
		
		System.out.println("totalCount : " + map.get("count"));
		
		Assert.assertEquals(3, list.size());
		
		
	}
	
	//@Test
	public void updatePurchaseTest() throws Exception {
		
		Purchase purchase = new Purchase();
		purchase.setReceiverName("test");
		purchase.setTranNo(10000);
		
		purchaseService.updatePurchase(purchase);
		
		Purchase updatedPurchase = purchaseService.getPurchase(purchase.getTranNo());
		
		Assert.assertEquals("test", updatedPurchase.getReceiverName());
		
	}
	
	@Test
	public void updateTranCode() throws Exception {
		
		Purchase purchase = new Purchase();

		purchase.setTranNo(10000);
		purchase.setTranCode("2");
		
		purchaseService.updateTranCode(purchase);
		
		Purchase updatedPurchase = purchaseService.getPurchase(purchase.getTranNo());
		
		Assert.assertEquals("2", updatedPurchase.getTranCode().trim());
	}
	
	
	
}// end of class