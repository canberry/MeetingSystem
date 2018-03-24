package com.lxm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxm.bean.User;
import com.lxm.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request) {
		System.out.println(user.getName() + " " + user.getPassword());
		if (userService.login(user)) {
			request.setAttribute("user", user);
			return "/ok";
		}
		
		return "/index";
	}
}
