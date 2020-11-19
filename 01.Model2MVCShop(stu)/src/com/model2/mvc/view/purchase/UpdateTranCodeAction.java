package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public class UpdateTranCodeAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// ����ڰ� ���ɿϷ� ������ ��
		String tranNo = request.getParameter("tranNo");
		String tranCode = request.getParameter("tranCode");

		PurchaseService service = new PurchaseServiceImpl();

		PurchaseVO purchaseVO = service.getPurchase(Integer.parseInt(tranNo));
		purchaseVO.setTranCode(tranCode);
		System.out.println(purchaseVO);
		System.out.println("java�Դϴ� ==> ������Ʈ ����");

		service.updateTranCode(purchaseVO);
		System.out.println(purchaseVO);
		System.out.println("java�Դϴ� ==> ��");

		return "redirect:/listPurchase.do";

	}

}
