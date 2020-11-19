package com.model2.mvc.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;


public class UpdateUserViewAction extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userId=request.getParameter("userId");
		
		UserService service=new UserServiceImpl();
		User user=service.getUser(userId);
		
		request.setAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}
}