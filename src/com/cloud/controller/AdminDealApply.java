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

import com.cloud.service.AdminDealApplyService;
import com.cloud.service.CloudResourceService;
import com.cloud.entity.AdminDealApplyBean;

/**
 * 管理员审核申请
 * 
 * @author somoOne
 * 
 */
@Controller
//@RequestMapping("/adminDealApply")
public class AdminDealApply {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	@Resource(name = "adminDealApplyServiceImpl")
	private AdminDealApplyService adminDealApplyService;

	/**
	 * 对提交的申请进行审批
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("/adminCheckApply.htm")
	public String checkApply(HttpServletRequest request,
			AdminDealApply adminDealApply) {
		HttpSession session = request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			//System.out.println(session.getAttribute("flag").getClass());
			int temp=Integer.parseInt(session.getAttribute("flag").toString())+1;
			if(temp==10){
				temp=3;
			}
			//System.out.println(temp);
			session.setAttribute("flag", temp);
			List<AdminDealApplyBean> Info = adminDealApplyService.checkApply();
			int machineNum=adminDealApplyService.getMachineNum();
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			request.setAttribute("machineNum", machineNum);
			request.setAttribute("info", Info);
			return "admin/pages/shsq";
		}
	}

	/**
	 * 审核结果处理/同意
	 * 
	 * @param request
	 * @param useData
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/adminAgreeApply.htm")
	public void AgreeApply(HttpServletRequest request,
			AdminDealApplyBean adminDealApplyBean, HttpServletResponse response)
			throws IOException {
		//System.out.println("封装信息" + adminDealApplyBean.getInPortTrue());
		adminDealApplyBean.setState(1);
		/*System.out.println("域名 "+adminDealApplyBean.getDomainName());*/
		Boolean a = adminDealApplyService.agreeApply(adminDealApplyBean);
		//System.out.println("jieguo  "+ a);
		if (a==true) {
			PrintWriter out = response.getWriter();
			out.println(1);
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println(0);
			out.flush();
		}
	}

	/**
	 * 审核结果处理/拒绝
	 * 
	 * @param request
	 * @param useData
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/adminRejectApply.htm")
	public void RejectApply(HttpServletRequest request,
			AdminDealApplyBean adminDealApplyBean, HttpServletResponse response)
			throws IOException {
		//System.out.println("拒绝理由" + adminDealApplyBean.getEmail());
		adminDealApplyBean.setState(2);
		Boolean a = adminDealApplyService.rejectApply(adminDealApplyBean);
		if (a==true) {
			PrintWriter out = response.getWriter();
			out.println(1);
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println(0);
			out.flush();
		}
	}
}
