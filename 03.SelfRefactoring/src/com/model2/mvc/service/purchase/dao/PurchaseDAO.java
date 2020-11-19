package com.model2.mvc.service.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.dao.ProductDAO;
import com.model2.mvc.service.user.dao.UserDao;

public class PurchaseDAO {

	public PurchaseDAO() {
	}

	public void insertPurchase(Purchase purchase) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "INSERT INTO transaction VALUES (seq_transaction_tran_no.nextval,?,?,?,?,?,?,?,1,SYSDATE,?)";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, purchase.getPurchaseProd().getProdNo());
		stmt.setString(2, purchase.getBuyer().getUserId());
		stmt.setString(3, purchase.getPaymentOption());
		stmt.setString(4, purchase.getReceiverName());
		stmt.setString(5, purchase.getReceiverPhone());
		stmt.setString(6, purchase.getDivyAddr());
		stmt.setString(7, purchase.getDivyRequest());
		stmt.setString(8, purchase.getDivyDate());

		stmt.executeUpdate();

		System.out.println("거래 등록 완료");
		con.close();
	}

	public Purchase findPurchase(int tranNo) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "SELECT * FROM transaction WHERE tran_no = ?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, tranNo);

		ResultSet rs = stmt.executeQuery();

		rs.next();
		Purchase purchase = new Purchase();
		purchase.setTranNo(rs.getInt("tran_no"));
		purchase.setPurchaseProd(new ProductDAO().findProduct(rs.getInt("prod_no")));
		purchase.setBuyer(new UserDao().findUser(rs.getString("buyer_id")));
		purchase.setPaymentOption(rs.getString("payment_option").trim());
		purchase.setReceiverName(rs.getString("receiver_name"));
		purchase.setReceiverPhone(rs.getString("receiver_phone"));
		purchase.setDivyAddr(rs.getString("demailaddr"));
		purchase.setDivyRequest(rs.getString("dlvy_request"));
		purchase.setTranCode(rs.getString("tran_status_code").trim());
		purchase.setOrderDate(rs.getDate("order_data"));
		purchase.setDivyDate(rs.getString("dlvy_date"));

		System.out.println("db에서 가져온 데이터 : " + purchase);

		return purchase;
	}

	public Purchase findPurchase2(int prodNo) throws Exception {

		Connection con = DBUtil.getConnection();

		String sql = "SELECT tran_no, tran_status_code FROM transaction WHERE prod_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, prodNo);

		System.out.println("수정할 상품번호 " + prodNo);
		ResultSet rs = stmt.executeQuery();

		rs.next();
		
		Purchase purchase = new Purchase();
		purchase.setTranNo(rs.getInt("tran_No"));
		purchase.setTranCode(rs.getString("tran_status_code"));
		
		System.out.println("전달받은 "+prodNo+"에대한 tranCode 검색완료");
		
		con.close();

		return purchase;
	}

	public HashMap<String, Object> getSaleList(Search search) throws Exception {

		Connection con = DBUtil.getConnection();

		PreparedStatement stmt = con.prepareStatement("SELECT * FROM transaction", ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_UPDATABLE);

		ResultSet rs = stmt.executeQuery();

		rs.last();
		int total = rs.getRow();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", new Integer(total));

		rs.absolute(search.getCurrentPage() * search.getPageSize() - search.getPageSize() + 1);
		List<Purchase> list = new ArrayList<Purchase>();

		if (total > 0) {
			for (int i = 0; i < search.getPageSize(); i++) {
				Purchase vo = new Purchase();

				vo.setTranNo(rs.getInt("tran_no"));
				vo.setBuyer(new UserDao().findUser(rs.getString("buyer_id")));
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

	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {

		System.out.println("db진입");
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

		int searchRowStart = search.getCurrentPage() * search.getPageSize() - search.getPageSize() + 1;
		System.out.println("searchVO.getPageUnit() : " + search.getPageSize());

		int searchRowEnd = searchRowStart + search.getPageSize() - 1;
		System.out.println("searchRowStart : " + searchRowStart);
		System.out.println("searchRowEnd : " + searchRowEnd);

		stmt.setString(1, buyerId);
		stmt.setInt(2, searchRowStart);
		stmt.setInt(3, searchRowEnd);

		ResultSet rs = stmt.executeQuery();

		Map<String, Object> map = new HashMap<String, Object>();
		if (rs.next()) {
			System.out.println("결과집합있");
		} else {
			System.out.println("없");
			map.put("totalCount", new Integer(0));
			return map;
		}

		int total = rs.getInt("count");
		System.out.println("총 갯수 :" + total);

		map.put("totalCount", new Integer(total));
		int max = search.getPageSize();
		List<Purchase> list = new ArrayList<Purchase>();
		if (total > 0) {
			if (total < max) {
				max = total;
			} else {
				total = max;
			}
			rs.first();
			for (int i = 0; i < total; i++) {
				Purchase vo = new Purchase();
				vo.setTranNo(rs.getInt("tran_no"));
				vo.setBuyer(new UserDao().findUser(rs.getString("user_id")));
				vo.setTranCode(rs.getString("tran_code").trim());
				System.out.println((i + 1) + "번째" + vo);
				list.add(vo);
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

	public void updatePurchase(Purchase purchase) throws Exception {
		Connection con = DBUtil.getConnection();

		StringBuffer tempSQL = new StringBuffer();
		tempSQL.append("UPDATE transaction SET payment_option=?, ");
		tempSQL.append("receiver_name=?,receiver_phone=?,");
		tempSQL.append("demailAddr=?,dlvy_request=?,");
		tempSQL.append("dlvy_date=? WHERE tran_no=?");
		PreparedStatement stmt = con.prepareStatement(tempSQL.toString());

		System.out.println("update Query = " + tempSQL);
		stmt.setString(1, purchase.getPaymentOption());
		stmt.setString(2, purchase.getReceiverName());
		stmt.setString(3, purchase.getReceiverPhone());
		stmt.setString(4, purchase.getDivyAddr());
		stmt.setString(5, purchase.getDivyRequest());
		stmt.setString(6, purchase.getDivyDate());
		stmt.setInt(7, purchase.getTranNo());

		stmt.executeUpdate();

		System.out.println("DB 수정 완료");

		con.close();
	}

	public void updateTranCode(Purchase purchase) throws Exception {
		Connection con = DBUtil.getConnection();

		String sql = "UPDATE transaction SET tran_status_code=? WHERE tran_no=?";

		PreparedStatement stmt = con.prepareStatement(sql);

		stmt.setString(1, purchase.getTranCode());
		stmt.setInt(2, purchase.getTranNo());

		System.out.println("변환한 배송상태 번호 : " + purchase.getTranCode());

		stmt.executeUpdate();

		con.close();

	}

}
