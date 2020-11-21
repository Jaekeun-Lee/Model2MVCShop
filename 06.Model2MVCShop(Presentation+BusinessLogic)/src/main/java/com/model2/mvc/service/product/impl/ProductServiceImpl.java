package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	@Autowired
	@Qualifier("productDaoImpl")
	ProductDao productDao;

	public ProductServiceImpl() {
		System.out.println("::" + getClass() + ".default Constructor Call....");
	}

	@Override
	public int addProduct(Product product) throws Exception {
		return productDao.addProduct(product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return productDao.updateProduct(product);
	}

	@Override
	public Map<String , Object > getProductList(Search search) throws Exception {
		List<Object> list = productDao.getProductList(search);
		int totalCount = ((Product)list.get(0)).getCount();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}