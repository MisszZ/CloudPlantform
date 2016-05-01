package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.UserApplyPerCodBean;
import com.cloud.service.CloudResourceService;
import com.cloud.service.UserApplPerService;

@Controller
public class UserApplPer {
	@Resource(name = "userApplPerServiceImpl")
	UserApplPerService userApplPerService;
	@Resource(name = "cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;

	// 用户跳转到申请个人办公机状态页面
	@RequestMapping("/getPersonal.htm")
	public String getPersonal(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("userEmail")==null){
			return "admin/pages/index";
		}else{
			int addTimeStat = cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			return "user/pages/office_cpt";
		}
	}
	@RequestMapping("/userApplPer.htm")
	public void userApplPerNum(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserApplyPerCodBean userApplyPerCodBean = new UserApplyPerCodBean();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		userApplyPerCodBean
				.setEmail((String) session.getAttribute("userEmail"));
		userApplyPerCodBean.setSystemType(request.getParameter("system"));
		int num = userApplPerService.lookPerNum(userApplyPerCodBean);
		out.print(num);
		out.flush();
	}
}
