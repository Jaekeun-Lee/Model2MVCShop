package com.model2.mvc.service.home;

import java.util.List;

import com.model2.mvc.service.domain.Home;

public interface HomeService {

	int addMainImage(Home home) throws Exception;
	
	public List<Object> getMainImageList(int num) throws Exception;

}
