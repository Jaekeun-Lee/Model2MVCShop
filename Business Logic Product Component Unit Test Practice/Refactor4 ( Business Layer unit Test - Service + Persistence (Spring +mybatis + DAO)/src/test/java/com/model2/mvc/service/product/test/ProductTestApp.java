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

		// ==> Bean/IoC Container �� ���� ȹ���� UserService �ν��Ͻ� ȹ��
		ProductService productService = (ProductService) context.getBean("productServiceImpl");

		System.out.println("\n");

		// ==> Test �� Product instance ����
		Product product = new Product("3�� �׽�Ʈ ��", "3�� �׽�Ʈ �� ������", "20201114", 33333, "3���׽�Ʈ�ۻ���", "0");
		System.out.println(product);

		// System.out.println(":: 1. addProduct(INSERT) ? ");
		// System.out.println(":: " + productDao.addProduct(product));

		System.out.println(":: 2. findProduct(SELECT)  ? ");
		product.setProdNo(10032);
		System.out.println(":: " + productService.getProduct(product.getProdNo()) + "\n");

		product.setProdName("3���׽�Ʈ�� �����׽�Ʈ");
		System.out.println(":: 3. updateProduct(UPDATE)  ? ");
		System.out.println(":: " + productService.updateProduct(product) + "\n");

		System.out.println(":: 4. ���� ���  ? ");
		System.out.println(":: " + productService.getProduct(product.getProdNo()) + "\n");

		Search search = new Search();
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		System.out.println(":: 5. getProductList(���ı��� X)  ? ");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 6. getProductList(���ı��� �Ǹ��� ��ǰ�� ����)  ? ");
		search.setOrderCondition("0");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 7. getProductList(���ı��� ����� ��ǰ�� ����)  ? ");
		search.setOrderCondition("1");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 8. getProductList(���ı��� ���� ������)  ? ");
		search.setOrderCondition("2");
		System.out.println(":: " + productService.getProductList(search));

		System.out.println(":: 9. getProductList(���ı��� ���� ������)  ? ");
		search.setOrderCondition("3");
		System.out.println(":: " + productService.getProductList(search));


	}// end of main
}// end of class