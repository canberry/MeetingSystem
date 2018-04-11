package com.lxm.bean;

public class MeetingRoom {
	private int mrId;
	private String no;
	private String mrName;
	private int capacity;
	private String occupation;
	private String mrState;

	public MeetingRoom() {
		super();
	}

	public MeetingRoom(String no, String mrName, int capacity, String occupation) {
		super();
		this.no = no;
		this.mrName = mrName;
		this.capacity = capacity;
		this.occupation = occupation;
	}

	public MeetingRoom(int mrId, String no, String mrName, int capacity,
			String occupation) {
		super();
		this.mrId = mrId;
		this.no = no;
		this.mrName = mrName;
		this.capacity = capacity;
		this.occupation = occupation;
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

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMrState() {
		return mrState;
	}

	public void setMrState(String mrState) {
		this.mrState = mrState;
	}

	@Override
	public String toString() {
		return "MeetingRoom [mrId=" + mrId + ", mrName=" + mrName
				+ ", capacity=" + capacity + ", occupation=" + occupation 
				+ ", no=" + no + ", mrState=" + mrState + "]";
	}
}
