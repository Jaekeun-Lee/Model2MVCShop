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
	
		//==> SqlSessionFactoryBean.getSqlSession()을 이용 SqlSession instance GET
		SqlSession sqlSession = SqlSessionFactoryBean.getSqlSession();
		
		//==> Test 용 Product instance 생성  
		Product product = new Product("1번 테스트 앱", "1번 테스트 앱 디테일", "20201114", 11111, "1번테스트앱사진", "0");
		System.out.println(product);
		
		
		//System.out.println(":: 1. addProduct(INSERT)  ? ");
		//System.out.println(":: "+ sqlSession.insert("ProductMapper01.insertProduct",product)+"\n");
		
		System.out.println(":: 2. findProduct(SELECT)  ? ");
		System.out.println(":: "+ sqlSession.selectOne("ProductMapper01.findProduct",10032)+"\n");
		
		product.setProdNo(10032);
		product.setProdName("1번테스트앱 수정테스트");
		System.out.println(":: 3. updateProduct(UPDATE)  ? ");
		System.out.println(":: "+ sqlSession.update("ProductMapper01.updateProduct",product)+"\n");
		
		System.out.println(":: 4. 수정 결과  ? ");
		System.out.println(":: "+ sqlSession.selectOne("ProductMapper01.findProduct",10032)+"\n");
		
		
		Search search = new Search();
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		System.out.println(":: 5. getProductList(정렬기준 X)  ? ");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		System.out.println(":: 6. getProductList(정렬기준 판매중 상품만 보기)  ? ");
		search.setOrderCondition("0");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		System.out.println(":: 6. getProductList(정렬기준 배송중 상품만 보기)  ? ");
		search.setOrderCondition("1");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));

		System.out.println(":: 7. getProductList(정렬기준 가격 높은순)  ? ");
		search.setOrderCondition("2");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		System.out.println(":: 8. getProductList(정렬기준 가격 낮은순)  ? ");
		search.setOrderCondition("3");
		SqlSessionFactoryBean.printList(sqlSession.selectList("ProductMapper01.getProductList",search));
		
		
		//END::SqlSession  close
		System.out.println("::END::SqlSession 닫기..");
		sqlSession.close();
		
	}//end of main
}//end of class