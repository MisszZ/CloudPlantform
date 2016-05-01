package com.cloud.common;


import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public class Test {

	/**
	 * @param args
	 * @throws MessagingException 
	 * @throws AddressException 
	 */
	public static void main(String[] args) throws AddressException, MessagingException {
		String email="1007852250@qq.com";
		Random random=new Random();
		String newpwd=Integer.toString((int)random.nextInt(1000000));
		//int newpwd=(int)(Math.random()*9+1)*100000;
		System.out.println(newpwd);
		SendMail.sendMail(email,newpwd,"0","0");
	}

}
