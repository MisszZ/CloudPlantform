package com.cloud.mapper;

import com.cloud.entity.CounterBean;

public interface AddPerMacMapper extends SqlMapper {

	// 录入虚机账号
	public Boolean addAccount(CounterBean counter);
}
