package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserSendMesBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface AdminRecMesService extends SqlMapper{
	// 管理员处理的私信消息
	public List<UserSendMesBean> lookMesg();
	//管理员回复消息
	public Boolean resMesg(UserSendMesBean userSendMesBean);
}
