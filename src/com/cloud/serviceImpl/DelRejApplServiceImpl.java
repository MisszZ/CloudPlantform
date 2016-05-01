package com.cloud.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.DelRejApplBean;
import com.cloud.mapper.DelRejApplMapper;
import com.cloud.service.DelRejApplService;
@Service
public class DelRejApplServiceImpl implements DelRejApplService {
	@Resource(name="delRejApplMapper")
	DelRejApplMapper delRejApplMapper;
	public List<DelRejApplBean> rejectedApplyList() {
		return delRejApplMapper.rejectedApplyList();
	}

	public Boolean deleteRejectedApply(String email) {
		//System.out.println(email);
		return delRejApplMapper.deleteRejectedApply(email);
	}

}
