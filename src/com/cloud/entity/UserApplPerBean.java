package com.cloud.entity;

public class UserApplPerBean {

	private int personalMachineNum;//人办公机账号
	private String personalMachinePwd;//人办公机密码
	private String email;//用户邮箱
	private String systemType;
	public int getPersonalMachineNum() {
		return personalMachineNum;
	}
	public void setPersonalMachineNum(int personalMachineNum) {
		this.personalMachineNum = personalMachineNum;
	}
	public String getPersonalMachinePwd() {
		return personalMachinePwd;
	}
	public void setPersonalMachinePwd(String personalMachinePwd) {
		this.personalMachinePwd = personalMachinePwd;
	}
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
