package com.lxm.bean;

public class MeetingRoom {
	private int mrId;
	private String mrName;
	private int capacity;
	private String occupation;

	public MeetingRoom() {
		super();
	}

	public MeetingRoom(String mrName, int capacity) {
		super();
		this.mrName = mrName;
		this.capacity = capacity;
	}

	public MeetingRoom(int mrId, String mrName, int capacity) {
		super();
		this.mrId = mrId;
		this.mrName = mrName;
		this.capacity = capacity;
	}

	public int getMrId() {
		return mrId;
	}

	public void setMrId(int mrId) {
		this.mrId = mrId;
	}

	public String getMrName() {
		return mrName;
	}

	public void setMrName(String mrName) {
		this.mrName = mrName;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	@Override
	public String toString() {
		return "MeetingRoom [mrId=" + mrId + ", mrName=" + mrName
				+ ", capacity=" + capacity + ", occupation=" + occupation + "]";
	}
}
