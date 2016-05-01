package com.cloud.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public static int sendMail(String email,String pwd,String content,String title) throws AddressException, MessagingException {
		
		Properties props = System.getProperties();//环境变量设置。发送邮件时才需要
		props.setProperty("mail.transport.protocol", "smtp");//发送使用的协议
		props.setProperty("mail.host", "222.24.19.131");//发送服务器的主机地址
		props.setProperty("mail.smtp.auth", "true");//请求身份验证
		Session session = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(session);//代表一封邮件
		
		message.setFrom(new InternetAddress("cloud@xupt.edu.cn"));//设置发件人
		message.setRecipients(Message.RecipientType.TO, email);//设置收件人
		if(title==null)
			title="激活账号的邮件";
		message.setSubject(title);//设置主体
		//设置邮件的正文内容
		if(content==null){
			content="感谢您使用云平台自助服务系统，您的登录密码："+pwd+","+"此条消息由系统发出，不用回复";
		}
		message.setText(content);
		message.saveChanges();
		//发送邮件
		Transport ts = session.getTransport();//得到火箭
		int flag=0;
		try{
			ts.connect("cloud@xupt.edu.cn", "cloud2016/1/5");//连接
			System.out.println("邮箱链接成功");
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		}catch(MessagingException e) {
			flag=1;
		}
		System.out.println("邮件发送成功");
		return flag;
	}
}
