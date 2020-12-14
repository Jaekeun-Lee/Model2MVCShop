package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	
	// ������ ���̽��� �������� ����� ����ϴ� �۽ý��Ͻ� ������ ����� �������̽�

	public int addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public int updateProduct(Product product) throws Exception;

	public List<Object> getProductList(Search search) throws Exception;

}