package com.model2.mvc.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;


public class LoginAction extends Action{

	@Override
	public String execute(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		User user=new User();
		user.setUserId(request.getParameter("userId"));
		user.setPassword(request.getParameter("password"));
		
		UserService userService=new UserServiceImpl();
		User dbUser=userService.loginUser(user);
		
		HttpSession session=request.getSession();
		session.setAttribute("user", dbUser);
		
		return "redirect:/index.jsp";
	}
}