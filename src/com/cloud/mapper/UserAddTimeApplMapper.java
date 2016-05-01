package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.AddTimeResInfoBean;
import com.cloud.entity.UserAddTimeApplBean;

public interface UserAddTimeApplMapper extends SqlMapper {
	// 查看是否已经进行续期
	public UserAddTimeApplBean lookRenewalNum(UserAddTimeApplBean userAddTimeApplBean);

	// 虚拟机续期，更改时间
	public Boolean addTime(UserAddTimeApplBean userAddTimeApplBean);
	
	public List<AddTimeResInfoBean> getAddTimeResInfo(String email);
}
