package com.cloud.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.UserHaveApplyStatusBean;
import com.cloud.entity.UserHaveStatuBySysBean;
import com.cloud.mapper.UserHaveApplyStatusMapper;
import com.cloud.service.UserHaveApplyStatusService;
@Service
public class UserHaveApplyStatusServiceImpl implements
		UserHaveApplyStatusService {
	@Resource(name="userHaveApplyStatusMapper")
	UserHaveApplyStatusMapper userHaveApplyStatusMapper;
	public List<UserHaveApplyStatusBean> searchStatus(String email) {
		return userHaveApplyStatusMapper.searchStatus(email);
	}
	public int statusByName(UserHaveStatuBySysBean userHaveStatuBySysBean) {
//		System.out.println("系统   "+userHaveStatuBySysBean.getSystemType());
//		System.out.println("email  "+userHaveStatuBySysBean.getEmail());
//		System.out.println("编号   "+userHaveApplyStatusMapper.statusByName(userHaveStatuBySysBean));
		return userHaveApplyStatusMapper.statusByName(userHaveStatuBySysBean);
	}
	@Override
	public int getStateMachine(String email) {
		return userHaveApplyStatusMapper.getStateMachine(email);
	}

}
