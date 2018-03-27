package com.lxm.bean;

public class Document {
	private int dId;
	private String dName;
	private String path;
	private Meeting meeting;

	public Document() {
		super();
	}

	public Document(String dName, String path, Meeting meeting) {
		super();
		this.dName = dName;
		this.path = path;
		this.meeting = meeting;
	}

	public Document(int dId, String dName, String path, Meeting meeting) {
		super();
		this.dId = dId;
		this.dName = dName;
		this.path = path;
		this.meeting = meeting;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	@Override
	public String toString() {
		return "Document [dId=" + dId + ", dName=" + dName + ", path=" + path
				+ ", meeting=" + meeting + "]";
	}
}
