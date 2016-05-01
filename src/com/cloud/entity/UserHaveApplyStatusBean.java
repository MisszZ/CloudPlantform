package com.cloud.entity;

public class UserHaveApplyStatusBean {
	private int state;// 申请的资源审核状态 "0"审核中，"1" 通过，“2”拒绝，“3”到期
	private String systemType;// 虚机名称

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getSystemType() {
		return systemType;
	}

	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}



}
