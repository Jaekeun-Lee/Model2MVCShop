package com.model2.mvc.common;


public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private String orderCondition;
	private int endRowNum;
	private int startRowNum;
	
	///Constructor
	public Search() {
	}
	
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int curruntPage) {
		this.currentPage = curruntPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getOrderCondition() {
		return orderCondition;
	}

	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Search [currentPage=");
		builder.append(currentPage);
		builder.append(", searchCondition=");
		builder.append(searchCondition);
		builder.append(", searchKeyword=");
		builder.append(searchKeyword);
		builder.append(", pageSize=");
		builder.append(pageSize);
		builder.append(", orderCondition=");
		builder.append(orderCondition);
		builder.append(", endRowNum=");
		builder.append(endRowNum);
		builder.append(", startRowNum=");
		builder.append(startRowNum);
		builder.append("]");
		return builder.toString();
	}
	

}