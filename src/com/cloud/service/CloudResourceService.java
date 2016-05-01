package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.AdminDealApplyBean;
import com.cloud.entity.ServerBean;
import com.cloud.entity.UseDataBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface CloudResourceService extends SqlMapper {
	// 多条件联合查询
	public List<UseDataBean> search(UseDataBean useData);
	// 添加云平台资源类型
	public Boolean addType(ServerBean server);
	//增加用户虚机个数
	public AdminDealApplyBean getUserInfo(AdminDealApplyBean adminDealApplyBean);
	public Boolean addUserMachine(AdminDealApplyBean adminDealApply);
	//获取续期按钮状态
	public int getAddTimeStatus();
	//删除到期虚机
	public boolean delTimed(UseDataBean useData);
	//删除不再实用的虚机模板
	public boolean delOneSyso(String systemType);
}
