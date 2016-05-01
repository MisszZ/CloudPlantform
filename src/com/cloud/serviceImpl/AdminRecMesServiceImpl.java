package com.cloud.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.entity.UserSendMesBean;
import com.cloud.mapper.AdmRecMesMapper;
import com.cloud.service.AdminRecMesService;
@Service
public class AdminRecMesServiceImpl implements AdminRecMesService {
	
	private AdmRecMesMapper admRecMesMapper;
	
	public AdmRecMesMapper getAdmRecMesMapper() {
		return admRecMesMapper;
	}
	@Autowired
	public void setAdmRecMesMapper(AdmRecMesMapper admRecMesMapper) {
		this.admRecMesMapper = admRecMesMapper;
	}
	//管理员查看消息
	@Override
	public List<UserSendMesBean> lookMesg() {
		return admRecMesMapper.lookMesg();
	}
	//管理员回复消息
	@Override
	public Boolean resMesg(UserSendMesBean userSendMesBean) {
		Date currentDate = new Date(
				System.currentTimeMillis());
		String date = new SimpleDateFormat("yyyy-MM-dd").format(currentDate);
//		System.out.println(date);
//		System.out.println(userSendMesBean.getTarget());
//		System.out.println(userSendMesBean.getContent());
		userSendMesBean.setTime(date);
		userSendMesBean.setEmail("管理员");
		return admRecMesMapper.resMesg(userSendMesBean);
	}

}
