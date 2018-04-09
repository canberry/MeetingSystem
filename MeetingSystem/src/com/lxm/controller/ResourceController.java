package com.lxm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxm.bean.Resource;
import com.lxm.service.ResourceService;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	
	private static Logger logger = Logger.getLogger(ResourceController.class);
	
	@Autowired
	ResourceService resourceService;
	
	@RequestMapping("/queryAvailableResources")
	public String queryAvailableResources(HttpServletRequest request) {
		List<Resource> resources = resourceService.queryAvailableResources();
		logger.info("resources: " + resources);
		
		request.setAttribute("resources", resources);
		return "/add_meeting";
	}
}
