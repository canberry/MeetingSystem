package com.lxm.service;

import com.lxm.bean.MeetingResource;

public interface MeetingResourceService {
	public void addMeetingResource(MeetingResource meetingResource);

	public void removeMeetingResourcesByMId(int mId);
}
