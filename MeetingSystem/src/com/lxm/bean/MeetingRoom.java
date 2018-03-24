package com.lxm.bean;

public class MeetingRoom {
	private int id;
	private String name;
	private int capacity;
	private String occupation;

	public MeetingRoom() {
		super();
	}

	public MeetingRoom(String name, int capacity) {
		super();
		this.name = name;
		this.capacity = capacity;
	}

	public MeetingRoom(int id, String name, int capacity) {
		super();
		this.id = id;
		this.name = name;
		this.capacity = capacity;
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
		return "MeetingRoom [id=" + id + ", name=" + name + ", capacity="
				+ capacity + ", occupation=" + occupation + "]";
	}
}
