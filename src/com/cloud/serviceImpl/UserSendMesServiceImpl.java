package com.cloud.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.entity.UserSendMesBean;
import com.cloud.mapper.UserSendMesMapper;
import com.cloud.service.UserSendMesService;
@Service
public class UserSendMesServiceImpl implements UserSendMesService {

	private UserSendMesMapper userSendMesMapper;
	
	public UserSendMesMapper getUserSendMesMapper() {
		return userSendMesMapper;
	}
	@Autowired
	public void setUserSendMesMapper(UserSendMesMapper userSendMesMapper) {
		this.userSendMesMapper = userSendMesMapper;
	}
	@Override
	public Boolean userSendMes(UserSendMesBean userSendMesBean) {
		Date currentDate = new Date(
				System.currentTimeMillis());
		String date = new SimpleDateFormat("yyyy-MM-dd").format(currentDate);
		userSendMesBean.setTime(date);
		userSendMesBean.setTarget("管理员");
		return userSendMesMapper.userSendMes(userSendMesBean);
	}
	@Override
	public List<UserSendMesBean> adminMes(String email) {
		return userSendMesMapper.adminMes(email);
	}



}
