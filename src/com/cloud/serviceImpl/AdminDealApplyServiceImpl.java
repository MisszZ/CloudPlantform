package com.cloud.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.AdminDealApplyBean;
import com.cloud.mapper.AdminDealApplyMapper;
import com.cloud.service.AdminDealApplyService;
@Service
public class AdminDealApplyServiceImpl implements AdminDealApplyService {
	@Resource(name="adminDealApplyMapper")
	AdminDealApplyMapper adminDealApplyMapper;
	/**
	 * 对提交的申请进行审批
	 */
	public List<AdminDealApplyBean> checkApply() {
		return adminDealApplyMapper.checkApply();
	}
	/**
	 * 审核结果处理/同意
	 */
	public Boolean agreeApply(AdminDealApplyBean adminDealApply) {
//		System.out.println("用途  "+adminDealApply.getUses());
//		System.out.println("用户     "+adminDealApply.getEmail());
//		System.out.println("系统类型  "+adminDealApply.getSystemType());
//		System.out.println("INop "+adminDealApply.getInPortTrue());
		System.out.println("域名 "+adminDealApply.getDomainName());
		return adminDealApplyMapper.agreeApply(adminDealApply);
	}
	/**
	 * 审核结果处理/拒绝
	 */
	public Boolean rejectApply(AdminDealApplyBean adminDealApply) {
		//System.out.println("ServiceImpl  "+adminDealApply.getReason());
		return adminDealApplyMapper.rejectApply(adminDealApply);
	}
	/**
	 * 查看虚机个数
	 */
	public int getMachineNum() {
		return adminDealApplyMapper.getMachineNum();
	}

}
