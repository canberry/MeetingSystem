package com.lxm.service.impl;

import java.util.List;

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
		meetingResourceMapper.subResourceRemain(meetingResource);
	}

	public void removeMeetingResourcesByMId(int mId) {
		List<MeetingResource> meetingResources = queryMeetingResourcesByMId(mId);
		for (MeetingResource meetingResource : meetingResources) {
			meetingResourceMapper.remove(meetingResource.getMeeting().getmId(),
					meetingResource.getResource().getrId());
			meetingResourceMapper.addResourceRemain(meetingResource);
		}
	}

	public List<MeetingResource> queryMeetingResourcesByMId(int mId) {
		return meetingResourceMapper.queryByMId(mId);
	}
}
