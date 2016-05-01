package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.CounterBean;
import com.cloud.service.AddPerMacService;
import com.cloud.service.CloudResourceService;

@Controller
//@RequestMapping("/addPerMac")
public class AddPesMac {

	/**
	 * 录入个人办公机账号
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@Resource(name = "addPerMacServiceImpl")
	AddPerMacService addPerMacService;
	@Resource(name = "cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	// 跳转到录入账号
	@RequestMapping("/addPerMacNum.htm")
	public String tolrzh(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			int addTimeStat = cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			return "admin/pages/lrzh";
		}
	}
	//录入新的个人办公机账号
	@RequestMapping("/addCounter.htm")
	public void addCounter(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
			CounterBean counterBean = new CounterBean();
			PrintWriter out = response.getWriter();
			counterBean.setPersonalMachineNum(request.getParameter("numb"));
			counterBean.setPersonalMachinePwd(request.getParameter("pwd"));
			counterBean.setSystemType(request.getParameter("systemType"));
			Boolean a = addPerMacService.addAccount(counterBean);
			if (a.equals(true)) {
				out.println(1);
				out.flush();
			} else {
				out.println(0);
				out.flush();
			}
		}
	}
