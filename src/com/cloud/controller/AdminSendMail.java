package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.AdminSendEmailBean;
import com.cloud.service.AdminSendEmailService;
import com.cloud.service.CloudResourceService;


@Controller
public class AdminSendMail {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	@Resource(name="adminSendEmailImpl")
	private AdminSendEmailService adminSendEmailService;
	//跳转到发送邮件
	@RequestMapping("/userList.htm")
	public String tofsyj(HttpServletRequest request){
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			List<AdminSendEmailBean> userInfo=adminSendEmailService.getUserInfo();
			List<AdminSendEmailBean> userInfoOther=adminSendEmailService.getOtherUserInfo();
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			request.setAttribute("userInfo", userInfo);
			request.setAttribute("userInfoOther", userInfoOther);
			return "admin/pages/fsyj";
		}
	}
	/**
	 * 简单分页，取出剩下的用户信息
	 * @throws IOException 
	 */
//	@RequestMapping("/getOtherUserInfo")
//	public void getOtherInfo(HttpServletResponse response) throws IOException{
//		response.setContentType("text/html;charset=UTF-8");
//		System.out.println("获取更多用户");
//		PrintWriter out = response.getWriter();
//		List<AdminSendEmailBean> userInfo=adminSendEmailService.getOtherUserInfo();
//		JSONArray array = JSONArray.fromObject(userInfo);
//		out.println(array);
//		out.flush();
//	}
	/**
	 * 发送邮件
	 * @param request
	 * @throws IOException 
	 */
	@RequestMapping("/adminSendEmail.htm")
	public void sendEmail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		//List<String> list = new ArrayList<String>();
		int num = 0;
//		String userNames=new String (request.getParameter("emailList").getBytes("iso-8859-1"), "utf-8");
//		String content=new String (request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
//		String title=new String (request.getParameter("title").getBytes("iso-8859-1"), "utf-8");
		String userNames=request.getParameter("emailList");
		String content=request.getParameter("content");
		String title=request.getParameter("title");
		//System.out.println(userNames);
		List<String> emailList=adminSendEmailService.sendEmail(userNames,content,title);
//		String email=request.getParameter("emailList");
//		String emailList[] = email.split(",");
//		for (int i=0;i<emailList.length;i++) {
//			//在此调用发送邮件的方法
//			System.out.println("删除邮箱"+emailList[i]);
//		}
//		for(String s:emailList){
//			num++;
//		}
		if (num == 0) {
			out.println(1);
			out.flush();
		} else {
			JSONArray array = JSONArray.fromObject(emailList);
			out.println(array);
			out.flush();
		}
	}
}
