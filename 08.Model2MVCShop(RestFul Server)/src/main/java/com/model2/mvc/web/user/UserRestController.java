package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping( value="json/update", method=RequestMethod.POST )
	public User update(@RequestBody User user) throws Exception{
		
		System.out.println("/user/json/update : POST");
		
		System.out.println("::"+user);
		userService.updateUser(user);
		
		return userService.getUser(user.getUserId());
		
	}
	
	@RequestMapping( value="json/add", method=RequestMethod.POST )
	public User add(@RequestBody User user) throws Exception {
		System.out.println("/user/json/add : POST");
		
		System.out.println("::"+user);
		userService.addUser(user);

		return userService.getUser(user.getUserId());
	}
	
	@RequestMapping( value="json/list")
	public Map list(@RequestBody Search search) throws Exception {
		
		System.out.println("/user/json/list : POST");
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		return userService.getUserList(search);
	}
	
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
	public Map checkDuplication(@RequestBody User user) throws Exception{
		
		System.out.println("/user/json/checkDuplication : POST");
		System.out.println("RequestBody = "+user);
		boolean result=userService.checkDuplication(user.getUserId());

		Map map = new HashMap();
		map.put("result", result);
		return map;
	}
	
	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.GET )
	public Map checkDuplication(@PathVariable String userId) throws Exception{
		
		System.out.println("/user/json/checkDuplication : GET");
		System.out.println("userId = "+userId);
		boolean result=userService.checkDuplication(userId);

		Map map = new HashMap();
		map.put("result", result);
		return map;
	}
	
	
	
	
	
	
}