package com.model2.mvc.service.user.impl;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.dao.UserDAO;


public class UserServiceImpl implements UserService{
	
	///Field
	private UserDAO userDAO;
	
	///Constructor
	public UserServiceImpl() {
		this.userDAO=new UserDAO();
	}

	///Method
	public User addUser(User userVO) throws Exception {
		try {
			userDAO.insertUser(userVO);
		} catch (Exception e) {
			throw e;
		}
		return userVO;
	}

	public User loginUser(User userVO) throws Exception {
		try {
			User dbUser=userDAO.findUser( userVO.getUserId() );
			
			if(! dbUser.getPassword().equals(userVO.getPassword())){
				throw new Exception("로그인에 실패했습니다.");
			}
			return dbUser;
		} catch (Exception e) {
			throw e;
		}
		
	}

	public User getUser(String userId) throws Exception {
		try {
			return userDAO.findUser(userId);
		} catch (Exception e) {
			throw e;
		}
	}

	public Map<String , Object > getUserList(Search searchVO) throws Exception {
		try {
			return userDAO.getUserList(searchVO);
		} catch (Exception e) {
			throw e;
		}
	}

	public User updateUser(User userVO) throws Exception {
		try {
			userDAO.updateUser(userVO);
		} catch (Exception e) {
			throw e;
		}
		return userVO;
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		try {
			User vo=userDAO.findUser(userId);
			if(vo != null) {
				result=false;
			}
		} catch (Exception e) {
			throw e;
		}
		return result;
	}
}