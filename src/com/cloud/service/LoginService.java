package com.cloud.service;

import org.springframework.stereotype.Service;

import com.cloud.entity.AdminBean;


@Service
public interface LoginService {
	/**
	 * 管理员登录
	 * @param email
	 * @param pwd
	 * @return
	 */
	public String adminLogin(String email,String pwd);
	//管理员修改密码
	public Boolean adminResetPwd(AdminBean admin,String oldPwd);
	//用户登录
	public String userLogin(String email,String pwd);
	//用户身份验证
	public String userActivate(String name,String email);
	
	
}
