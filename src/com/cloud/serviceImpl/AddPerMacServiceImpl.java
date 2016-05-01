package com.cloud.serviceImpl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.CounterBean;
import com.cloud.mapper.AddPerMacMapper;
import com.cloud.service.AddPerMacService;
@Service
public class AddPerMacServiceImpl implements AddPerMacService {
	@Resource(name="addPerMacMapper")
	AddPerMacMapper addPerMacMapper;
	public Boolean addAccount(CounterBean counterBean) {
		//InitPwd pwd=new InitPwd();
//		Random random=new Random();
//		String newpwd=Integer.toString((int)random.nextInt(1000000));
//		counterBean.setPersonalMachinePwd(counterBean.getPersonalMachinePwd());
		String system=counterBean.getSystemType();
		if(system.equals("1"))
			counterBean.setSystemType("win7");
		else if(system.equals("2"))
			counterBean.setSystemType("win8");
		else
			counterBean.setSystemType("win10");
		//System.out.println("办公机类型"+counterBean.getSystemType());
		return addPerMacMapper.addAccount(counterBean);
	}

}
