package com.ict.db;

public class BVO {
	private String b_idx,title, content, mnickname, regdate;
	private int hit;
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
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
public BVO() {
	// TODO Auto-generated constructor stub
}
public BVO(String b_idx, String title, String content, String mnickname, String regdate, int hit) {
	super();
	this.b_idx = b_idx;
	this.title = title;
	this.content = content;
	this.mnickname = mnickname;
	this.regdate = regdate;
	this.hit = hit;
}
}
