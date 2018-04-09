package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingResource;
import com.lxm.controller.MeetingController;
import com.lxm.dao.MeetingDetailMapper;
import com.lxm.dao.MeetingMapper;
import com.lxm.service.MeetingDetailService;
import com.lxm.service.MeetingResourceService;
import com.lxm.service.MeetingService;

@Service
public class MeetingServiceImpl implements MeetingService {
	
	private static Logger logger = Logger.getLogger(MeetingServiceImpl.class);

	@Resource
	MeetingMapper meetingMapper;
	@Autowired
	private MeetingDetailService meetingDetailService;
	@Autowired
	private MeetingResourceService meetingResourceService;

	public List<Meeting> queryMeetingsByTime(Meeting meeting) {
		return meetingMapper.queryByTime(meeting);
	}

	public Meeting queryMeetingById(int meetingId) {
		return meetingMapper.queryById(meetingId);
	}

	public Meeting queryMeetingDetailAndResourceById(int meetingId) {
		return meetingMapper.queryDetailById(meetingId);
	}

	public Meeting queryMeetingByIdAndUserId(int meetingId, int userId) {
		return meetingMapper.queryByIds(meetingId, userId);
	}

	public List<Meeting> paginateMeetingsByExample(Meeting meeting, int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return meetingMapper.pagination(meeting, pageStart, pageSize);
	}

	public int totalPages(Meeting meeting, int pageSize) {
		int r = meetingMapper.getRows(meeting);
		return calTotalPages(r, pageSize);
	}
	
	private int calTotalPages(int r, int pageSize) {
		return r  % pageSize == 0 ? r / pageSize : r / pageSize + 1;
	}

	public void addMeeting(Meeting meeting, List<MeetingDetail> meetingDetails, List<MeetingResource> meetingResources) {
		meetingMapper.add(meeting);
		
		logger.info("after insert meeting: " + meeting);
		for (MeetingDetail meetingDetail : meetingDetails) {
			meetingDetail.setMeeting(meeting);
			logger.info("start to insert md: " + meetingDetail);
			meetingDetailService.addMeetingDetail(meetingDetail);
		}
		
		for (MeetingResource meetingResource : meetingResources) {
			meetingResource.setMeeting(meeting);
			logger.info("start to insert md: " + meetingResource);
			meetingResourceService.addMeetingResource(meetingResource);
		}
	}
}
