package com.ict.db;

public class MyVO1 {
	String month, depositemoney, gender, channel, birth, area, prefential;
	public MyVO1() {
		// TODO Auto-generated constructor stub
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDepositemoney() {
		return depositemoney;
	}
	public void setDepositemoney(String depositemoney) {
		this.depositemoney = depositemoney;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPrefential() {
		return prefential;
	}
	public void setPrefential(String prefential) {
		this.prefential = prefential;
	}
	public MyVO1(String month, String depositemoney, String gender, String channel, String birth, String area,
			String prefential) {
		super();
		this.month = month;
		this.depositemoney = depositemoney;
		this.gender = gender;
		this.channel = channel;
		this.birth = birth;
		this.area = area;
		this.prefential = prefential;
	}
}
