package com.lxm.service;

import java.util.List;

import com.lxm.bean.MeetingDetail;

public interface MeetingDetailService {
	public List<MeetingDetail> paginateMeetingDetailsByExample(MeetingDetail meetingDetail, int pageIndex, int pageSize);
	public int totalPages(MeetingDetail meetingDetail, int pageSize);
	public void modifyMeetingDetail(MeetingDetail meetingDetail);
	public List<MeetingDetail> paginateMeetingDetailsBeforeNow(MeetingDetail meetingDetail, String nowTime, int pageIndex, int pageSize);
	public int totalPagesBeforeNow(MeetingDetail meetingDetail, String nowTime, int pageSize);
	public void addMeetingDetail(MeetingDetail meetingDetail);
	public void removeMeetingDetailsByMId(int mId);
}
