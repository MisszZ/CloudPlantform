package com.cloud.service;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserInfoBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface UserModPwdService extends SqlMapper {
	
	//用户修改密码
	public Boolean UserUpdatePasswd(UserInfoBean userInfoBean,String oldPwd);
}
