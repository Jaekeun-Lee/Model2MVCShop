package com.model2.mvc.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;
import com.model2.mvc.service.product.ProductDao;


public class ProductDaoImpl implements ProductDao {

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;
	}

	public ProductDaoImpl() {
		System.out.println("::"+getClass()+".default Constructor Call....");
	}
	
	@Override
	public int addProduct(Product product) throws Exception {
		return sqlSession.insert("ProductMapper.insertProduct",product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.findProduct",prodNo);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return sqlSession.update("ProductMapper.updateProduct",product);
	}

	@Override
	public List<Object> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList",search);
	}

}
