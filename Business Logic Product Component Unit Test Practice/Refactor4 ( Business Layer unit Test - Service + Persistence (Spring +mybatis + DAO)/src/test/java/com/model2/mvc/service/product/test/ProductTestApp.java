package com.model2.mvc.service.product.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Search;
import com.model2.mvc.service.product.ProductService;

public class ProductTestApp {

	/// main method
	public static void main(String[] args) throws Exception {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "/config/commonservice.xml", "/config/productservice.xml" });
		System.out.println("\n");

		// ==> Bean/IoC Container 로 부터 획득한 UserService 인스턴스 획득
		ProductService productService = (ProductService) context.getBean("productServiceImpl");

		System.out.println("\n");

		// ==> Test 용 Product instance 생성
		Product product = new Product("3번 테스트 앱", "3번 테스트 앱 디테일", "20201114", 33333, "3번테스트앱사진", "0");
		System.out.println(product);

		// System.out.println(":: 1. addProduct(INSERT) ? ");
		// System.out.println(":: " + productDao.addProduct(product));

		System.out.println(":: 2. findProduct(SELECT)  ? ");
		product.setProdNo(10032);
		System.out.println(":: " + productService.getProduct(product.getProdNo()) + "\n");

		product.setProdName("3번테스트앱 수정테스트");
		System.out.println(":: 3. updateProduct(UPDATE)  ? ");
		System.out.println(":: " + productService.updateProduct(product) + "\n");

		System.out.println(":: 4. 수정 결과  ? ");
		System.out.println(":: " + productService.getProduct(product.getProdNo()) + "\n");

		Search search = new Search();
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		System.out.println(":: 5. getProductList(정렬기준 X)  ? ");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 6. getProductList(정렬기준 판매중 상품만 보기)  ? ");
		search.setOrderCondition("0");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 7. getProductList(정렬기준 배송중 상품만 보기)  ? ");
		search.setOrderCondition("1");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 8. getProductList(정렬기준 가격 높은순)  ? ");
		search.setOrderCondition("2");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 9. getProductList(정렬기준 가격 낮은순)  ? ");
		search.setOrderCondition("3");
		System.out.println(":: " + productService.getProductList(search));


	}// end of main
}// end of class