package com.model2.mvc.service.product.test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * FileName : SqlSessionFactoryBean.java 
 *  ==>	SqlSession �� �����ϴ� ������ �ڵ�  Module 
 *  ==>	Test �� ���ϰ�(?) �ϱ����� ������ �ڵ� Module 
 */
public class SqlSessionFactoryBean {

	/*
	 * mybatis-config.xml : MyBatis Framework �� �ٽ� MetaData XxxMapper.xml : SQL �� ����
	 * MetaData MetaData ������ ������ ����,��밡���� SqlSession instance �����ϴ� static method
	 */
	public static SqlSession getSqlSession() throws IOException {

		// ==> 1. xml metadata �д� Stream ����
		Reader reader = Resources.getResourceAsReader("sql/mybatis-config.xml");

		// ==> 2. Reader ��ü�� �̿� xml MetaData �� ������ ���� ������ ����, ��밡����
		// ==> SqlSession�� �����ϴ� SqlSessionFactory instance ����
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		// ==>3. SqlSessionFactory �� ���� autoCommit true �� SqlSession instance ����
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		return sqlSession;
	}

	/*
	 * List Collection ��ü�� ����� User ���
	 */
	public static void printList(List<Object> list) {
		for (int i = 0; i < list.size(); i++) {
			System.out.println("<" + (i + 1) + "> ��° ȸ��.." + list.get(i).toString());
		}
		System.out.println("\n");
	}

}// end of class