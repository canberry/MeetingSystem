package com.lxm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.bean.User;
import com.lxm.service.UserService;
import com.lxm.util.Const;

@Controller
@RequestMapping("/user")
public class UserController {
	
	public static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(User user, HttpServletRequest request) {
		logger.info("before login user: " + user);
		if (userService.login(user)) { // success
			User u = userService.queryByUserExample(user);
			request.getSession().setAttribute("user", u);
			logger.info("after login u: " + u);
			String authority = u.getUserRole();
			if(authority.equals(Const.AUTHORITY_ORDINARY)) { // ordinary
				logger.info("want to index.jsp");
				
				return "ordinary ok";
			} else if (authority.equals(Const.AUTHORITY_ORDINARY)) { // admin
				logger.info("want to admin_index.jsp");
				return "admin ok";
			}
		} else { // fail to login
			logger.info("fail to login");
			return "fail";
		}
		
		return "fail";
	}
}
