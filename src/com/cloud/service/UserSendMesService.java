package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cloud.entity.UserSendMesBean;
import com.cloud.mapper.SqlMapper;
@Transactional
@Service
public interface UserSendMesService extends SqlMapper{

	//查看消息
	public List<UserSendMesBean> adminMes(String email);
	//用户向管理员发邮件
	public Boolean userSendMes(UserSendMesBean userSendMesBean);
}
