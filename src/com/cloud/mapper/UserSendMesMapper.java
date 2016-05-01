package com.cloud.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.entity.UserSendMesBean;
@Repository
public interface UserSendMesMapper extends SqlMapper {
	//查看消息
	public List<UserSendMesBean> adminMes(String email);
	// 用户向管理员发邮件
	public Boolean userSendMes(UserSendMesBean userSendMesBean);
}
