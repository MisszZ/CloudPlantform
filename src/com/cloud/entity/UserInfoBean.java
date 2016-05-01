package com.cloud.entity;

public class UserInfoBean {

	private String email;//用户邮箱
	private String name;//用户姓名
	private String user_pwd;//用户密码
	private int personalMachineNum;//人办公机账号
	private String personalMachinePwd;//人办公机密码
	private int personalNum;//人办公机数量
	
	public String getEmail() {
		return email;
	}
	public  void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
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
	public int getPersonalNum() {
		return personalNum;
	}
	public void setPersonalNum(int personalNum) {
		this.personalNum = personalNum;
	}
	
}
