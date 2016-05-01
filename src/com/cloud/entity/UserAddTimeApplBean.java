package com.cloud.entity;

public class UserAddTimeApplBean {
	
	private String machineName;//虚机名称
	private String timed;//到期时间
	private String email;
	private int renewalNum;
	public String getMachineName() {
		return machineName;
	}
	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}
	public String getTimed() {
		return timed;
	}
	public void setTimed(String timed) {
		this.timed = timed;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRenewalNum() {
		return renewalNum;
	}
	public void setRenewalNum(int renewalNum) {
		this.renewalNum = renewalNum;
	}
}
