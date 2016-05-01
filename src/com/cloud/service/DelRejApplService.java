package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.DelRejApplBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface DelRejApplService extends SqlMapper {
	// 未通过申请信息
	public List<DelRejApplBean> rejectedApplyList();

	// 删除未通过申请信息
	public Boolean deleteRejectedApply(String email);
}
