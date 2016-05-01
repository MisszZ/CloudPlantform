package com.cloud.mapper;

import com.cloud.entity.UserApplPerBean;

public interface UserApplPerMapper extends SqlMapper {

	//查看是否已拥有个人办公机
	public int havePer(String email);
	//用户申请个人办公机
	public UserApplPerBean userApplPer(String systemType);
	//加入信息
	public Boolean setPerNumber(UserApplPerBean userApplPerBean);
	//修改账号状态
	public Boolean setStatusNum(int personalMachineNum);
	//查看个人办公机账号数目
	public int lookPerNum(String systemType);
}
