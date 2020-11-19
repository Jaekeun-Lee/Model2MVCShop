package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.service.product.dao.ProductDAO;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.dao.PurchaseDAO;
import com.model2.mvc.service.purchase.vo.PurchaseVO;

public class PurchaseServiceImpl implements PurchaseService {

	ProductDAO productDAO;
	PurchaseDAO purchaseDAO;
	
	public PurchaseServiceImpl() {
		purchaseDAO = new PurchaseDAO();
	}

	@Override
	public void addPurchase(PurchaseVO purchaseVO) throws Exception {
		purchaseDAO.insertPurchase(purchaseVO);
	}

	@Override
	public PurchaseVO getPurchase(int tranNo) throws Exception {
		return purchaseDAO.findPurchase(tranNo);
	}

	@Override
	public PurchaseVO getPurchase2(int prodNo) throws Exception {
		return purchaseDAO.findPurchase2(prodNo);
	}

	@Override
	public HashMap<String, Object> getPurchaseList(SearchVO searchVO, String buyerId) throws Exception {
		return purchaseDAO.getPurchaseList(searchVO, buyerId);
	}

	@Override
	public HashMap<String, Object> getSaleList(SearchVO searchVO) throws Exception {
		return purchaseDAO.getSaleList(searchVO);
	}

	@Override
	public void updatePurchase(PurchaseVO purchaseVO) throws Exception {
		purchaseDAO.updatePurchase(purchaseVO);
	}

	@Override
	public void updateTranCode(PurchaseVO purchaseVO) throws Exception {
		purchaseDAO.updateTranCode(purchaseVO);
	}

}
