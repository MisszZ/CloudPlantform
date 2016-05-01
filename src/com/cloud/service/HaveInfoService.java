package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.ServerBean;
import com.cloud.entity.UserInfoBean;
@Service
public interface HaveInfoService {

	//获取用户的信息
	public UserInfoBean userInfo(String email);
	public String userPhone(String email);
	public String userDepart(String email);
	//获取云平台信息 
	//配置
	public String serverConfigInfo();
	//系统类型
	public List<ServerBean> serverSystemInfo();
}
