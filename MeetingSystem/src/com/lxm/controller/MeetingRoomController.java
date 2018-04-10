package com.lxm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.bean.MeetingRoom;
import com.lxm.service.MeetingRoomService;
import com.lxm.util.Const;

@Controller
@RequestMapping("/meetingRoom")
public class MeetingRoomController {
	private static Logger logger = Logger.getLogger(MeetingRoomController.class);

	@Autowired
	MeetingRoomService meetingRoomService;

	@RequestMapping("/queryMeetingRoom")
	public String queryMeetingRoom(MeetingRoom meetingRoom,
			HttpServletRequest request) {
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);

		logger.info("meeting room example: " + meetingRoom);
		List<MeetingRoom> meetingRooms = meetingRoomService
				.paginateMeetingRoomsByExample(meetingRoom, pageIndex, pageSize);
		logger.info("query meetingrooms: " + meetingRooms);
		int totalPages = meetingRoomService.totalPages(meetingRoom, pageSize);

		request.setAttribute("meetingRooms", meetingRooms);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("meetingRoom", meetingRoom);
		return "/query_meetingroom";
	}

	@RequestMapping("/queryMeetingRoomsToScheduled")
	public void queryMeetingRoomsToScheduled(String startTime, String endTime,
			int cap, HttpServletResponse response) throws IOException {
		logger.info("startTime: " + startTime + " endTime: " + endTime + " expect capacity: " + cap);
		List<MeetingRoom> meetingRooms = meetingRoomService
				.queryMeetingRoomsToScheduled(startTime, endTime, cap);
		logger.info("meetingrooms size: " + meetingRooms.size());
		logger.info("meetingrooms: " + meetingRooms);

		JSONArray datas = JSONArray.fromObject(meetingRooms);
		response.setCharacterEncoding(Const.ENCODING_UTF8);
		response.getWriter().print(datas.toString());
	}
	
	@RequestMapping("/queryMeetingRoomsToScheduledWithouMid")
	public void queryMeetingRoomsToScheduledWithouMid(int mId, String startTime, String endTime,
			int cap, HttpServletResponse response) throws IOException {
		logger.info("mId: " + mId + " startTime: " + startTime + " endTime: " + endTime + " expect capacity: " + cap);
		List<MeetingRoom> meetingRooms = meetingRoomService
				.queryMeetingRoomsToScheduledWithouMid(mId, startTime, endTime, cap);
		logger.info("meetingrooms size: " + meetingRooms.size());
		logger.info("meetingrooms: " + meetingRooms);

		JSONArray datas = JSONArray.fromObject(meetingRooms);
		response.setCharacterEncoding(Const.ENCODING_UTF8);
		response.getWriter().print(datas.toString());
	}
}
