package com.cloud.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.service.CloudResourceService;
//页面跳转功能
@Controller
//@RequestMapping("/userToAdm")
public class MesToAdm {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	//跳转到首页
	@RequestMapping("/toIndex")
	public String toIndex(HttpServletRequest request){
		return "admin/pages/index";
	}
	//***************************************************//
	//用户页面跳转
	//***************************************************//
	//用户跳转到发送消息
//	@RequestMapping("/passMes")
//	public String passMes(HttpServletRequest request){
//		return "WEB-INF/user/pages/make_news";
//	}
	//用户跳转到管理虚机状态页面
	@RequestMapping("/setStatus.htm")
	public String setStatus(HttpServletRequest request){
		return "user/pages/message";
	}
//	//用户跳转到申请个人办公机状态页面
//	@RequestMapping("/getPersonal")
//	public String getPersonal(HttpServletRequest request){
//		int addTimeStat=cloudResourceService.getAddTimeStatus();
//		request.setAttribute("addTimeStat", addTimeStat);
//		return "WEB-INF/user/pages/office_cpt";
//	}
//	@RequestMapping("/toPersonal")
//	public String toPersonal(HttpServletRequest request){
//		return "WEB-INF/user/pages/personal";
//	}
//	@RequestMapping("/tocsxy")
//	public String tocsxy(HttpServletRequest request){
//		return "WEB-INF/user/pages/personal";
//	}
	//***************************************************//
	//管理员页面跳转
	//***************************************************//
	//跳转到查询修改
//	@RequestMapping("/tozyxx")
//	public String tozyxx(HttpServletRequest request){
//		int addTimeStat=cloudResourceService.getAddTimeStatus();
//		request.setAttribute("addTimeStat", addTimeStat);
//		return "WEB-INF/admin/pages/zyxx";
//	}
	//跳转到虚机模板录入
//	@RequestMapping("/tolrzy")
//	public String tolrzy(HttpServletRequest request){
//		int addTimeStat=cloudResourceService.getAddTimeStatus();
//		request.setAttribute("addTimeStat", addTimeStat);
//		return "WEB-INF/admin/pages/lrzy";
//	}
//	跳转到录入账号
//	@RequestMapping("/tolrzh")
//	public String tolrzh(HttpServletRequest request){
//		int addTimeStat=cloudResourceService.getAddTimeStatus();
//		request.setAttribute("addTimeStat", addTimeStat);
//		return "WEB-INF/admin/pages/lrzh";
//	}
	//跳转到用户消息
//	@RequestMapping("/toyhxx")
//	public String toyhxx(HttpServletRequest request){
//		return "WEB-INF/admin/pages/yhxx";
//	}
	//跳转到修改密码
//	@RequestMapping("/toxgmm")
//	public String toxgmm(HttpServletRequest request){
//		int addTimeStat=cloudResourceService.getAddTimeStatus();
//		request.setAttribute("addTimeStat", addTimeStat);
//		return "WEB-INF/admin/pages/xgmm";
//	}	

}
