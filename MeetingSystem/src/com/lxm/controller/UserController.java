package com.lxm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lxm.bean.User;
import com.lxm.service.UserService;
import com.lxm.util.Const;
import com.lxm.util.FileUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	private static Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	@ResponseBody
	public String login(User user, HttpServletRequest request) {
		logger.info("before login user: " + user);
		if (userService.login(user)) { // success
			List<User> users = userService.queryByUsersExample(user);
			if (users == null || users.isEmpty() || users.size() != 1) {
				return "fail";
			}
			User u = users.get(0);
			request.getSession().setAttribute("user", u);
			logger.info("after login u: " + u);
			
			String authority = u.getUserRole();
			if (authority.equals(Const.AUTHORITY_ORDINARY)) { // ordinary
				logger.info("want to index.jsp");
				return "ordinary ok";
			} else if (authority.equals(Const.AUTHORITY_ADMIN)) { // admin
				logger.info("want to admin_index.jsp");
				return "admin ok";
			}
		} else { // fail to login
			logger.info("fail to login");
			return "fail";
		}

		return "fail";
	}

	@RequestMapping("/queryUserName")
	@ResponseBody
	public String queryUserName(String userName) {
		User user = new User();
		user.setUserName(userName);
		logger.info("before queryUserName user: " + user);
		List<User> users = userService.queryByUsersExample(user);
		if (users == null || users.isEmpty()) {
			logger.info("username is not existed");
			return "ok";
		} else {
			logger.info("username is not existed. userId: " + users.get(0).getUserId());
			return String.valueOf(users.get(0));
		}
	}

	@RequestMapping("/checkCertCode")
	@ResponseBody
	public String checkCertCode(String inputCode, HttpServletRequest request) {
		String certCode = (String) request.getSession().getAttribute("certCode");
		logger.info("inputCode: " + inputCode + " actual: " + certCode);
		if (!certCode.equals(inputCode)) {
			logger.info("code is not macth");
			return "fail";
		} else {
			logger.info("code is match");
			return "ok";
		}
	}

	@RequestMapping("/register")
	@ResponseBody
	public String register(User user) {
		try {
			userService.addUser(user);
			logger.info("register user success");
			return "ok";
		} catch (Exception e) {
			logger.info("register user fail");
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping("/modifyUser")
	@ResponseBody
	public String modifyUser(User user) {
		logger.info("before modify user: " + user);
		try {
			userService.modifyUser(user);
			logger.info("modify user success");
			return "ok";
		} catch (Exception e) {
			logger.info("modify user fail");
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "/jump";
	}
	
	@RequestMapping("/changeUserSession")
	public String changeUserSession(int userId, HttpServletRequest request) {
		User user = userService.queryByUserId(userId);
		logger.info("user session: " + user);
		request.getSession().setAttribute("user", user);
		return "/query_myuserinfo";
	}
	
	@RequestMapping(value="/uploadAvatar", method=RequestMethod.POST)
	public String uploadAvatar(@RequestParam("file")MultipartFile file, HttpServletRequest request) {
		String saveFilePath = "upload/avatar/";
		String imgPath = FileUtil.saveFile(file, saveFilePath, request);
		logger.info("imgPath: " + imgPath);
		
		User u = (User) request.getSession().getAttribute("user");
		User user = new User(u);
		user.setAvatar(imgPath);
		
		logger.info("before avatar modify user: " + u);
		userService.modifyUser(user);
		FileUtil.deleteFile(u.getAvatar(), request);
		logger.info("avatar modify user success");
		
		return "redirect:/user/changeUserSession?userId=" + user.getUserId(); // change session
	}
}
