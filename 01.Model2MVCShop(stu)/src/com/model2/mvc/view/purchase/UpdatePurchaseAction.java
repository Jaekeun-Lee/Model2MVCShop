package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public class UpdatePurchaseAction extends Action {

	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		PurchaseVO purchaseVO = new PurchaseVO();
		purchaseVO.setPaymentOption(req.getParameter("paymentOption"));
		purchaseVO.setReceiverName(req.getParameter("receiverName"));
		purchaseVO.setReceiverPhone(req.getParameter("receiverPhone"));
		purchaseVO.setDivyAddr(req.getParameter("receiverAddr"));
		purchaseVO.setDivyRequest(req.getParameter("receiverRequest"));
		purchaseVO.setDivyDate(req.getParameter("divyDate"));
		purchaseVO.setTranNo(Integer.parseInt(req.getParameter("tranNo")));

		PurchaseService service = new PurchaseServiceImpl();
		service.updatePurchase(purchaseVO);

		return "forward:/getPurchase.do?tranNo=" + req.getParameter("tranNo");

	}
}
