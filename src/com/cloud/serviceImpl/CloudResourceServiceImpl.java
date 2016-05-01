package com.cloud.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.AdminDealApplyBean;
import com.cloud.entity.ServerBean;
import com.cloud.entity.UseDataBean;
import com.cloud.mapper.CloudResourceMapper;
import com.cloud.service.CloudResourceService;

@Service
public class CloudResourceServiceImpl implements CloudResourceService {
	@Resource(name = "cloudResourceMapper")
	CloudResourceMapper cloudResourceMapper;

	/**
	 * 管理员多条件查询 查看云平台资源信息
	 */
	public List<UseDataBean> search(UseDataBean useData) {
		if (useData.getName().equals("") && useData.getDepartment().equals("")&& useData.getInIp().equals("")&& useData.getOutIp().equals("")&& useData.getInPortTrue().equals("")&& useData.getOutPortTrue().equals("")&& useData.getSystemType().equals("")&& useData.getMachineName().equals("")) {
			if(useData.getState()==5){
				return cloudResourceMapper.getAllCloudInfo();
			}else{
				return cloudResourceMapper.getAllCloudInfoByRa(useData.getState());
			}
			
		} else {
			return cloudResourceMapper.search(useData);
		}
	}
	/**
	 * 管理员添加云平台模板
	 */
	public Boolean addType(ServerBean server) {
		return cloudResourceMapper.addType(server);
	}
	//增加用户虚机个数
	public AdminDealApplyBean getUserInfo(AdminDealApplyBean adminDealApplyBean) {
		return cloudResourceMapper.getUserInfo(adminDealApplyBean);
	}
	public Boolean addUserMachine(AdminDealApplyBean adminDealApply) {
//		System.out.println(adminDealApply.getEmail());
//		System.out.println(adminDealApply.getInPortTrue());
		return cloudResourceMapper.addUserMachine(adminDealApply);
	}
	//获取续期状态
	@Override
	public int getAddTimeStatus() {
		return cloudResourceMapper.getAddTimeStatus();
	}
	//删除到期虚机
	public boolean delTimed(UseDataBean useDataBean){
		return cloudResourceMapper.delTimed(useDataBean);
	}
	//删除不再使用的虚机模板
	@Override
	public boolean delOneSyso(String systemType) {
		return cloudResourceMapper.delOneSyso(systemType);
	}
}
