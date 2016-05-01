package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.AdminDealApplyBean;
import com.cloud.entity.ServerBean;
import com.cloud.entity.UseDataBean;
import com.cloud.service.CloudResourceService;
import com.cloud.service.HaveInfoService;

@Controller
//@RequestMapping("/CloudResource")
public class CloudResource {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	@Resource(name = "haveInfoServiceImpl")
	private HaveInfoService haveInfoService;
	//跳转到查询信息
	@RequestMapping("/searchResource.htm")
	public String tozyxx(HttpServletRequest request){
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat",addTimeStat);
			return "admin/pages/zyxx";
		}
	}
	//跳转到录入虚机模板
	@RequestMapping("/addMachineType.htm")
	public String adminAddType(HttpServletRequest request){
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			return "admin/pages/lrzy";
		}
	}
	// 多条件联合查询
	@RequestMapping("/searchResult.htm")
	public void search(HttpServletRequest request, HttpServletResponse response,UseDataBean useData)
			throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("用户姓名"+useData.getName());
		List<UseDataBean> usedinfo = cloudResourceService.search(useData);
		JSONArray array = JSONArray.fromObject(usedinfo);
		PrintWriter out = response.getWriter();
		out.println(array);
		out.flush();
	}
	// 添加云平台服务器类型
	// 同时加，还是分开添加
	@RequestMapping("/adminAddMachineType.htm")
	public void addType(HttpServletRequest request, ServerBean server,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/json;charset=UTF-8");
		Boolean a = cloudResourceService.addType(server);
		if (a.equals(true)) {
			out.println(1);
			out.flush();
		} else {

			out.println(0);
			out.flush();
		}
	}
	//查看所有虚机操作系统类型
	@RequestMapping("/lookAllSyso.htm")
	public void lookAllSys(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<ServerBean> systemInfo = haveInfoService.serverSystemInfo();
		response.setContentType("text/json;charset=UTF-8");
		JSONArray array = JSONArray.fromObject(systemInfo);
		PrintWriter out = response.getWriter();
		out.println(array);
		out.flush();
	}
	//删除虚机模板
	@RequestMapping("/delOneSyso.htm")
	public void dellOneSyso(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String systemType=request.getParameter("systemType");
		boolean res=cloudResourceService.delOneSyso(systemType);
		PrintWriter out = response.getWriter();
		if (res==true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	//增加用户虚机端口号，获取信息
	@RequestMapping("/getUserAllpyInfo.htm")
	public void getUserInfo(HttpServletRequest request,HttpServletResponse response,AdminDealApplyBean adminDealApplyBean) throws IOException{
		PrintWriter out =null;
		/* 设置格式为text/json*/
        response.setContentType("text/json"); 
        /*设置字符集为'UTF-8'*/
        response.setCharacterEncoding("UTF-8"); 
		out = response.getWriter();
		AdminDealApplyBean userApplInfo=cloudResourceService.getUserInfo(adminDealApplyBean);
		//System.out.println("获得信息   "+request.getParameter("email"));
		//System.out.println("用户  "+userApplInfo.getName());
		JSONArray array = JSONArray.fromObject(userApplInfo);
		out.println(array);
		out.flush();
	}
	//获取申请信息
	/*@RequestMapping("/getApplyInfo")
	public void getApplInfo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		response.setContentType("text/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		AdminDealApplyBean userApplInfo=cloudResourceService.getUserInfo(request.getParameter("email"));
		//System.out.println("获得信息   "+request.getParameter("email"));
		Date currentDate = new Date(
				System.currentTimeMillis());
		String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(currentDate);
		userApplInfo.setTime(dateStr);
		//System.out.println("是否乱码    "+userApplInfo.getName());
		JSONArray array = JSONArray.fromObject(userApplInfo);
		out.println(array);
		out.flush();
	}*/
	//添加虚机
	@RequestMapping("/addUserMachineOther.htm")
	public void addUserMachine(HttpServletRequest request,HttpServletResponse response,AdminDealApplyBean adminDealApply) throws IOException{
		Boolean info = cloudResourceService.addUserMachine(adminDealApply);
		PrintWriter out = response.getWriter();
		if (info==true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	//删除到期虚机
	@RequestMapping("/delTiemdMac.htm")
	public void deltimed(HttpServletRequest request,HttpServletResponse response,UseDataBean useData) throws IOException{
		PrintWriter out = response.getWriter();
		Boolean info=cloudResourceService.delTimed(useData);
		
		if (info==true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
}
