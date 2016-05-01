package com.cloud.serviceImpl;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

import com.cloud.common.MD5;
import com.cloud.common.SendMail;
import com.cloud.entity.UserInfoBean;
import com.cloud.mapper.AdminManageUserMapper;
import com.cloud.mapper.LoginMapper;
import com.cloud.service.AdminManageUserService;

@Service
public class AdminManageUserServiceImpl implements AdminManageUserService {
	@Resource(name = "adminManageUserMapper")
	private AdminManageUserMapper adminManageUserMapper;
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;
	// 添加用户
	public Boolean addUser(UserInfoBean userInfoBean) {
		int num=adminManageUserMapper.isSigin(userInfoBean.getEmail());
		if(num!=0){
			return false;
		}
		return adminManageUserMapper.addUser(userInfoBean);
	}

	// 删除单个用户
	//判断用户是否有在使用资源
	public int ifUseCloud(String userEmail){
		return adminManageUserMapper.ifUseCloud(userEmail);
	}
	public Boolean deleteUser(String userEmail) {
		if(ifUseCloud(userEmail)==0){
			return adminManageUserMapper.delete(userEmail);
		}else{
			return false;
		}
	}
	//
	public Boolean updateUser(String email) {
		return adminManageUserMapper.update(email);
	}

	// 获得所有用户的信息
	public List<UserInfoBean> allUserInfo() {
		return adminManageUserMapper.allUserInfo();
	}

	public List<UserInfoBean> getUserInfoByName(String name) {
		return adminManageUserMapper.getUserInfoByName(name);
	}
	//重置用户密码
	public Boolean initPwd(String email) {
		int flag;
		Random random=new Random();
		String newpwd=Integer.toString((int)random.nextInt(1000000));
		//System.out.println("加密前：  "+newpwd);
		try {
			flag=SendMail.sendMail(email,newpwd,null,null);
			if(flag==0){
				String user_pwd=MD5.MD5Encode(newpwd);
				//System.out.println("加密后的密码：  "+user_pwd);
				UserInfoBean userInfoBean=new UserInfoBean();
				userInfoBean.setEmail(email);
				userInfoBean.setUser_pwd(user_pwd);
				Boolean state=loginMapper.initPwd(userInfoBean);
				return state;
			}else{
				return false;
			}
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
