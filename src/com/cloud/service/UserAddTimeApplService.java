package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.AddTimeResInfoBean;
import com.cloud.entity.UserAddTimeApplBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface UserAddTimeApplService extends SqlMapper {
	//获取续期资源信息
	public List<AddTimeResInfoBean> getAddTimeResInfo(String email);
	//用户进行资续期
	public int lookRenewalNum(UserAddTimeApplBean userAddTimeApplBean);
}
