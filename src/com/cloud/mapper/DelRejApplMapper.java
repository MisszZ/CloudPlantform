package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.DelRejApplBean;

public interface DelRejApplMapper extends SqlMapper {

	// 未通过申请信息
	public List<DelRejApplBean> rejectedApplyList();

	// 删除未通过申请信息
	public Boolean deleteRejectedApply(String email);
}
