package com.model2.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


/*
 * javax.servlet.Fiter  �� ������  Filter
 * 
 * Servlet Meta-data �� web.xml �� �Ʒ��� ���� ���
    <filter>
		<filter-name>requestFilter</filter-name>
		<filter-class>com.model2.mvc.common.filter.RequestFilter</filter-class>
	</filter>
	
	<filter-mapping>
		<filter-name>requestFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
*   
*   ��� URI �� ��� request �� ���͸� ����ϰ��Ͽ� �ѱ�ó�� 
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