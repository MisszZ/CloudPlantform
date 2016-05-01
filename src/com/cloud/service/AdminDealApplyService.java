package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.AdminDealApplyBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface AdminDealApplyService extends SqlMapper {
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
	public Boolean agreeApply(AdminDealApplyBean adminDealApplyBean);
	/**
	 * 审核结果处理/拒绝
	 * @param useData
	 * @return
	 */
	public Boolean rejectApply(AdminDealApplyBean adminDealApplyBean);
	/**
	 * 查看虚机个数
	 */
	public int getMachineNum();
}
