package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.AdminSendEmailBean;


public interface AdminSendEmailMapper extends SqlMapper{
	//获取用户总数
	public int getUserCount();
	//获取用户信息
	public List<AdminSendEmailBean> getUserInfo();
	//获取将要给发邮件得用户邮箱
	public String getEmail(String name);
	//获取其他用户信息
	public List<AdminSendEmailBean> getOtherUserInfo(int count);
}
