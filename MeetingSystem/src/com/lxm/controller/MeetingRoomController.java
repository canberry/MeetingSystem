package com.lxm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxm.bean.MeetingRoom;
import com.lxm.service.MeetingRoomService;

@Controller
@RequestMapping("/meetingRoom")
public class MeetingRoomController {
	private static Logger logger = Logger.getLogger(MeetingRoomController.class);

	@Autowired
	MeetingRoomService meetingRoomService;
	
	@RequestMapping("/queryMeetingRoom")
	public String queryMeetingRoom(MeetingRoom meetingRoom, HttpServletRequest request) {
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);
		
		logger.info("meeting room example: " + meetingRoom);
		List<MeetingRoom> meetingRooms = meetingRoomService.paginateMeetingRoomsByExample(meetingRoom, pageIndex, pageSize);
		logger.info("query meetingrooms: " + meetingRooms);
		int totalPages = meetingRoomService.totalPages(meetingRoom, pageSize);
		
		request.setAttribute("meetingRooms", meetingRooms);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("meetingRoom", meetingRoom);
		return "/query_meetingroom";
	}
}
