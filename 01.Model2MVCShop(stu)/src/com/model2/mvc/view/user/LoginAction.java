package com.model2.mvc.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;
import com.model2.mvc.service.user.vo.UserVO;


public class LoginAction extends Action{

	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		UserVO userVO=new UserVO();
		userVO.setUserId(request.getParameter("userId"));
		userVO.setPassword(request.getParameter("password"));
		
		UserService service=new UserServiceImpl();
		UserVO dbVO=service.loginUser(userVO);
		
		HttpSession session=request.getSession();
		session.setAttribute("user", dbVO);
		
		return "redirect:/index.jsp";
	}
}