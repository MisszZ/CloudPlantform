package com.cloud.mapper;

public interface AddTimeSetMapper extends SqlMapper {
	// 更改续期设置
	// 获得续期开关状̬
	public int getStatus();
	public Boolean addTimeSet(int info);
}
