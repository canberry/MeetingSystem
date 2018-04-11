package com.lxm.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.service.MeetingResourceService;

@Controller
@RequestMapping("/meetingResource")
public class MeetingResourceController {
	private static Logger logger = Logger.getLogger(MeetingResourceController.class);
	
	@Autowired
	MeetingResourceService meetingResourceService;
	
	@RequestMapping("/removeMeetingResourcesByMId")
	@ResponseBody
	public String removeMeetingResourcesByMId(int meetingId) {
		logger.info("meetingId: " + meetingId);
		
		try {
			meetingResourceService.removeMeetingResourcesByMId(meetingId);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
