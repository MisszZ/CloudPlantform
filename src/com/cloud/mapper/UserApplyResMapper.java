package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.AddTimeResInfoBean;
import com.cloud.entity.UseDataBean;

public interface UserApplyResMapper extends SqlMapper {
	//获取续期资源信息
	public List<AddTimeResInfoBean> getAddTimeResInfo(String email);
	// 用户申请资源
	public Boolean applyResource(UseDataBean useDataBean);
	public Boolean applyResourceP(UseDataBean useDataBean);
	//申请资源个人信息
	public Boolean insertInfo(UseDataBean useDataBean);
}
