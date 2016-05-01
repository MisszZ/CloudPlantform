package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.UserSendMesBean;
import com.cloud.service.UserSendMesService;
/**
 * 用户给管理员发私信
 * @author somoOne
 *
 */
@Controller
public class UserSendMes {
	@Autowired
	private UserSendMesService userSendMesService;
	@Autowired
	private UserSendMesBean userSendMesBean;
	@RequestMapping("/readMesage.htm")
	public String readMesg(HttpServletRequest request){
		HttpSession session=request.getSession();
		if(session.getAttribute("userEmail")==null){
			return "admin/pages/index";
		}else{
			List<UserSendMesBean> mesList=userSendMesService.adminMes((String)session.getAttribute("userEmail"));
			request.setAttribute("mesList", mesList);
			return "user/pages/make_news";
		}
	}
	/*
	 * 用户向管理员发消息
	 */
	@RequestMapping("/sendMes.htm")
	public void sendMes(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		//System.out.println("转码前  "+request.getParameter("content"));
		//String content=new String (request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
		String content=request.getParameter("content");
		//System.out.println(userSendMesBean);
		userSendMesBean.setContent(content);
		userSendMesBean.setEmail((String)session.getAttribute("userEmail"));
		//System.out.println("内容"+content);
		Boolean flag=userSendMesService.userSendMes(userSendMesBean);
		out.print(flag);
	}
}
