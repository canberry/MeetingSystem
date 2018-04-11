package com.lxm.bean;

public class Resource {
	private int rId;
	private String rName;
	private int total;
	private int remain;
	private int rState;

	public Resource() {
		super();
	}

	public Resource(String rName, int total, int remain) {
		super();
		this.rName = rName;
		this.total = total;
		this.remain = remain;
	}

	public Resource(int rId, String rName, int total, int remain) {
		super();
		this.rId = rId;
		this.rName = rName;
		this.total = total;
		this.remain = remain;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
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

	public int getrState() {
		return rState;
	}

	public void setrState(int rState) {
		this.rState = rState;
	}

	@Override
	public String toString() {
		return "Resource [rId=" + rId + ", rName=" + rName + ", total=" + total
				+ ", remain=" + remain + ", rState=" + rState + "]";
	}
}
