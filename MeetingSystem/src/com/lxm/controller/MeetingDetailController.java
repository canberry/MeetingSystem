package com.lxm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingRoom;
import com.lxm.bean.User;
import com.lxm.service.MeetingDetailService;
import com.lxm.util.Const;
import com.lxm.util.DateUtil;

@Controller
@RequestMapping("/meetingDetail")
public class MeetingDetailController {
	
	private static Logger logger = Logger.getLogger(MeetingDetailController.class);
	
	@Autowired
	MeetingDetailService meetingDetailService;
	
	@RequestMapping("/queryMeetingDetailToBeHold")
	public String queryMeetingDetailToBeHold(MeetingDetail meetingDetail, Meeting meeting, HttpServletRequest request) {		
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);
		logger.info("pageIndex: " + pageIndex);
		
		getExample(Const.MODE_FUTURE, meetingDetail, meeting, request);
		
		logger.info("meeting detail example: " + meetingDetail);
		List<MeetingDetail> meetingDetails = meetingDetailService.paginateMeetingDetailsByExample(meetingDetail, pageIndex, pageSize);
		logger.info("size: " + meetingDetails.size() + ". query meetingdetails: " + meetingDetails);		
		int totalPages = meetingDetailService.totalPages(meetingDetail, pageSize);
		
		request.setAttribute("meetingDetails", meetingDetails);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("md", meetingDetail);
		return "/query_meeting_tobehold";
	}
	
	@RequestMapping("/queryMeetingDetailAlreadyHold")
	public String queryMeetingDetailAlreadyHold(MeetingDetail meetingDetail, Meeting meeting, HttpServletRequest request) {
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);
		
		String nowTime = getNowTime(Const.DATEFORMAT_HM);
		logger.info("now time: " + nowTime);
		getExample(Const.MODE_HISTORY, meetingDetail, meeting, request);
		if (meeting.getStartTime() != null && meeting.getStartTime() != "") {
			if (meeting.getStartTime().compareTo(nowTime) > 0) {
				meeting.setStartTime(nowTime);
			}
		}
		
		logger.info("meeting detail example: " + meetingDetail);
		List<MeetingDetail> meetingDetails = meetingDetailService.paginateMeetingDetailsBeforeNow(meetingDetail, nowTime, pageIndex, pageSize);
		logger.info("size: " + meetingDetails.size() + ". query meetingdetails: " + meetingDetails);		
		int totalPages = meetingDetailService.totalPagesBeforeNow(meetingDetail, nowTime, pageSize);
		
		request.setAttribute("meetingDetails", meetingDetails);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("md", meetingDetail);
		return "/query_meeting_alreadyhold";
	}
	
	@RequestMapping("/queryMeetingDetailByRole")
	public String queryMeetingDetailByRole(MeetingDetail meetingDetail, Meeting meeting, HttpServletRequest request) {
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);
		
		String nowTime = getNowTime(Const.DATEFORMAT_HM);
		logger.info("now time: " + nowTime);
		getExample(Const.MODE_HISTORY, meetingDetail, meeting, request);
		if (meeting.getStartTime() != null && meeting.getStartTime() != "") {
			if (meeting.getStartTime().compareTo(nowTime) > 0) {
				meeting.setStartTime(nowTime);
			}
		}
		if (meetingDetail.getRole() == null || meetingDetail.getRole() == "") {			
			meetingDetail.setRole(Const.ROLE_RECODER);
		}
		
		logger.info("meeting detail example: " + meetingDetail);
		List<MeetingDetail> meetingDetails = meetingDetailService.paginateMeetingDetailsBeforeNow(meetingDetail, nowTime, pageIndex, pageSize);
		logger.info("size: " + meetingDetails.size() + ". query meetingdetails: " + meetingDetails);		
		int totalPages = meetingDetailService.totalPagesBeforeNow(meetingDetail, nowTime, pageSize);
		
		request.setAttribute("meetingDetails", meetingDetails);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("md", meetingDetail);
		return "/query_meeting_byrole";
	}

	private void getExample(String mode, MeetingDetail meetingDetail, Meeting meeting, HttpServletRequest request) {		
		if (meetingDetail == null) {
			meetingDetail = new MeetingDetail();
		}
		String nowDate = getNowTime(Const.DATEFORMAT_HM);
		if (mode.equals(Const.MODE_FUTURE) && (meeting.getStartTime() == null || meeting.getStartTime() == "")) {
			logger.info("now date: " + nowDate);
			meeting.setStartTime(nowDate);
		}
		User user = (User) request.getSession().getAttribute("user");
		meetingDetail.setUser(user);
		
		MeetingRoom meetingRoom = new MeetingRoom();
		meetingRoom.setNo(request.getParameter("no"));
		User scheduler = new User();
		scheduler.setUserName(request.getParameter("userName"));
		meeting.setMeetingRoom(meetingRoom);
		meeting.setScheduler(scheduler);
		meetingDetail.setMeeting(meeting);
	}
	
	private String getNowTime(String format) {
		return DateUtil.formatDate(new java.util.Date(), format);
	}
	
	@RequestMapping("/modifyWill")
	@ResponseBody
	public String modifyWill(int mId, String will, HttpServletRequest request) {
		MeetingDetail meetingDetail = new MeetingDetail();
		Meeting meeting = new Meeting();
		meeting.setmId(mId);
		meetingDetail.setMeeting(meeting);
		User user = new User();
		int userId = ((User)request.getSession().getAttribute("user")).getUserId();
		user.setUserId(userId);
		meetingDetail.setUser(user);
		meetingDetail.setWill(will);
		
		logger.info("modify md example: " + meetingDetail);
		try {
			meetingDetailService.modifyMeetingDetail(meetingDetail);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
