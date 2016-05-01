package com.cloud.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.entity.UserSendMesBean;
@Repository
public interface AdmRecMesMapper extends SqlMapper {

	// 管理员处理的私信消息
	public List<UserSendMesBean> lookMesg();
	//管理员回复消息
	public Boolean resMesg(UserSendMesBean userSendMesBean);
}
