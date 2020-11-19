package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;

public interface ProductDao {
	
	// 데이터 베이스와 직접적인 통신을 담당하는 퍼시스턴스 계층을 담당할 인터페이스

	public int addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public int updateProduct(Product product) throws Exception;

	public List<Object> getProductList(Search search) throws Exception;

}
