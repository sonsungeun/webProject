package com.ict.db;

public class BVO {
	private String idx,title, content, mnickname, regdate;
	private int hit;

	public BVO() {
	}

	public BVO(String idx,String title, String content, String mnickname, int hit, String regdate) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.mnickname = mnickname;
		this.hit = hit;
		this.regdate = regdate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

}
