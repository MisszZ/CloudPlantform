package com.cloud.entity;


public class DelRejApplBean {

	private String name;//用户姓名
	private String time;//申请云平台时间
	private String reason;//拒绝申请理由
	private String email;//用户邮箱
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
