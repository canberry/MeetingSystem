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

import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingRoom;
import com.lxm.bean.Message;
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
	
	@RequestMapping("/queryMeetingToBeHoldByTime")
	public void queryMeetingToBeHoldByTime(HttpServletRequest request, HttpServletResponse response) throws IOException {		
		MeetingDetail meetingDetail = new MeetingDetail();
		User user = (User) request.getSession().getAttribute("user");
		meetingDetail.setUser(user);
		
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String nowTime = getNowTime(Const.DATEFORMAT_HM);
		if (startTime.compareTo(nowTime) < 0 && endTime.compareTo(nowTime) < 0) {
			startTime = nowTime;
		}
		Meeting meeting = new Meeting();
		meeting.setStartTime(startTime);
		meeting.setEndTime(endTime);
		meetingDetail.setMeeting(meeting);
		
		int pageSize = meetingDetailService.getRows(meetingDetail);
		int pageIndex = 1;
		
		logger.info("meeting detail example: " + meetingDetail);
		List<MeetingDetail> meetingDetails = meetingDetailService.paginateMeetingDetailsByExample(meetingDetail, pageIndex, pageSize);
		logger.info("size: " + meetingDetails.size() + ". query meetingdetails: " + meetingDetails);		
		
		JSONArray datas = JSONArray.fromObject(meetingDetails);
		response.setCharacterEncoding(Const.ENCODING_UTF8);
		response.getWriter().print(datas.toString());
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
	public String modifyWill(int mId, String will, 
			int schedulerUserId, String mName, 
			String startTime, String endTime, 
			HttpServletRequest request) {
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
			String w = "";
			if (will.equals(Const.WILL_YES)) {
				w = "同意参加";
			} else if (will.equals(Const.WILL_NO)) {
				w = "不能参加";
			} else {
				w = "不确定是否参加";
			}
			
			String messageName = "会议回复: " + mName;
			String content = ((User)request.getSession().getAttribute("user")).getUserName() + 
			                 "  回复了会议: " + mName + "," + 
			                 "    开始时间: " + startTime + "," + 
			                 "    结束时间: " + endTime + "," +
			                 "    TA 的回复是: " + w + "," +
			                 "    请去查看详情";
			User sendUser = new User();
			sendUser.setUserId(user.getUserId());
			User receiveUser = new User();
			receiveUser.setUserId(schedulerUserId);
			Message message = new Message();
			message.setMessageName(messageName);
			message.setContent(content);
			message.setSendUser(sendUser);
			message.setReceiveUser(receiveUser);
			
			meetingDetailService.modifyMeetingDetail(meetingDetail, message);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
