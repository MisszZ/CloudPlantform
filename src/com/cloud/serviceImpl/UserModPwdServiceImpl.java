package com.cloud.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserInfoBean;
import com.cloud.mapper.UserModPwdMapper;
import com.cloud.service.UserModPwdService;
@Service
public class UserModPwdServiceImpl implements UserModPwdService {
	@Resource(name="userModPwdMapper")
	UserModPwdMapper userModPwdMapper;
	public Boolean UserUpdatePasswd(UserInfoBean userInfoBean,String oldPwd) {
//		System.out.println("旧密码页面  "+oldPwd);
//		System.out.println("旧密码数据库  "+userModPwdMapper.getUerOld(userInfoBean.getEmail()));
//		System.out.println("新密码页面  "+userInfoBean.getUser_pwd());
		if(oldPwd.equals(userModPwdMapper.getUerOld(userInfoBean.getEmail()))){
			return userModPwdMapper.UserUpdatePasswd(userInfoBean);
		}else{
			return false;
		}
		
	}

}
