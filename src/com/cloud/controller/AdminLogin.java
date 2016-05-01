package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.AdminBean;
import com.cloud.service.CloudResourceService;
import com.cloud.service.LoginService;

@Controller
class AdminLogin {

	@Resource(name = "loginServiveImpl")
	private LoginService loginService;
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	// 管理员登录
	@RequestMapping("/adminLogin.htm")
	public void adminLogin(HttpServletRequest request, ModelMap model,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//System.out.println("pwd" + request.getParameter("newpwd"));
		String info = loginService.adminLogin(request.getParameter("email"),
				request.getParameter("pwd"));
		//System.out.println("登录信息  "+info);
		PrintWriter out = response.getWriter();
		if (info == "success") {
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("flag", 0);
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	// 管理员修改密码
	@RequestMapping("/adminResPwd.htm")
	public String toxgmm(HttpServletRequest request){
		int addTimeStat=cloudResourceService.getAddTimeStatus();
		request.setAttribute("addTimeStat", addTimeStat);
		return "admin/pages/xgmm";
	}	
	@RequestMapping("/adminResetPwd.htm")
	public void adminResetPwd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		AdminBean admin = new AdminBean();
		admin.setEmail((String) session.getAttribute("email"));
		//String adminPwd=MD5.MD5Encode(request.getParameter("newpwd"));
		admin.setPwd(request.getParameter("newpwd"));
		//System.out.println("测试");
		Boolean state = loginService.adminResetPwd(admin,request.getParameter("oldpwd"));
		if (state == true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	//注销
	@RequestMapping("/adminLogout")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.setAttribute("email", "");
		return "manage/page/index";
	}
	// 临时方法
	@ResponseBody
	@RequestMapping("/login1.do")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// System.out.println(request.getParameter("username"));
		// System.out.println(request.getParameter("email"));

//		System.out.println(request.getParameter("username"));
//		System.out.println(request.getParameter("email"));
		// Admin persons =
		// (Admin)JSONArray.toCollection(request.getParameter("aa"));
		// Admin userInfo=JSON.parseObject(request.getParameter("aa"),
		// Admin.class);
		// System.out.println(userInfo);
		PrintWriter out = response.getWriter();
		AdminBean admin = new AdminBean();
		admin.setEmail("123");
		admin.setPwd("21");
		// List list = new ArrayList();
		// list.add(admin); // list.add(100);
		String info = "true";
		if (info.equals("true")) {
			JSONArray array = JSONArray.fromObject(admin);
			// System.out.println( array );
			// System.out.println(JSON.parseObject(request.getParameter("aa"),
			// Admin.class));
			// PrintWriter out = response.getWriter();
			out.println(array);
			out.flush();
		} else {
			// PrintWriter out = response.getWriter();
			out.println("errrrrrrror");
			out.flush();
		}

		// System.out.println(jsonStu.getJSONArray("email"));
		// response.getWriter().print("asdas"); //100, 200
		// response.getWriter().write(JSONObject.fromObject(array).toString());//返回json对象

	}

	// 测试
	@RequestMapping("/login2.do")
	public void test(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println(request.getParameter("username"));
//		System.out.println(request.getParameter("email"));
		AdminBean admin = new AdminBean();
		admin.setEmail("123");
		admin.setPwd("21");
		List<AdminBean> list = new ArrayList<AdminBean>();
		list.add(admin);
		JSONArray array = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.println(array);
		out.flush();

	}
}
