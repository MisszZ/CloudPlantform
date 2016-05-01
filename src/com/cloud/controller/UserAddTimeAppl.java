package com.cloud.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.AddTimeResInfoBean;
import com.cloud.entity.UserAddTimeApplBean;
import com.cloud.service.CloudResourceService;
import com.cloud.service.UserAddTimeApplService;

@Controller
//@RequestMapping("/userAddTimeAppl")
public class UserAddTimeAppl {
	@Resource(name="userAddTimeApplServiceImpl")
	UserAddTimeApplService userAddTimeApplService;
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	//获得续期资源信息
	@RequestMapping("/lookAllRes.htm")
	public String getAddResTime(HttpServletRequest request){
		HttpSession session=request.getSession();
		if(session.getAttribute("userEmail")==null){
			return "admin/pages/index";
		}else{
			List<AddTimeResInfoBean> info=userAddTimeApplService.getAddTimeResInfo((String)session.getAttribute("userEmail"));
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			request.setAttribute("info", info);
			return "user/pages/adddata";
		}
	}
	// 用户资源续期
	@RequestMapping("/applyAddDate.htm")
	public void lookRenewalNum(HttpServletRequest request,HttpServletResponse response ) throws IOException {
		HttpSession session=request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		UserAddTimeApplBean userAddTimeApplBean=new UserAddTimeApplBean();
		PrintWriter out = response.getWriter();
//		System.out.println("coo 名称  "+request.getParameter("machineName"));
//		System.out.println("coo 时间  "+request.getParameter("newTime"));
		/*String machineName=new String (request.getParameter("machineName").getBytes("iso-8859-1"), "utf-8");
		String newTime=new String (request.getParameter("newTime").getBytes("iso-8859-1"), "utf-8");*/
		String machineName=request.getParameter("machineName");
		String newTime=request.getParameter("newTime");
		userAddTimeApplBean.setMachineName(machineName);
		userAddTimeApplBean.setTimed(newTime);
		userAddTimeApplBean.setEmail((String)session.getAttribute("userEmail"));
		int num = userAddTimeApplService.lookRenewalNum(userAddTimeApplBean);
		out.println(num);
		out.flush();
	}
}
