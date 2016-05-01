package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.AdminSendEmailBean;

/**
 * 管理员发送邮件
 * @author somoOne
 *
 */
@Service
public interface AdminSendEmailService {
	//获取用户信息
	public List<AdminSendEmailBean> getUserInfo();
	//获取其他用户信息
	public List<AdminSendEmailBean> getOtherUserInfo();
	//发送邮件
	public List<String> sendEmail(String userNames,String content,String title);
}
