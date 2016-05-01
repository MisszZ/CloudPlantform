package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.UserInfoBean;
import com.cloud.service.UserModPwdService;

@Controller
//@RequestMapping("/userModPwd")
public class UserModPwd {
	@Resource(name = "userModPwdServiceImpl")
	UserModPwdService userModPwdService;

	@RequestMapping("/modPwd.htm")
	public String passMothed(HttpServletRequest request) {
		return "user/pages/password";
	}

	// 用户修改密码
	@RequestMapping("/updatePwd.htm")
	public void updatePasswd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("userEmail")==null){
			response.sendRedirect("admin/pages/index");
		}else{
			PrintWriter out = response.getWriter();
			UserInfoBean userInfoBean = new UserInfoBean();
			userInfoBean.setEmail((String) session.getAttribute("userEmail"));
			//userInfoBean.setUser_pwd(MD5.MD5Encode(request.getParameter("newpwd")));
			//页面已经加密
			userInfoBean.setUser_pwd(request.getParameter("newpwd"));
			//System.out.println("页面输入的密码  "+request.getParameter("newpwd"));
//			Boolean a = userModPwdService.UserUpdatePasswd(userInfoBean,
//					MD5.MD5Encode(request.getParameter("oldPwd")));
			Boolean a = userModPwdService.UserUpdatePasswd(userInfoBean,
					request.getParameter("oldPwd"));
			if (a.equals(true)) {
				out.println(1);
				out.flush();
			} else {
				out.println(0);
				out.flush();
			}
		}
	}
}
