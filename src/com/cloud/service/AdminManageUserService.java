package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserInfoBean;

@Service
public interface AdminManageUserService {
	 
	// 管理员添加用户
	public Boolean addUser(UserInfoBean userInfoBean);

	// 管理员删除单个用户
	public Boolean deleteUser(String userEmail);

	// 修改用户信息
	public Boolean updateUser(String email);

	// 获得所有用户的信息
	public List<UserInfoBean> allUserInfo();

	// 姓名查找用户
	public List<UserInfoBean> getUserInfoByName(String name);
	//重置用户密码
	public Boolean initPwd(String email);
}
