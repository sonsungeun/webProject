package com.ict.db;

public class MVO {
	private String mid, mpw, mname, mnickname, mfindpw, mphone;
	public MVO() {	}
	public MVO(String mid, String mpw, String mname, String mnickname, String mfindpw, String mphone) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mnickname = mnickname;
		this.mfindpw = mfindpw;
		this.mphone = mphone;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMfindpw() {
		return mfindpw;
	}
	public void setMfindpw(String mfindpw) {
		this.mfindpw = mfindpw;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	
}
