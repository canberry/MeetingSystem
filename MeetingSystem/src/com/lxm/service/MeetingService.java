package com.lxm.service;

import java.util.List;

import com.lxm.bean.Meeting;

public interface MeetingService {
	public List<Meeting> queryMeetingsByTime(Meeting meeting);
	public Meeting queryMeetingById(int meetingId);
	public Meeting queryMeetingDetailAndResourceById(int meetingId);
	public Meeting queryMeetingByIdAndUserId(int meetingId, int userId);
}
