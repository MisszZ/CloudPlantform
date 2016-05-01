package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.DelRejApplBean;
import com.cloud.service.CloudResourceService;
import com.cloud.service.DelRejApplService;

@Controller
//@RequestMapping("/delRejAppl")
public class DelRejAppl {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	@Resource(name="delRejApplServiceImpl")
	DelRejApplService delRejApplService;
	// 未通过全部信息
	@RequestMapping("/RejectApplyList.htm")
	public String rejectedApply(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			List<DelRejApplBean> rejectedApplyList = delRejApplService
					.rejectedApplyList();
			request.setAttribute("rejectedApplyList", rejectedApplyList);
	//		for (DelRejApplBean o : rejectedApplyList) {
	//			System.out.println(o.getName());
	//		}
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			return "admin/pages/scyh";
		}
	}
	// 删除一个未通过信息
	@RequestMapping("/delRejApplyOne.htm")
	public void deleteRejectedApplyOne(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//System.out.println("删除邮箱"+request.getParameter("emailList"));
		Boolean a = delRejApplService.deleteRejectedApply(request
				.getParameter("emailList"));
		PrintWriter out = response.getWriter();
		if (a == true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	//删过除多个未通过信息
	@RequestMapping("/delMutRejApply.htm")
	public void deleteRejectedApply(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		List<String> list = new ArrayList<String>();
		int num = 0;
		String email=request.getParameter("emailList");
		//System.out.println("emails   "+email);
		String emailList[] = email.split(",");
		for (int i=0;i<emailList.length;i++) {
//			Boolean a = delRejApplService.deleteRejectedApply(email);
//			System.out.println("删除邮箱"+emailList[i]);
//			if (a==false) {
//				
//				list.add(emailList[i]);
//			}else{
//				num++;
//			}
		}
		if (num == emailList.length) {
			out.println(1);
			out.flush();
		} else {
			JSONArray array = JSONArray.fromObject(list);
			out.println(array);
			out.flush();
		}
	}
}
