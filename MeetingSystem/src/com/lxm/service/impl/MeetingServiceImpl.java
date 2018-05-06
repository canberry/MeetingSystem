package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingResource;
import com.lxm.bean.Message;
import com.lxm.dao.MeetingMapper;
import com.lxm.service.MeetingDetailService;
import com.lxm.service.MeetingResourceService;
import com.lxm.service.MeetingService;
import com.lxm.service.MessageService;
import com.lxm.service.ResourceService;

@Service
public class MeetingServiceImpl implements MeetingService {

	private static Logger logger = Logger.getLogger(MeetingServiceImpl.class);

	@Resource
	MeetingMapper meetingMapper;
	@Autowired
	MeetingDetailService meetingDetailService;
	@Autowired
	MeetingResourceService meetingResourceService;
	@Autowired
	ResourceService resourceService;
	@Autowired
	MessageService messageService;

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

	public List<Meeting> paginateMeetingsByExample(Meeting meeting,
			int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return meetingMapper.pagination(meeting, pageStart, pageSize);
	}

	public int totalPages(Meeting meeting, int pageSize) {
		int r = meetingMapper.getRows(meeting);
		return calTotalPages(r, pageSize);
	}

	private int calTotalPages(int r, int pageSize) {
		return r % pageSize == 0 ? r / pageSize : r / pageSize + 1;
	}

	public void addMeeting(Meeting meeting, List<MeetingDetail> meetingDetails,
			List<MeetingResource> meetingResources, Message message) {
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

		logger.info("start to send message to mds...");
		for (MeetingDetail meetingDetail : meetingDetails) {
			message.setReceiveUser(meetingDetail.getUser());
			messageService.addMessage(message);
		}
	}

	public List<com.lxm.bean.Resource> queryUnAddResources(int meetingId) {
		return resourceService.queryUnAddResources(meetingId);
	}

	public void modifyMeeting(Meeting meeting,
			List<MeetingDetail> meetingDetails,
			List<MeetingResource> meetingResources, Message message) {
		meetingMapper.modify(meeting);

		logger.info("after modify meeting: ");
		logger.info("start to remove mds...");
		meetingDetailService.removeMeetingDetailsByMId(meeting.getmId());
		for (MeetingDetail meetingDetail : meetingDetails) {
			meetingDetail.setMeeting(meeting);
			logger.info("start to insert md: " + meetingDetail);
			meetingDetailService.addMeetingDetail(meetingDetail);
		}

		logger.info("start to remove mrs...");
		meetingResourceService.removeMeetingResourcesByMId(meeting.getmId());
		for (MeetingResource meetingResource : meetingResources) {
			meetingResource.setMeeting(meeting);
			logger.info("start to insert md: " + meetingResource);
			meetingResourceService.addMeetingResource(meetingResource);
		}

		logger.info("start to send message to mds...");
		for (MeetingDetail meetingDetail : meetingDetails) {
			message.setReceiveUser(meetingDetail.getUser());
			messageService.addMessage(message);
		}
	}

	public void modifyMeetingCancel(Meeting meeting, Message message) {
		meetingMapper.modify(meeting);

		logger.info("after modify meeting: ");
		logger.info("start to remove mrs...");
		meetingResourceService.removeMeetingResourcesByMId(meeting.getmId());

		logger.info("start to send message to mds...");
		List<MeetingDetail> meetingDetails = meeting.getMeetingDetails();
		for (MeetingDetail meetingDetail : meetingDetails) {
			message.setReceiveUser(meetingDetail.getUser());
			messageService.addMessage(message);
		}
	}
}
