package com.lxm.bean;

public class Document {
	private int id;
	private String name;
	private String path;
	private Meeting meeting;

	public Document() {
		super();
	}

	public Document(String name, String path, Meeting meeting) {
		super();
		this.name = name;
		this.path = path;
		this.meeting = meeting;
	}

	public Document(int id, String name, String path, Meeting meeting) {
		super();
		this.id = id;
		this.name = name;
		this.path = path;
		this.meeting = meeting;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "Document [id=" + id + ", name=" + name + ", path=" + path
				+ ", meeting=" + meeting + "]";
	}
}
