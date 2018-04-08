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
import org.springframework.web.bind.annotation.RequestMethod;

import com.lxm.bean.Document;
import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingResource;
import com.lxm.bean.MeetingRoom;
import com.lxm.bean.User;
import com.lxm.service.MeetingService;
import com.lxm.util.Const;
import com.lxm.util.DateUtil;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	private static Logger logger = Logger.getLogger(MeetingController.class);

	@Autowired
	MeetingService meetingService;
	
	@RequestMapping(value="/queryMeetingByTime", method = RequestMethod.POST)
	public void queryMeetingByTime(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		Meeting meeting = new Meeting();
		meeting.setStartTime(startTime);
		meeting.setEndTime(endTime);
		
		String mrId = request.getParameter("mrId");
		if (mrId != null && !mrId.equals("")) {
			MeetingRoom mr = new MeetingRoom();
			mr.setMrId(Integer.parseInt(mrId));
			meeting.setMeetingRoom(mr);
		}
		
		logger.info("query meeting example: " + meeting);
		List<Meeting> meetings = meetingService.queryMeetingsByTime(meeting);
		logger.info("after query meetings: " + meetings);
		JSONArray datas = JSONArray.fromObject(meetings);
		response.setCharacterEncoding(Const.ENCODING_UTF8);
		response.getWriter().print(datas.toString());
	}
	
	@RequestMapping("/queryMeetingById")
	public void queryMeetingById(int meetingId, HttpServletResponse response) throws IOException {
		Meeting meeting = meetingService.queryMeetingById(meetingId);
		logger.info("after query meeting: " + meeting);        
        meeting.setScheduledTime(DateUtil.format(meeting.getScheduledTime(), Const.DATEFORMAT_HM));
		JSONArray datas = JSONArray.fromObject(meeting);
		response.setCharacterEncoding(Const.ENCODING_UTF8);
		response.getWriter().print(datas.toString());
	}
	
	@RequestMapping("/queryMeetingDetailAndResourceById")
	public String queryMeetingDetailAndResourceById(int meetingId, HttpServletRequest request) {
		logger.info("meetingId: " + meetingId);
		int userId = ((User) request.getSession().getAttribute("user")).getUserId();
		Meeting m = meetingService.queryMeetingByIdAndUserId(meetingId, userId);
		MeetingDetail md = new MeetingDetail();
		if (m != null && m.getMeetingDetails() != null) {
			md = m.getMeetingDetails().get(0);
		}
		logger.info("after query md: " + md);
		Meeting meeting = meetingService.queryMeetingById(meetingId);
		logger.info("after query meeting: " + meeting);
		Meeting meetingDRD = meetingService.queryMeetingDetailAndResourceById(meetingId);
		if (meetingDRD == null) {
			meetingDRD = new Meeting();
		}
		logger.info("after query meetingDRs: ");
		List<MeetingDetail> meetingDetails = meetingDRD.getMeetingDetails();
		logger.info("mds: " + meetingDetails);
		List<MeetingResource> meetingResources = meetingDRD.getMeetingResources();
		logger.info("mrs: " + meetingResources);
		List<Document> documents = meetingDRD.getDocuments();
		logger.info("ds: " + documents);
		
		request.setAttribute("md", md);
		request.setAttribute("meeting", meeting);
		request.setAttribute("meetingDetails", meetingDetails);
		request.setAttribute("meetingResources", meetingResources);
		request.setAttribute("documents", documents);
		return "/query_meeting_detail";
	}
	
	@RequestMapping("/queryMeetingByMyScheduled")
	public String queryMeetingByMyScheduled(HttpServletRequest request) {
		
		
		return "";
	}
}
