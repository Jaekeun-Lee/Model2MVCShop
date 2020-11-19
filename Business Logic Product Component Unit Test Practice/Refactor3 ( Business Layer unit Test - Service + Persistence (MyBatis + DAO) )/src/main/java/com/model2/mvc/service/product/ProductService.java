package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;

public interface ProductService {
	
	public int addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public int updateProduct(Product product) throws Exception;
	
	public List<Object> getProductList(Search search) throws Exception;
	
}
