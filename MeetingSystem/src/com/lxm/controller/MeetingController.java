package com.lxm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.bean.Document;
import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingResource;
import com.lxm.bean.MeetingRoom;
import com.lxm.bean.Resource;
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
	
	@RequestMapping("/queryMeetingDRsById")
	public String queryMeetingDRsById(int meetingId, HttpServletRequest request) {
		logger.info("meetingId: " + meetingId);
		
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
		
		List<Resource> unAddResources = meetingService.queryUnAddResources(meetingId);
		logger.info("unadd rs: " + unAddResources);
		
		request.setAttribute("meeting", meeting);
		request.setAttribute("meetingDetails", meetingDetails);
		request.setAttribute("meetingResources", meetingResources);
		request.setAttribute("unAddResources", unAddResources);
		return "/modify_meeting";
	}
	
	@RequestMapping("/queryMeetingByMyScheduled")
	public String queryMeetingByMyScheduled(Meeting meeting, HttpServletRequest request) {
		int pageSize = 5;
		int pageIndex = 1;
		String piStr = request.getParameter("pageIndex");
		if (piStr == null) {
			piStr = "1";
		}
		pageIndex = Integer.parseInt(piStr);
		logger.info("pageIndex: " + pageIndex);
		
		getExample(meeting, request);
		
		logger.info("meeting example: " + meeting);
		List<Meeting> meetings = meetingService.paginateMeetingsByExample(meeting, pageIndex, pageSize);
		logger.info("size: " + meetings.size() + ". query meetings: " + meetings);		
		int totalPages = meetingService.totalPages(meeting, pageSize);
		
		request.setAttribute("meetings", meetings);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("meeting", meeting);		
		return "/query_meeting_myscheduled";
	}
	
	private void getExample(Meeting meeting, HttpServletRequest request) {
		if (meeting == null) {
			meeting = new Meeting();
		}
		
		User user = (User) request.getSession().getAttribute("user");
		meeting.setScheduler(user);
		
		MeetingRoom meetingRoom = new MeetingRoom();
		meetingRoom.setNo(request.getParameter("no"));
		meeting.setMeetingRoom(meetingRoom);
	}
	
	@RequestMapping("/addMeeting")
	@ResponseBody
	public String addMeeting(Meeting meeting, int mrId, @RequestParam("mds")String mds, 
			@RequestParam("mrs")String mrs, HttpServletRequest request) {
		MeetingRoom meetingRoom = new MeetingRoom();
		meetingRoom.setMrId(mrId);
		meeting.setMeetingRoom(meetingRoom );
		User scheduler = (User) request.getSession().getAttribute("user");
		meeting.setScheduler(scheduler);
		logger.info("meeting to insert: " + meeting);
		
		List<MeetingDetail> meetingDetails = new ArrayList<MeetingDetail>();
		MeetingDetail mdetail;
		JSONArray mdsjarray = JSONArray.fromObject(mds);
		for (Object obj : mdsjarray) {
			JSONObject jo = JSONObject.fromObject(obj);
			int userId = jo.getInt("userId");
			String role = jo.getString("role");
			String optional = jo.getString("optional");
			
			mdetail = new MeetingDetail();
			mdetail.setRole(role);
			mdetail.setOptional(optional);
			User user = new User();
			user.setUserId(userId);
			mdetail.setUser(user);
			
			meetingDetails.add(mdetail);
		}
		logger.info("size: " + meetingDetails.size() + " mds to insert: " + meetingDetails);
		
		List<MeetingResource> meetingResources = new ArrayList<MeetingResource>();
		MeetingResource mresource;
		JSONArray mrsjarray = JSONArray.fromObject(mrs);
		for (Object obj : mrsjarray) {
			JSONObject jo = JSONObject.fromObject(obj);
			int rId = jo.getInt("rId");
			int number = jo.getInt("number");
			
			mresource = new MeetingResource();
			mresource.setNumber(number);
			Resource resource = new Resource();
			resource.setrId(rId);
			mresource.setResource(resource);
			
			meetingResources.add(mresource);
		}
		logger.info("size: " + meetingResources.size() + " mrs to insert: " + meetingResources);
		
		
		logger.info("start to insert meeting...");
		try {
			meetingService.addMeeting(meeting, meetingDetails, meetingResources);			
			return String.valueOf(meeting.getmId());
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping("/modifyMeeting")
	@ResponseBody
	public String modifyMeeting(Meeting meeting, int mrId, @RequestParam("mds")String mds, 
			@RequestParam("mrs")String mrs, HttpServletRequest request) {
		MeetingRoom meetingRoom = new MeetingRoom();
		meetingRoom.setMrId(mrId);
		meeting.setMeetingRoom(meetingRoom );
		logger.info("meeting to insert: " + meeting);
		
		List<MeetingDetail> meetingDetails = new ArrayList<MeetingDetail>(); // to insert 
		MeetingDetail mdetail;
		JSONArray mdsjarray = JSONArray.fromObject(mds);
		for (Object obj : mdsjarray) {
			JSONObject jo = JSONObject.fromObject(obj);
			int userId = jo.getInt("userId");
			String role = jo.getString("role");
			String optional = jo.getString("optional");
			
			mdetail = new MeetingDetail();
			mdetail.setRole(role);
			mdetail.setOptional(optional);
			User user = new User();
			user.setUserId(userId);
			mdetail.setUser(user);
			
			meetingDetails.add(mdetail);
		}
		logger.info("size: " + meetingDetails.size() + " mds to insert: " + meetingDetails);
		
		List<MeetingResource> meetingResources = new ArrayList<MeetingResource>(); // to insert
		MeetingResource mresource;
		JSONArray mrsjarray = JSONArray.fromObject(mrs);
		for (Object obj : mrsjarray) {
			JSONObject jo = JSONObject.fromObject(obj);
			int rId = jo.getInt("rId");
			int number = jo.getInt("number");
			
			mresource = new MeetingResource();
			mresource.setNumber(number);
			Resource resource = new Resource();
			resource.setrId(rId);
			mresource.setResource(resource);
			
			meetingResources.add(mresource);
		}
		logger.info("size: " + meetingResources.size() + " mrs to insert: " + meetingResources);
		
		logger.info("start to modify meeting...");
		try {
			meetingService.modifyMeeting(meeting, meetingDetails, meetingResources);			
			return String.valueOf(meeting.getmId());
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
