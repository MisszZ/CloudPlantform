package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.cloud.common.InitPwd;
import com.cloud.entity.AdminManageUserBean;
import com.cloud.entity.UserInfoBean;
import com.cloud.service.AdminManageUserService;
import com.cloud.service.CloudResourceService;

/**
 * 管理员管理用户
 * 
 * @author somoOne
 * 
 */
@Controller
public class AdminManageUser {
	@Resource(name="cloudResourceServiceImpl")
	CloudResourceService cloudResourceService;
	@Resource(name = "adminManageUserServiceImpl")
	private AdminManageUserService adminManageUserService;

	// 获取在使用云平台资源的用户的部分信息
	@RequestMapping("/userInfo.htm")
	public String getUserInfo(HttpServletRequest request, ModelMap model) {
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null){
			return "admin/pages/index";
		}else{
			List<UserInfoBean> userInfo = adminManageUserService.allUserInfo();
	//		for(UserInfoBean user:userInfo){
	//			System.out.println("name"+user.getEmail());
	//			System.out.println("email"+user.getName());
	//		}
			int addTimeStat=cloudResourceService.getAddTimeStatus();
			request.setAttribute("addTimeStat", addTimeStat);
			request.setAttribute("info", userInfo);
			return "admin/pages/yhcz";
		}
	}

	// 添加新用户
	@RequestMapping("/adminAddUser.htm")
	public void addUser(HttpServletRequest request, UserInfoBean userInfoBean,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		InitPwd pwd=new InitPwd();
		String userpwd=pwd.initPwd();
		userInfoBean.setUser_pwd(userpwd);
		Boolean a = adminManageUserService.addUser(userInfoBean);
		//System.out.println(a);
		if (a==true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	// 删除用户
	@RequestMapping("/adminDeleteUser.htm")
	public void deleteOneUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String userEmail=new String (request.getParameter("userEmail").getBytes("iso-8859-1"), "utf-8");
		Boolean a = adminManageUserService.deleteUser(userEmail);
		PrintWriter out = response.getWriter();
		if (a == true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}

	// 通过用户名查看
	@RequestMapping("/adminSearchByName.htm")
	public void searchByName(HttpServletRequest request,
			AdminManageUserBean adminManageUserBean,HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("~~~~~~~~~~"+request.getParameter("username"));
		List<UserInfoBean> listName = adminManageUserService
					.getUserInfoByName(request.getParameter("username"));
			PrintWriter out = response.getWriter();
			JSONArray array = JSONArray.fromObject(listName);
			out.print(array);
			out.flush();
	}

	// 获得所有用户的信息
	@RequestMapping("/allUserInfo.htm")
	public String allUserInfo(HttpServletRequest request) {
		List<UserInfoBean> userInfo = adminManageUserService.allUserInfo();
		request.setAttribute("info", userInfo);
		return "manage/pages/scyh";
	}
	//重置用户密码
	@RequestMapping("/adminInitUserPwd.htm")
	public void resetPwd(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		String userEmail=new String (request.getParameter("userEmail").getBytes("iso-8859-1"), "utf-8");
		Boolean a=adminManageUserService.initPwd(userEmail);
		//System.out.println(a);
		if (a == true) {
			out.println(1);
			out.flush();
		} else {
			out.println(0);
			out.flush();
		}
	}
	// 先不写
	// 修改用户信息
	public String updateUser(HttpServletRequest request) {

		return null;
	}

}
