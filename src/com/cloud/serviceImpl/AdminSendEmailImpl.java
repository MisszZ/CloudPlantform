package com.cloud.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

import com.cloud.common.SendMail;
import com.cloud.entity.AdminSendEmailBean;
import com.cloud.mapper.AdminSendEmailMapper;
import com.cloud.service.AdminSendEmailService;
/**
 * 管理员发送邮件的方法接口
 * @author somoOne
 *
 */
@Service
public class AdminSendEmailImpl implements AdminSendEmailService {

	private int flagNun=0;
	@Resource(name="adminSendEmailMapper")
	private AdminSendEmailMapper adminSendEmailMapper;
	//获取用户信息
	public List<AdminSendEmailBean> getUserInfo() {
		flagNun=0;
		return adminSendEmailMapper.getUserInfo();
	}
	//获取其他用户信息
	public  List<AdminSendEmailBean> getOtherUserInfo() {
		if(flagNun==0){
			//获取用户总数
			int num=adminSendEmailMapper.getUserCount();
			flagNun=1;
			//System.out.println(num);
			//获取其他用户信息
			return adminSendEmailMapper.getOtherUserInfo(num);
		}else
			return null;
	}
	//发送邮件
	public List<String> sendEmail(String userNames,String content,String title) {
		flagNun=0;
		List<String> failList=new ArrayList<String>();
		String emailList[] = userNames.split(";");
		for (int i=0;i<emailList.length;i++) {
			int flag=0;
			try {
				//System.out.println("删除邮箱"+adminSendEmailMapper.getEmail(emailList[i]));
				flag=SendMail.sendMail(adminSendEmailMapper.getEmail(emailList[i]),null,content,title);
				//System.out.println(flag);
				if(flag==1){
					failList.add(emailList[i]);
					//System.out.println("删除邮箱"+adminSendEmailMapper.getEmail(emailList[i]));
				}
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		return failList;
	}
}
