package com.model2.mvc.service.home;

import java.util.List;

import com.model2.mvc.service.domain.Home;

public interface HomeDao {
	
	// 데이터 베이스와 직접적인 통신을 담당하는 퍼시스턴스 계층을 담당할 인터페이스

	public int addMainImage(Home home) throws Exception;

	public List<Object> getMainImageList(int num) throws Exception;

}
