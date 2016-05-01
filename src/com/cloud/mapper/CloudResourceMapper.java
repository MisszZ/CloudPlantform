package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.AdminDealApplyBean;
import com.cloud.entity.ServerBean;
import com.cloud.entity.UseDataBean;


public interface CloudResourceMapper extends SqlMapper {
	/**
	 * 多条件联合查询
	 * @param useData
	 * @return
	 */
	public List<UseDataBean> search(UseDataBean useData);
	/**
	 * 根据是否过期产查看资源信息
	 */
	public List<UseDataBean> searchByRa(UseDataBean useData);
	/**
	 * 查询所有的使用资源信息
	 */
	public List<UseDataBean> getAllCloudInfo();
	public List<UseDataBean> getAllCloudInfoByRa(int status);
	/**
	 * 添加云平台资源类型
	 * @param server
	 * @return
	 */
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
