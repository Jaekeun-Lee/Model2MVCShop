package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdateTranCodeByProdAction extends Action {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// �����ڰ� ��� ��ư ������ ��
		String prodNo = request.getParameter("prodNo");
		String tranCode = request.getParameter("tranCode");
		
		PurchaseService service = new PurchaseServiceImpl();
		
		Purchase purchase = service.getPurchase2(Integer.parseInt(prodNo));
		purchase.setTranCode(tranCode);
		System.out.println(purchase);
		System.out.println("java�Դϴ� ==> ������Ʈ ����");
		
		
		service.updateTranCode(purchase);
		System.out.println(purchase);
		System.out.println("java�Դϴ� ==> ��");
		

		return "redirect:/listProduct.do?menu=manage";
	}

}
