package com.lxm.service;

import java.util.List;

import com.lxm.bean.Meeting;
import com.lxm.bean.MeetingDetail;
import com.lxm.bean.MeetingResource;

public interface MeetingService {
	public List<Meeting> queryMeetingsByTime(Meeting meeting);
	public Meeting queryMeetingById(int meetingId);
	public Meeting queryMeetingDetailAndResourceById(int meetingId);
	public Meeting queryMeetingByIdAndUserId(int meetingId, int userId);
	public List<Meeting> paginateMeetingsByExample(Meeting meeting, int pageIndex, int pageSize);
	public int totalPages(Meeting meeting, int pageSize);
	public void addMeeting(Meeting meeting, List<MeetingDetail> meetingDetails, List<MeetingResource> meetingResources);
}
