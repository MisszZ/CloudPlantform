package com.cloud.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cloud.entity.MachineNameBean;
import com.cloud.entity.SomeInfoOfMaBean;
import com.cloud.entity.UseDataBean;
import com.cloud.entity.UserGetMachineBean;
import com.cloud.mapper.SqlMapper;
@Service
public interface UserHaveResInfoService extends SqlMapper {

	// 查看申请到的资源
	public List<MachineNameBean> searchResource(String email);
	//外网IP，外端口号，内端口号
	public List<SomeInfoOfMaBean> getSomeInfoOfirFMa(String email);
	//根据名称查看虚机信息
	public UseDataBean getFirstInfo(String email);
	public List<UseDataBean> getMachineInfo(UserGetMachineBean userGetMachineBean);
}
