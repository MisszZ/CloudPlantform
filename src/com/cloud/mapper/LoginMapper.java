package com.cloud.mapper;

import com.cloud.entity.AdminBean;
import com.cloud.entity.UserInfoBean;

public interface LoginMapper extends SqlMapper{
	//管理员登录
	public String adminlogin(String email);
	//用户登录
	public String userlogin(String email);
	//用户身份验证
	public String userActivate(String name);
	//初始化用户密码
	public Boolean initPwd(UserInfoBean userInfoBean);
	//管理员修改密码
	public String getAdminPwd(String email);
	public Boolean adminResetPwd(AdminBean adminBean);
}
