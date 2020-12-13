package com.model2.mvc.service.home.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Home;
import com.model2.mvc.service.home.HomeDao;

@Repository("homeDaoImpl")
public class HomeDaoImpl implements HomeDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public HomeDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addMainImage(Home home) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Object> getMainImageList(int num) throws Exception {
		return sqlSession.selectList("homeMapper.getMainImageList", num);
	}

}
