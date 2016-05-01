package com.cloud.serviceImpl;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

import com.cloud.common.MD5;
import com.cloud.common.SendMail;
import com.cloud.entity.AdminBean;
import com.cloud.entity.UserInfoBean;
import com.cloud.mapper.LoginMapper;
import com.cloud.service.LoginService;

@Service
public class LoginServiveImpl implements LoginService {
	
	@Resource(name="loginMapper")
	private LoginMapper loginMapper;

	//管理员登陆
	public String adminLogin(String email, String pwd) {

		if(email!=null&&!"".equals(email)&&pwd!=null&&!"".equals(pwd)){
			String adm=loginMapper.adminlogin(email);
			//System.out.println("数据库"+adm+"   页面输入"+pwd);
			//pwd=MD5.MD5Encode(pwd);
			if(adm!=null&&!"".equals(adm)){
				if(adm.equals(pwd))
					return "success";
				else 
					return "error";
			}
			else 
				return "error";
		}
		else  
			return "error";
	}
	//用户登录
	public String userLogin(String email, String pwd) {
		if(email!=null&&!"".equals(email)&&pwd!=null&&!"".equals(pwd)){
			String userpwd=loginMapper.userlogin(email);
//			//pwd=MD5.MD5Encode(pwd);
//			System.out.println("数据库"+userpwd);
//			System.out.println("输入"+pwd);
			if(userpwd!=null&&!"".equals(userpwd)){
				if(userpwd.equals(pwd))
					return "success";
				else 
					return "error";
			}
			else 
				return "error";
		}
		else  
			return "error";
	}
	//用户获得新密码
	
	//用户身份验证
	public String userActivate(String name, String email) {

		if(name!=null&&!"".equals(name)){
			int flag;
			String dataEmail=loginMapper.userActivate(name);
//			System.out.println(dataEmail);
//			System.out.println(email);
			if(dataEmail!=null&&!"".equals(dataEmail)){
				if(dataEmail.equals(email)){
					Random random=new Random();
					String newpwd=Integer.toString((int)random.nextInt(1000000));
					//System.out.println("加密前：  "+newpwd);
					try {
						flag=SendMail.sendMail(email,newpwd,null,null);
						if(flag==0){
							String user_pwd=MD5.MD5Encode(newpwd);
							//System.out.println("加密后的密码：  "+user_pwd);
							UserInfoBean userInfoBean=new UserInfoBean();
							userInfoBean.setEmail(dataEmail);
							userInfoBean.setUser_pwd(user_pwd);
							Boolean state=loginMapper.initPwd(userInfoBean);
							if(state==true){
								return "success";
							}else{
								return "error";
							}
						}else{
							return "error";
						}
					} catch (AddressException e) {
						e.printStackTrace();
					} catch (MessagingException e) {
						e.printStackTrace();
					}
					return "success";
				}	
				else 
					return "error";
			}
			else 
				return "error";
		}
		else  
			return "error";
	}
	//管理员修改密码
	public Boolean adminResetPwd(AdminBean admin,String oldPwd) {
		String dbPwd=loginMapper.getAdminPwd(admin.getEmail());
//		System.out.println("dbPwd   "+dbPwd);
//		System.out.println("shuru   "+oldPwd);
		if(dbPwd.equals(oldPwd)){
		//if(dbPwd==oldPwd){
			//System.out.println("yes");
			return loginMapper.adminResetPwd(admin);
		}else{
			//System.out.println("no");
			return false;
		}
	}
}
