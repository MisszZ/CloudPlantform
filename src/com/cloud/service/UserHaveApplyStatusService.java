package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserHaveApplyStatusBean;
import com.cloud.entity.UserHaveStatuBySysBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface UserHaveApplyStatusService extends SqlMapper {
	// 用户查看申请资源进度
	public List<UserHaveApplyStatusBean> searchStatus(String email);
	//获取第一个状态
	public int getStateMachine(String email);
	//通过虚机名称查看申请状态
	public int statusByName(UserHaveStatuBySysBean userHaveStatuBySysBean);
}
