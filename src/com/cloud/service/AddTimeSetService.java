package com.cloud.service;

import com.cloud.mapper.SqlMapper;

public interface AddTimeSetService extends SqlMapper {
	// 更改续期设置
	public Boolean addTimeSet();
}
