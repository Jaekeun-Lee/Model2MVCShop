package com.model2.mvc.view.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;


public class LogoutAction extends Action {

	@Override
	public String execute(	HttpServletRequest request,
												HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			c.setMaxAge(0);
			response.addCookie(c);
			System.out.println(c.getName()+"이름의 쿠키삭제");
		}
		
		return "redirect:/index.jsp";
	}
}