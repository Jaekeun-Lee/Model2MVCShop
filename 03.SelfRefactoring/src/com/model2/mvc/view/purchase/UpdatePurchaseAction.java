package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdatePurchaseAction extends Action {

	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		Purchase purchase = new Purchase();
		purchase.setPaymentOption(req.getParameter("paymentOption"));
		purchase.setReceiverName(req.getParameter("receiverName"));
		purchase.setReceiverPhone(req.getParameter("receiverPhone"));
		purchase.setDivyAddr(req.getParameter("receiverAddr"));
		purchase.setDivyRequest(req.getParameter("receiverRequest"));
		purchase.setDivyDate(req.getParameter("divyDate"));
		purchase.setTranNo(Integer.parseInt(req.getParameter("tranNo")));

		PurchaseService service = new PurchaseServiceImpl();
		service.updatePurchase(purchase);

		return "forward:/getPurchase.do?tranNo=" + req.getParameter("tranNo");

	}
}
