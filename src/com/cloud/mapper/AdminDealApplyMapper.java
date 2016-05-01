package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.AdminDealApplyBean;

public interface AdminDealApplyMapper extends SqlMapper {
	/**
	 * 对提交的申请进行审批
	 * @return
	 */
	public List<AdminDealApplyBean> checkApply();
	/**
	 * 审核结果处理/同意
	 * @param useData
	 * @return
	 */
	public Boolean agreeApply(AdminDealApplyBean adminDealApply);
	/**
	 * 审核结果处理/拒绝
	 * @param useData
	 * @return
	 */
	public Boolean rejectApply(AdminDealApplyBean adminDealApply);
	/**
	 * 查看虚机个数
	 */
	public int getMachineNum();
}
