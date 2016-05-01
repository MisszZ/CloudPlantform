package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.UserInfoBean;

public interface AdminManageUserMapper extends SqlMapper {
	// 增加用户信息
	public Boolean addUser(UserInfoBean userInfoBean);
	
	//该邮箱是否已经注册
	public int isSigin(String email);

	// 删除单个用户
	public Boolean delete(String email);
	//查询用户资源是否为空
	public int ifUseCloud(String userEmail);

	// 修改用户信息
	public Boolean update(String email);

	// 获得所有用户的信息
	public List<UserInfoBean> allUserInfo();
	
	//姓名查找用户
	public List<UserInfoBean> getUserInfoByName(String name);
	//重置用户密码
	public Boolean initPwd(UserInfoBean userInfoBean);
}
