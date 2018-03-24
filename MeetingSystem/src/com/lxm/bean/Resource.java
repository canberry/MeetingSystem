package com.lxm.bean;

public class Resource {
	private int id;
	private String name;
	private int total;
	private int remain;

	public Resource() {
		super();
	}

	public Resource(String name, int total, int remain) {
		super();
		this.name = name;
		this.total = total;
		this.remain = remain;
	}

	public Resource(int id, String name, int total, int remain) {
		super();
		this.id = id;
		this.name = name;
		this.total = total;
		this.remain = remain;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}

	@Override
	public String toString() {
		return "Resource [id=" + id + ", name=" + name + ", total=" + total
				+ ", remain=" + remain + "]";
	}
}
