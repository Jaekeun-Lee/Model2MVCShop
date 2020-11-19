package com.model2.mvc.service.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.model2.mvc.common.SearchVO;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.product.vo.ProductVO;

public class ProductDAO {

	public ProductDAO() {
	}

	public void insertProduct(ProductVO productVO) throws Exception {
		
		Connection con = DBUtil.getConnection();
		
		String sql = "INSERT INTO product VALUES (seq_product_prod_no.nextval,?,?,?,?,?,SYSDATE)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		
		stmt.setString(1, productVO.getProdName());
		stmt.setString(2, productVO.getProdDetail());
		stmt.setString(3, productVO.getManuDate());
		stmt.setInt(4, productVO.getPrice());
		stmt.setString(5, productVO.getFileName());
		
		stmt.executeUpdate();
		
		//System.out.println("상품 추가 완료");
		con.close();
	}

	public ProductVO findProduct(int prodNo) throws Exception {
		
		Connection con = DBUtil.getConnection();
		
		String sql = "SELECT * FROM product WHERE prod_no = ?";
		
		PreparedStatement stmt = con.prepareStatement(sql);		
		stmt.setInt(1, prodNo);

		ResultSet rs = stmt.executeQuery();
		
		ProductVO productVO = null;
		while(rs.next()) {
			
			productVO = new ProductVO();
			
			productVO.setProdNo(rs.getInt("PROD_NO"));
			productVO.setProdName(rs.getString("PROD_NAME"));
			productVO.setProdDetail(rs.getString("PROD_DETAIL"));
			productVO.setManuDate(rs.getString("MANUFACTURE_DAY"));
			productVO.setPrice(rs.getInt("PRICE"));
			productVO.setFileName(rs.getString("IMAGE_FILE"));
			productVO.setRegDate(rs.getDate("REG_DATE"));
			
		}
		
		con.close();
		
		return productVO;
	}
	
	public HashMap<String, Object> getProductList(SearchVO searchVO) throws Exception {
		
		Connection con = DBUtil.getConnection();
		StringBuilder tempSQL = new StringBuilder();
		tempSQL.append("SELECT ptj.rn, pd.prod_no, pd.prod_name, pd.price, pd.reg_date, NVL(ts.tran_status_code,0) tran_code, ptj.count ");
		tempSQL.append("FROM product pd, transaction ts, (SELECT prod_no, ROWNUM rn, COUNT(*)OVER() count FROM product) ptj ");
		tempSQL.append("WHERE ptj.prod_no = pd.prod_no AND pd.prod_no=ts.prod_no(+) AND ptj.rn BETWEEN ? AND ? ");
		
		if (searchVO.getSearchCondition() != null) {
			switch(searchVO.getSearchCondition()) {
			
				case "0" :
					tempSQL.append(" AND prod_no='");
					tempSQL.append(searchVO.getSearchKeyword());
					tempSQL.append("'");
					
					break;
					
				case "1" :
					tempSQL.append(" AND pd.prod_name LIKE '%");
					tempSQL.append(searchVO.getSearchKeyword());
					tempSQL.append("%'");
					
					break;
					
				case "2" :
					tempSQL.append(" AND pd.price=");
					tempSQL.append(searchVO.getSearchKeyword());
					
					break;
			}
		}
		tempSQL.append(" ORDER BY 1 DESC");
		
		// 1. ResultSet.TYPE_SCROLL_INSENSITIVE
		// rs.last()를 사용하면 이전행들은 사용할 수 없게 된다.
		// ResultSet.TYPE_SCROLL_INSENSITIVE 사용 시 지나간 행들 다시 사용가능
		// 커서 이동을 자유롭게 하고 스크롤은 가능하지만 변경된 사항은 적용되지 않는다.
		
		// 2. ResultSet.CONCUR_UPDATABLE
		// 데이터 변경이 가능하도록 한다.
		
		

		PreparedStatement stmt = con.prepareStatement(	tempSQL.toString(),
														ResultSet.TYPE_SCROLL_INSENSITIVE,
														ResultSet.CONCUR_UPDATABLE);
		
		int searchRowStart = searchVO.getPage() * searchVO.getPageUnit() - searchVO.getPageUnit()+1;
		System.out.println("searchVO.getPageUnit() : "+searchVO.getPageUnit());
		
		int searchRowEnd = searchRowStart + searchVO.getPageUnit()-1;
		System.out.println("searchRowStart : " + searchRowStart);
		System.out.println("searchRowEnd : " + searchRowEnd);
		
		stmt.setInt(1, searchRowStart);
		stmt.setInt(2, searchRowEnd);
		
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			System.out.println("결과집합있");
		} else {
			System.out.println("없");
		}

		int total = rs.getInt("count");
		System.out.println("총 갯수 :" + total);

		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("count", new Integer(total));
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		if (total > 0) {
			for (int i = 0; i < searchVO.getPageUnit(); i++) {
				ProductVO vo = new ProductVO();
				vo.setProdNo(rs.getInt("prod_no"));
				vo.setProdName(rs.getString("prod_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setRegDate(rs.getDate("reg_date"));
				vo.setProTranCode(rs.getString("tran_code").trim());
				
				list.add(vo);
				if(!rs.next()) {
					break;
				}
			}
		}
		
		System.out.println("list.size() : "+ list.size());
		map.put("list", list);
		System.out.println("map().size() : "+ map.size());

		con.close();
			
		return map;
		
	}
	
	public void updateProduct(ProductVO productVO) throws Exception {
		
		Connection con = DBUtil.getConnection();

		String sql = "UPDATE product SET prod_name=?,prod_detail=?,price=?,manufacture_day=?, image_file =? where prod_no=?";
		PreparedStatement stmt = con.prepareStatement(sql);
		
		stmt.setString(1, productVO.getProdName());
		stmt.setString(2, productVO.getProdDetail());
		stmt.setInt(3, productVO.getPrice());
		stmt.setString(4, productVO.getManuDate());
		stmt.setString(5, productVO.getFileName());
		stmt.setInt(6, productVO.getProdNo());
		stmt.executeUpdate();
		
		System.out.println("DB에 업데이트 : "+productVO);
		con.close();
		
	}
}
