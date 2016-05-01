package com.cloud.serviceImpl;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

import com.cloud.common.MD5;
import com.cloud.common.SendMail;
import com.cloud.entity.UserApplPerBean;
import com.cloud.entity.UserApplyPerCodBean;
import com.cloud.mapper.UserApplPerMapper;
import com.cloud.service.UserApplPerService;

@Service
public class UserApplPerServiceImpl implements UserApplPerService {
	@Resource(name = "userApplPerMapper")
	UserApplPerMapper userApplPerMapper;
	// 查看办公机的类型是否还有？
	public int lookPerNum(UserApplyPerCodBean userApplyPerCodBean) {
		String systemType;
		int num = userApplPerMapper.havePer(userApplyPerCodBean.getEmail());
		if (num == 0) {
			UserApplPerBean userApplPerBean = new UserApplPerBean();
			userApplPerBean.setEmail(userApplyPerCodBean.getEmail());
			if (userApplyPerCodBean.getSystemType().equals("0")) {
				systemType = "win7";
				int num1 = userApplPerMapper.lookPerNum(systemType);
				if (num1 == 0) {
					return 7;
				} else {
					userApplPerBean= userApplPerMapper.userApplPer(systemType);
					userApplPerBean.setEmail(userApplyPerCodBean.getEmail());
					userApplPerBean.setSystemType(systemType);
					String userpwd = userApplPerBean.getPersonalMachinePwd();
					userApplPerBean.setPersonalMachinePwd(MD5.MD5Encode(userApplPerBean.getPersonalMachinePwd()));
					userApplPerBean.setSystemType(systemType);
					return userApplPer(userApplyPerCodBean, userApplPerBean,userpwd);
				}
			} else if (userApplyPerCodBean.getSystemType().equals("1")) {
				systemType = "win8";
				int num2 = userApplPerMapper.lookPerNum(systemType);
				if (num2 == 0) {
					return 8;
				} else {
					userApplPerBean= userApplPerMapper.userApplPer(systemType);
					String userpwd = userApplPerBean.getPersonalMachinePwd();
					userApplPerBean.setEmail(userApplyPerCodBean.getEmail());
					userApplPerBean.setSystemType(systemType);
					userApplPerBean.setPersonalMachinePwd(MD5.MD5Encode(userApplPerBean.getPersonalMachinePwd()));
					userApplPerBean.setSystemType(systemType);
					return userApplPer(userApplyPerCodBean, userApplPerBean,userpwd);
				}
			} else{
				systemType = "win10";
				int num3 = userApplPerMapper.lookPerNum(systemType);
				if (num3 == 0) {
					return 10;
				} else {
					userApplPerBean= userApplPerMapper.userApplPer(systemType);
					String userpwd = userApplPerBean.getPersonalMachinePwd();
					userApplPerBean.setEmail(userApplyPerCodBean.getEmail());
					userApplPerBean.setSystemType(systemType);
					userApplPerBean.setPersonalMachinePwd(MD5.MD5Encode(userApplPerBean.getPersonalMachinePwd()));
					userApplPerBean.setSystemType(systemType);
					return userApplPer(userApplyPerCodBean, userApplPerBean,userpwd);
				}
			}
		}
		return 3;
	}
	public int userApplPer(UserApplyPerCodBean userApplyPerCodBean,
			UserApplPerBean userApplPerBean,String userpwd) {
		int res=0;
		Boolean a = userApplPerMapper.setPerNumber(userApplPerBean);
		Boolean b = userApplPerMapper.setStatusNum(userApplPerBean.getPersonalMachineNum());
		try {
			int flag = SendMail.sendMail(userApplyPerCodBean.getEmail(), null,
					"个人办公机的账号是" + userApplPerBean.getPersonalMachineNum()
							+ "密码是" + userpwd, "个人办公机申请结果");
			if(a==true&&b==true&&flag==0) {
				res = 1;
			} else
				res = 2;
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return res;
	}
}
