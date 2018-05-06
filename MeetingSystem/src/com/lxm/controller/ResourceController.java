package com.lxm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/queryResources")
	public String queryResources(Resource resource, HttpServletRequest request) {
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);

		logger.info("resource example: " + resource);
		List<Resource> resources = resourceService.paginateResourcesByExample(
				resource, pageIndex, pageSize);
		logger.info("query resources: " + resources);
		int totalPages = resourceService.totalPages(resource, pageSize);

		request.setAttribute("resources", resources);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("resource", resource);
		return "/query_resource";
	}

	@RequestMapping("/modifyResource")
	@ResponseBody
	public String modifyResource(Resource resource) {
		logger.info("modify resource: " + resource);
		try {
			resourceService.modifyResource(resource);
			logger.info("modify resource success");

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping("/addResource")
	@ResponseBody
	public String addResource(Resource resource) {
		logger.info("add resource: " + resource);
		try {
			resourceService.addResource(resource);
			logger.info("add resource success");

			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping("/removeResource")
	public String removeResource(int rId) {
		logger.info("rid: " + rId);
		resourceService.removeResource(rId);

		return "redirect:/resource/queryResources";
	}
}
