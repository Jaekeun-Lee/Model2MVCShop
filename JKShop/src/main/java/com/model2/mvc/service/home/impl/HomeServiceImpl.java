package com.model2.mvc.service.home.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Home;
import com.model2.mvc.service.home.HomeDao;
import com.model2.mvc.service.home.HomeService;

@Service("homeServiceImpl")
public class HomeServiceImpl implements HomeService {

	@Autowired
	@Qualifier("homeDaoImpl")
	HomeDao homedao;
	
	public HomeServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addMainImage(Home home) throws Exception {
		return 0;
	}

	@Override
	public List<Object> getMainImageList(int num) throws Exception {
		return homedao.getMainImageList(num);
	}

}
