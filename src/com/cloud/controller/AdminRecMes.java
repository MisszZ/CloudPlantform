package com.cloud.controller;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.UserSendMesBean;
import com.cloud.service.AdminRecMesService;
import com.cloud.service.CloudResourceService;
/**
 * 管理员处理的私信消息
 * @author somoOne
 *
 */
@Controller
public class AdminRecMes {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	@Autowired
	private AdminRecMesService adminRecMesService;
	//查看消息
	@RequestMapping("/adminLookMes.htm")
	public String lookMesg(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			List<UserSendMesBean> msgList=adminRecMesService.lookMesg();
		/*	for(UserSendMesBean t:msgList){
				System.out.println(t.getTarget());
			}*/
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			request.setAttribute("mesList", msgList);
			return "admin/pages/yhxx";
		}
	}
	//回复消息
	@RequestMapping("/adminResMesg.htm")
	public void resMes(HttpServletRequest request,HttpServletResponse response,UserSendMesBean userSendMesBean) throws IOException{
		//System.out.println("回复消息");
		PrintWriter out=response.getWriter();
		Boolean flag=adminRecMesService.resMesg(userSendMesBean);
		out.print(flag);
	}
	
}
