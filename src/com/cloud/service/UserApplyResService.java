package com.cloud.service;

import org.springframework.stereotype.Service;

import com.cloud.entity.UseDataBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface UserApplyResService extends SqlMapper {
	// 用户申请资源
	public Boolean applyResource(UseDataBean useDataBean);
}
