package com.model2.mvc.service.product.test;

import org.apache.ibatis.session.SqlSession;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;


/*
 * FileName : MyBatisTestApp101.java
  */
public class ProductTestApp1 {
	
	///main method
	public static void main(String[] args) throws Exception{
	
		//==> SqlSessionFactoryBean.getSqlSession()�� �̿� SqlSession instance GET
		SqlSession sqlSession = SqlSessionFactoryBean.getSqlSession();
		
		//==> Test �� Product instance ����  
		Product product = new Product("1�� �׽�Ʈ ��", "1�� �׽�Ʈ �� ������", "20201114", 11111, "1���׽�Ʈ�ۻ���", "0");
		System.out.println(product);
		
		
		//System.out.println(":: 1. addProduct(INSERT)  ? ");
		//System.out.println(":: "+ sqlSession.insert("ProductMapper01.insertProduct",product)+"\n");
		
		System.out.println(":: 2. findProduct(SELECT)  ? ");
		System.out.println(":: "+ sqlSession.selectOne("ProductMapper01.findProduct",10032)+"\n");
		
		product.setProdNo(10032);
		product.setProdName("1���׽�Ʈ�� �����׽�Ʈ");
		System.out.println(":: 3. updateProduct(UPDATE)  ? ");
		System.out.println(":: "+ sqlSession.update("ProductMapper01.updateProduct",product)+"\n");
		
		System.out.println(":: 4. ���� ���  ? ");
		System.out.println(":: "+ sqlSession.selectOne("ProductMapper01.findProduct",10032)+"\n");
		
		
		Search search = new Search();
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		System.out.println(":: 5. getProductList(���ı��� X)  ? ");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		System.out.println(":: 6. getProductList(���ı��� �Ǹ��� ��ǰ�� ����)  ? ");
		search.setOrderCondition("0");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		System.out.println(":: 6. getProductList(���ı��� ����� ��ǰ�� ����)  ? ");
		search.setOrderCondition("1");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));

		System.out.println(":: 7. getProductList(���ı��� ���� ������)  ? ");
		search.setOrderCondition("2");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		System.out.println(":: 8. getProductList(���ı��� ���� ������)  ? ");
		search.setOrderCondition("3");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		
		//END::SqlSession  close
		System.out.println("::END::SqlSession �ݱ�..");
		sqlSession.close();
		
	}//end of main
}//end of class