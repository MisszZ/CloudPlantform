package com.cloud.service;

import org.springframework.stereotype.Service;

import com.cloud.entity.CounterBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface AddPerMacService extends SqlMapper {
	// 录入虚机账号
	public Boolean addAccount(CounterBean counterBean);
}
