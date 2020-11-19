package com.model2.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


/*
 * javax.servlet.Fiter  를 구현한  Filter
 * 
 * Servlet Meta-data 인 web.xml 에 아래와 같이 등록
    <filter>
		<filter-name>requestFilter</filter-name>
		<filter-class>com.model2.mvc.common.filter.RequestFilter</filter-class>
	</filter>
	
	<filter-mapping>
		<filter-name>requestFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
*   
*   모든 URI 즉 모든 request 는 필터를 통과하게하여 한글처리 
 */
public class RequestFilter implements Filter{

	public void init(FilterConfig arg0) throws ServletException {
	}
	
	public void doFilter(	ServletRequest request , 
											ServletResponse response , 
											FilterChain filterChain) 
										throws IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		filterChain.doFilter(request, response);
	}

	public void destroy() {
	}

}