package com.lxm.bean;

import java.sql.Timestamp;

public class Meeting {
	private int mId;
	private String mName;
	private Timestamp startTime;
	private Timestamp endTime;
	private Timestamp scheduledTime;
	private String description;
	private String cancel;
	private String hold;
	private MeetingRoom meetingRoom;
	private User scheduler;

	public Meeting() {
		super();
	}

	public Meeting(String mName, Timestamp startTime, Timestamp endTime,
			Timestamp scheduledTime, String description, String cancel,
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

	public Meeting(int mId, String mName, Timestamp startTime,
			Timestamp endTime, Timestamp scheduledTime, String description,
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

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Timestamp getScheduledTime() {
		return scheduledTime;
	}

	public void setScheduledTime(Timestamp scheduledTime) {
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

	@Override
	public String toString() {
		return "Meeting [mId=" + mId + ", mName=" + mName + ", startTime="
				+ startTime + ", endTime=" + endTime + ", scheduledTime="
				+ scheduledTime + ", description=" + description + ", cancel="
				+ cancel + ", hold=" + hold + ", meetingRoom=" + meetingRoom
				+ ", scheduler=" + scheduler + "]";
	}
}
