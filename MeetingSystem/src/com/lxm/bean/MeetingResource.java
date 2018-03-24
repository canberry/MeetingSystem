package com.lxm.bean;

public class MeetingResource {
	private Meeting meeting;
	private Resource resource;
	private int number;

	public MeetingResource() {
		super();
	}

	public MeetingResource(int number) {
		super();
		this.number = number;
	}

	public MeetingResource(Meeting meeting, Resource resource, int number) {
		super();
		this.meeting = meeting;
		this.resource = resource;
		this.number = number;
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "MeetingResource [meeting=" + meeting + ", resource=" + resource
				+ ", number=" + number + "]";
	}
}
