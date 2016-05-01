package com.cloud.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.MachineNameBean;
import com.cloud.entity.SomeInfoOfMaBean;
import com.cloud.entity.UseDataBean;
import com.cloud.entity.UserGetMachineBean;
import com.cloud.mapper.UserHaveResInfoMapper;
import com.cloud.service.UserHaveResInfoService;
@Service
public class UserHaveResInfoServiceImpl implements UserHaveResInfoService {
	@Resource(name="userHaveResInfoMapper")
	UserHaveResInfoMapper userHaveResInfoMapper;
	public List<MachineNameBean> searchResource(String email) {
		//int num=userHaveResInfoMapper.haveMachine(email);
		//System.out.println("资源数量  "+num);
		return userHaveResInfoMapper.searchResource(email);
//		if(num!=0){
//			return userHaveResInfoMapper.searchResource(email);
//		}else{
//			System.out.println("测试方法");
//			return null;
//		}
	}
	public List<UseDataBean> getMachineInfo(UserGetMachineBean userGetMachineBean) {
		return userHaveResInfoMapper.getMachineInfo(userGetMachineBean);
	}
	public UseDataBean getFirstInfo(String email) {
		return userHaveResInfoMapper.getFirstInfo(email);
	}
	public List<SomeInfoOfMaBean> getSomeInfoOfirFMa(String email) {
		UserGetMachineBean userGetMachineBean =new UserGetMachineBean();
		userGetMachineBean.setMachineName(userHaveResInfoMapper.getFirName(email));
		userGetMachineBean.setEmail(email);
		return userHaveResInfoMapper.getSomeInfoOfirFMa(userGetMachineBean);
	}
}
