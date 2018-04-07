package com.lxm.bean;

import java.util.List;

public class Meeting {
	private int mId;
	private String mName;
	private String startTime;
	private String endTime;
	private String scheduledTime;
	private String description;
	private String cancel;
	private String hold;
	private MeetingRoom meetingRoom;
	private User scheduler;
	
	private List<MeetingDetail> meetingDetails;
	private List<MeetingResource> meetingResources;
	private List<Document> documents;

	public Meeting() {
		super();
	}

	public Meeting(String mName, String startTime, String endTime,
			String scheduledTime, String description, String cancel,
			MeetingRoom meetingRoom, User scheduler) {
		super();
		this.mName = mName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.scheduledTime = scheduledTime;
		this.description = description;
		this.cancel = cancel;
		this.meetingRoom = meetingRoom;
		this.scheduler = scheduler;
	}

	public Meeting(int mId, String mName, String startTime,
			String endTime, String scheduledTime, String description,
			String cancel, MeetingRoom meetingRoom, User scheduler) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.scheduledTime = scheduledTime;
		this.description = description;
		this.cancel = cancel;
		this.meetingRoom = meetingRoom;
		this.scheduler = scheduler;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getScheduledTime() {
		return scheduledTime;
	}

	public void setScheduledTime(String scheduledTime) {
		this.scheduledTime = scheduledTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getHold() {
		return hold;
	}

	public void setHold(String hold) {
		this.hold = hold;
	}

	public MeetingRoom getMeetingRoom() {
		return meetingRoom;
	}

	public void setMeetingRoom(MeetingRoom meetingRoom) {
		this.meetingRoom = meetingRoom;
	}

	public User getScheduler() {
		return scheduler;
	}

	public void setScheduler(User scheduler) {
		this.scheduler = scheduler;
	}

	public List<MeetingDetail> getMeetingDetails() {
		return meetingDetails;
	}

	public void setMeetingDetails(List<MeetingDetail> meetingDetails) {
		this.meetingDetails = meetingDetails;
	}

	public List<MeetingResource> getMeetingResources() {
		return meetingResources;
	}

	public void setMeetingResources(List<MeetingResource> meetingResources) {
		this.meetingResources = meetingResources;
	}

	public List<Document> getDocuments() {
		return documents;
	}

	public void setDocuments(List<Document> documents) {
		this.documents = documents;
	}

	@Override
	public String toString() {
		return "Meeting [mId=" + mId + ", mName=" + mName + ", startTime="
				+ startTime + ", endTime=" + endTime + ", scheduledTime="
				+ scheduledTime + ", description=" + description + ", cancel="
				+ cancel + ", hold=" + hold + ", meetingRoom=" + meetingRoom
				+ ", scheduler=" + scheduler + "]";
	}
}
