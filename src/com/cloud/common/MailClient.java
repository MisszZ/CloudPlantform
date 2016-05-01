package com.cloud.common;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

public class MailClient {

	public static void main(String[] args) throws Exception {
		Socket socket = new Socket("smtp.163.com",25);//telnet smtp.163.com 25
		InputStream in = socket.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in));// 接收服务器的反馈信息
		OutputStream out = socket.getOutputStream();//向服务器发送信息
		
		out.write("ehlo wzt\r\n".getBytes());
		System.out.println(br.readLine());
		System.out.println(br.readLine());
		System.out.println(br.readLine());
		System.out.println(br.readLine());
		System.out.println(br.readLine());
		System.out.println(br.readLine());
		System.out.println(br.readLine());
		
		out.write("auth login\r\n".getBytes());
		System.out.println(br.readLine());
		out.write("aXRoZWltYWNsb3Vk\r\n".getBytes());
		System.out.println(br.readLine());
		out.write("aWFtc29ycnk=\r\n".getBytes());
		System.out.println(br.readLine());
		out.write("mail from:<cloud_webtest@163.com>\r\n".getBytes());
		System.out.println(br.readLine());
		out.write("rcpt to:<wltserius@163.com>\r\n".getBytes());
		System.out.println(br.readLine());
		out.write("data\r\n".getBytes());
		System.out.println(br.readLine());
		out.write("from:cloud_webtest@163.com\r\n".getBytes());
		out.write("to:wltserius@163.com\r\n".getBytes());
		out.write("subject:haha\r\n".getBytes());
		out.write("\r\n".getBytes());
		out.write("亲！今晚12点荒郊野地见。哪个野地，就是上次哪个。云，我等你哦。手机没有电，你也不用回复邮件，直接去即可，不见不散哦，亲。\r\n".getBytes());
		out.write(".\r\n".getBytes());
		socket.close();// quit
	}

}

