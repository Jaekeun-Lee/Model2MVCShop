package com.model2.mvc.service.product.impl;

import java.util.List;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

public class ProductServiceImpl implements ProductService {

	ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		System.out.println("::" + getClass() + ".setUserDao Call....");
		this.productDao = productDao;
	}

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
	public List<Object> getProductList(Search search) throws Exception {
		return productDao.getProductList(search);
	}

}