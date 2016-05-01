package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.ServerBean;
import com.cloud.entity.UserInfoBean;

public interface HaveInfoMapper extends SqlMapper{

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
