package com.cloud.mapper;

import java.util.List;

import com.cloud.entity.MachineNameBean;
import com.cloud.entity.SomeInfoOfMaBean;
import com.cloud.entity.UseDataBean;
import com.cloud.entity.UserGetMachineBean;

public interface UserHaveResInfoMapper extends SqlMapper {
	// 查看申请到的资源
	public List<MachineNameBean> searchResource(String email);

	//是否有申请到的资源
	public int haveMachine(String email);
	//根据名称查看虚机信息
	public UseDataBean getFirstInfo(String email);
	//第一个虚机名称
	public String getFirName(String email);
	//外网IP，外端口号，内端口号
	public List<SomeInfoOfMaBean> getSomeInfoOfirFMa(UserGetMachineBean userGetMachineBean);
	public List<UseDataBean> getMachineInfo(UserGetMachineBean userGetMachineBean);
}
