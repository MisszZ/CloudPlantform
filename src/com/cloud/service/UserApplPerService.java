package com.cloud.service;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserApplPerBean;
import com.cloud.entity.UserApplyPerCodBean;
import com.cloud.mapper.SqlMapper;

@Service
public interface UserApplPerService extends SqlMapper {
	// 用户申请个人办公机
	public int userApplPer(UserApplyPerCodBean userApplyPerCodBean,
			UserApplPerBean userApplPerBea,String pwd);

	// 查看办公机的类型是否还有？
	public int lookPerNum(UserApplyPerCodBean userApplyPerCodBeann);
}
