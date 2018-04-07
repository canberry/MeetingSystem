package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxm.bean.Meeting;
import com.lxm.dao.MeetingMapper;
import com.lxm.service.MeetingService;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Resource
	MeetingMapper meetingMapper;

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
}
