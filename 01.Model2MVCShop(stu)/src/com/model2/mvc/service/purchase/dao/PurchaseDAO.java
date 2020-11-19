package com.model2.mvc.service.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.product.dao.ProductDAO;
import com.model2.mvc.service.product.vo.ProductVO;
import com.model2.mvc.service.purchase.vo.PurchaseVO;
import com.model2.mvc.service.user.dao.UserDAO;

public class PurchaseDAO {

	public PurchaseDAO() {
	}

	public void insertPurchase(PurchaseVO purchaseVO) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "INSERT INTO transaction VALUES (seq_transaction_tran_no.nextval,?,?,?,?,?,?,?,1,SYSDATE,?)";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, purchaseVO.getPurchaseProd().getProdNo());
		stmt.setString(2, purchaseVO.getBuyer().getUserId());
		stmt.setString(3, purchaseVO.getPaymentOption());
		stmt.setString(4, purchaseVO.getReceiverName());
		stmt.setString(5, purchaseVO.getReceiverPhone());
		stmt.setString(6, purchaseVO.getDivyAddr());
		stmt.setString(7, purchaseVO.getDivyRequest());
		stmt.setString(8, purchaseVO.getDivyDate());

		stmt.executeUpdate();

		System.out.println("거래 등록 완료");
		con.close();
	}

	public PurchaseVO findPurchase(int tranNo) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "SELECT * FROM transaction WHERE tran_no = ?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, tranNo);

		ResultSet rs = stmt.executeQuery();

		rs.next();
		PurchaseVO purchaseVO = new PurchaseVO();
		purchaseVO.setTranNo(rs.getInt("tran_no"));
		purchaseVO.setPurchaseProd(new ProductDAO().findProduct(rs.getInt("prod_no")));
		purchaseVO.setBuyer(new UserDAO().findUser(rs.getString("buyer_id")));
		purchaseVO.setPaymentOption(rs.getString("payment_option").trim());
		purchaseVO.setReceiverName(rs.getString("receiver_name"));
		purchaseVO.setReceiverPhone(rs.getString("receiver_phone"));
		purchaseVO.setDivyAddr(rs.getString("demailaddr"));
		purchaseVO.setDivyRequest(rs.getString("dlvy_request"));
		purchaseVO.setTranCode(rs.getString("tran_status_code").trim());
		purchaseVO.setOrderDate(rs.getDate("order_data"));
		purchaseVO.setDivyDate(rs.getString("dlvy_date"));

		System.out.println("db에서 가져온 데이터 : " + purchaseVO);

		return purchaseVO;
	}

	public PurchaseVO findPurchase2(int prodNo) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "SELECT tran_no, tran_status_code FROM transaction WHERE prod_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, prodNo);

		System.out.println("수정할 상품번호 " + prodNo);
		ResultSet rs = stmt.executeQuery();

		rs.next();
		
		PurchaseVO purchaseVO = new PurchaseVO();
		purchaseVO.setTranNo(rs.getInt("tran_No"));
		purchaseVO.setTranCode(rs.getString("tran_status_code"));
		
		System.out.println("전달받은 "+prodNo+"에대한 tranCode 검색완료");
		
		con.close();

		return purchaseVO;
	}

	public HashMap<String, Object> getSaleList(SearchVO searchVO) throws Exception {

		Connection con = DBUtil.getConnection();

		PreparedStatement stmt = con.prepareStatement("SELECT * FROM transaction", ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);

		ResultSet rs = stmt.executeQuery();

		rs.last();
		int total = rs.getRow();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", new Integer(total));

		rs.absolute(searchVO.getPage() * searchVO.getPageUnit() - searchVO.getPageUnit() + 1);
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();

		if (total > 0) {
			for (int i = 0; i < searchVO.getPageUnit(); i++) {
				PurchaseVO vo = new PurchaseVO();

				vo.setTranNo(rs.getInt("tran_no"));
				vo.setBuyer(new UserDAO().findUser(rs.getString("buyer_id")));
				vo.setDivyAddr(rs.getString("demailaddr"));
				vo.setDivyDate(rs.getString("dlvy_date"));
				vo.setDivyRequest(rs.getString("dlvy_request"));
				vo.setOrderDate(rs.getDate("order_date"));
				vo.setPaymentOption(rs.getString("payment_option"));
				vo.setPurchaseProd(new ProductDAO().findProduct(rs.getInt("prod_no")));
				vo.setReceiverName(rs.getString("receiver_name"));
				vo.setReceiverPhone(rs.getString("receiver_phone"));
				vo.setTranCode(rs.getString("tran_status_code"));

				list.add(vo);

				if (!rs.next())
					break;
			}
		}

		map.put("list", list);
		con.close();

		return map;
	}

	public HashMap<String, Object> getPurchaseList(SearchVO searchVO, String buyerId) throws Exception {

		Connection con = DBUtil.getConnection();
		StringBuilder tempSQL = new StringBuilder();
		tempSQL.append("SELECT purchase.* ");
		tempSQL.append("FROM(SELECT ROW_NUMBER() OVER(order by user_id) rn , ");
		tempSQL.append("ts.tran_no, u.user_id, NVL(ts.tran_status_code,0) tran_code, COUNT(*)OVER() count ");
		tempSQL.append("FROM users u, transaction ts ");
		tempSQL.append("WHERE u.user_id = ts.buyer_id AND u.user_id = ? )purchase ");
		tempSQL.append("WHERE rn BETWEEN ? AND ? ");

		PreparedStatement stmt = con.prepareStatement(tempSQL.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);

		int searchRowStart = searchVO.getPage() * searchVO.getPageUnit() - searchVO.getPageUnit() + 1;
		System.out.println("searchVO.getPageUnit() : " + searchVO.getPageUnit());

		int searchRowEnd = searchRowStart + searchVO.getPageUnit() - 1;
		System.out.println("searchRowStart : " + searchRowStart);
		System.out.println("searchRowEnd : " + searchRowEnd);

		stmt.setString(1, buyerId);
		stmt.setInt(2, searchRowStart);
		stmt.setInt(3, searchRowEnd);

		ResultSet rs = stmt.executeQuery();

		HashMap<String, Object> map = new HashMap<String, Object>();
		if (rs.next()) {
			System.out.println("결과집합있");
		} else {
			System.out.println("없");
			map.put("count", new Integer(0));
			return map;
		}

		int total = rs.getInt("count");
		System.out.println("총 갯수 :" + total);

		map.put("count", new Integer(total));
		int max = searchVO.getPageUnit();
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		if (total > 0) {
			if (total < max) {
				max = total;
			} else {
				total = max;
			}
			rs.first();
			System.out.println("for문 회전 횟수:" + total);
			for (int i = 0; i < total; i++) {
				System.out.println((i + 1) + "번째");
				PurchaseVO vo = new PurchaseVO();
				vo.setTranNo(rs.getInt("tran_no"));
				vo.setBuyer(new UserDAO().findUser(rs.getString("user_id")));
				vo.setTranCode(rs.getString("tran_code").trim());
				System.out.println(vo);
				list.add(vo);
				System.out.println("리스트 추가 " + (i + 1) + "개");
				if (!rs.next()) {
					break;
				}
			}
		}

		System.out.println("list.size() : " + list.size());
		map.put("list", list);
		System.out.println("map().size() : " + map.size());

		con.close();

		return map;
	}

	public void updatePurchase(PurchaseVO purchaseVO) throws Exception {
		Connection con = DBUtil.getConnection();

		StringBuffer tempSQL = new StringBuffer();
		tempSQL.append("UPDATE transaction SET payment_option=?, ");
		tempSQL.append("receiver_name=?,receiver_phone=?,");
		tempSQL.append("demailAddr=?,dlvy_request=?,");
		tempSQL.append("dlvy_date=? WHERE tran_no=?");
		PreparedStatement stmt = con.prepareStatement(tempSQL.toString());

		System.out.println("update Query = " + tempSQL);
		stmt.setString(1, purchaseVO.getPaymentOption());
		stmt.setString(2, purchaseVO.getReceiverName());
		stmt.setString(3, purchaseVO.getReceiverPhone());
		stmt.setString(4, purchaseVO.getDivyAddr());
		stmt.setString(5, purchaseVO.getDivyRequest());
		stmt.setString(6, purchaseVO.getDivyDate());
		stmt.setInt(7, purchaseVO.getTranNo());

		stmt.executeUpdate();

		System.out.println("DB 수정 완료");

		con.close();
	}

	public void updateTranCode(PurchaseVO purchaseVO) throws Exception {
		Connection con = DBUtil.getConnection();

		String sql = "UPDATE transaction SET tran_status_code=? WHERE tran_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);

		stmt.setString(1, purchaseVO.getTranCode());
		stmt.setInt(2, purchaseVO.getTranNo());

		System.out.println("변환한 배송상태 번호 : " + purchaseVO.getTranCode());

		stmt.executeUpdate();

		con.close();

	}

}
