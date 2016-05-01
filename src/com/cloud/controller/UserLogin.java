package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.UserInfoBean;
import com.cloud.service.HaveInfoService;
import com.cloud.service.LoginService;

@Controller
//@RequestMapping("/user")
public class UserLogin {
	// 用户登录
	@Resource(name = "haveInfoServiceImpl")
	private HaveInfoService haveInfoService;
	@Resource(name = "loginServiveImpl")
	private LoginService loginService;

	// 身份验证激活密码
	@RequestMapping("/activation.htm")
	public void userActivation(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
//		System.out.println("姓名  "+request.getParameter("name"));
//		System.out.println("邮箱   "+request.getParameter("email"));
		PrintWriter out = response.getWriter();
		String info;
		try {
			info = loginService.userActivate(request.getParameter("name"),
					request.getParameter("email"));
			/*System.out.println("姓名  "+request.getParameter("name"));
			System.out.println("邮箱   "+request.getParameter("email"));
			System.out.println(info);*/
			if (info == "success") {
				out.println(1);
				out.flush();
			} else {
				out.println(0);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// 用户登录
	@RequestMapping("/userLogin.htm")
	public void userLogin(HttpServletRequest request, UserInfoBean userInfo,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		String info = loginService.userLogin(request.getParameter("email"),
				request.getParameter("pwd"));
		if (info == "success") {
			UserInfoBean userlist = haveInfoService.userInfo(request.getParameter("email"));
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", request.getParameter("email"));
			session.setAttribute("name", userlist.getName());
			session.setAttribute("userPwd", request.getParameter("pwd"));
			//System.out.println("Controller 用户输入密码  "+request.getParameter("pwd"));
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}

	// 注销
	@RequestMapping("/userLogout.htm")
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.setAttribute("email", "");
		//return "manage/page/index";
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
}
