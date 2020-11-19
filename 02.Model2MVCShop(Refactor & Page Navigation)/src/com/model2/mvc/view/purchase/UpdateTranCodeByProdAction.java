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

		// 관리자가 배송 버튼 눌렀을 때
		String prodNo = request.getParameter("prodNo");
		String tranCode = request.getParameter("tranCode");
		
		PurchaseService service = new PurchaseServiceImpl();
		
		Purchase purchase = service.getPurchase2(Integer.parseInt(prodNo));
		purchase.setTranCode(tranCode);
		System.out.println(purchase);
		System.out.println("java입니다 ==> 업데이트 시작");
		
		
		service.updateTranCode(purchase);
		System.out.println(purchase);
		System.out.println("java입니다 ==> 끝");
		

		return "redirect:/listProduct.do?menu=manage";
	}

}
