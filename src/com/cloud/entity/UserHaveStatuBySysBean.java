package com.cloud.entity;

public class UserHaveStatuBySysBean {

	private String email;//用户邮箱
	private String systemType;//windows还是Linux类型的服务器
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSystemType() {
		return systemType;
	}
	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}
	
}
