package com.cloud.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.ServerBean;
import com.cloud.entity.UserInfoBean;
import com.cloud.mapper.HaveInfoMapper;
import com.cloud.service.HaveInfoService;
@Service
public class HaveInfoServiceImpl implements HaveInfoService {

	@Resource(name="haveInfoMapper")
	private HaveInfoMapper haveInfoMapper;
	public UserInfoBean userInfo(String email) {
		return haveInfoMapper.userInfo(email);
	}
	//获取配置信息
	public String serverConfigInfo() {
		return haveInfoMapper.serverConfigInfo();
	}
	//获取系统类型
	public List<ServerBean> serverSystemInfo() {
		return haveInfoMapper.serverSystemInfo();
	}
	public String userPhone(String email) {
		return haveInfoMapper.userPhone(email);
	}
	public String userDepart(String email) {
		return haveInfoMapper.userDepart(email);
	}

}
