package com.lxm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lxm.bean.MeetingDetail;
import com.lxm.dao.MeetingDetailMapper;
import com.lxm.service.MeetingDetailService;

@Service
public class MeetingDetailServiceImpl implements MeetingDetailService {

	@Resource
	MeetingDetailMapper meetingDetailMapper;

	public List<MeetingDetail> paginateMeetingDetailsByExample(MeetingDetail meetingDetail, int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return meetingDetailMapper.pagination(meetingDetail, pageStart, pageSize);			
	}

	public int totalPages(MeetingDetail meetingDetail, int pageSize) {
		int r = meetingDetailMapper.getRows(meetingDetail);
		return calTotalPages(r, pageSize);
	}
	
	private int calTotalPages(int r, int pageSize) {
		return r  % pageSize == 0 ? r / pageSize : r / pageSize + 1;
	}

	public void modifyMeetingDetail(MeetingDetail meetingDetail) {
		meetingDetailMapper.modify(meetingDetail);
	}

	public List<MeetingDetail> paginateMeetingDetailsBeforeNow(MeetingDetail meetingDetail, String nowTime, int pageIndex, int pageSize) {
		int pageStart = pageSize * (pageIndex - 1);
		return meetingDetailMapper.paginationBeforeNow(meetingDetail, nowTime, pageStart, pageSize);
	}

	public int totalPagesBeforeNow(MeetingDetail meetingDetail, String nowTime, int pageSize) {
		int r = meetingDetailMapper.getRowsBeforeNow(meetingDetail, nowTime);
		return calTotalPages(r, pageSize);
	}

	public void addMeetingDetail(MeetingDetail meetingDetail) {
		meetingDetailMapper.add(meetingDetail);
	}
}
