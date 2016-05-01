package com.cloud.mapper;

import com.cloud.entity.UserInfoBean;


public interface UserModPwdMapper extends SqlMapper {
	//用户修改密码
	public String getUerOld(String oldPwd);
	public Boolean UserUpdatePasswd(UserInfoBean userInfoBean);
}
