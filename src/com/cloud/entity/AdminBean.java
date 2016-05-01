package com.cloud.entity;
//管理员的Bean
public class AdminBean {

	private String email;//管理员登录邮箱
	private String pwd;//管理员登陆密码
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
}
