package com.lxm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxm.bean.MeetingResource;
import com.lxm.dao.MeetingResourceMapper;
import com.lxm.service.MeetingResourceService;

@Service
public class MeetingResourceServiceImpl implements MeetingResourceService {
	
	@Resource
	MeetingResourceMapper meetingResourceMapper;

	public void addMeetingResource(MeetingResource meetingResource) {
		meetingResourceMapper.add(meetingResource);
		// change resource remain
		meetingResourceMapper.modifyResource(meetingResource);
	}
}
