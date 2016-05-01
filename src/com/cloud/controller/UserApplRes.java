package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.common.MD5;
import com.cloud.entity.ServerBean;
import com.cloud.entity.UseDataBean;
import com.cloud.entity.UserInfoBean;
import com.cloud.service.HaveInfoService;
import com.cloud.service.UserApplyResService;

@Controller
//@RequestMapping("/userApplyRes")
public class UserApplRes {
	@Resource(name = "haveInfoServiceImpl")
	private HaveInfoService haveInfoService;
	@Resource(name = "userApplResServiceImpl")
	private UserApplyResService userApplyResService;
	// 申请服务器资源获取配置信息
	@RequestMapping("/userApplyRes.htm")
	public String HaveForm(HttpServletRequest request,HttpSession session) {
		Random random=new Random();
		String newpwd=Integer.toString((int)random.nextInt(1000000));
		String token=MD5.MD5Encode(newpwd);
		session.setAttribute("token1", token);
		String s=(String) session.getAttribute("userEmail");
		if(s==null){
			return "admin/pages/index";
		}else{
			String configInfo = haveInfoService.serverConfigInfo();
			List<ServerBean> systemInfo = haveInfoService.serverSystemInfo();
			String userDepartment=haveInfoService.userDepart(s);
			String userphone=haveInfoService.userPhone(s);
			/*Date currentDate = new Date(
					System.currentTimeMillis());
			String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(currentDate);*/
			request.setAttribute("userDepartment", userDepartment);
			request.setAttribute("userphone", userphone);
			request.setAttribute("configInfo", configInfo);
			request.setAttribute("systemInfo", systemInfo);
			/*request.setAttribute("time", dateStr);*/
			return "user/pages/apply";
		}
	}

	// 用户提交申请
	@RequestMapping("/applyResource.htm")
	public void applyResource(HttpServletRequest request,UseDataBean useDataBean,HttpServletResponse response,HttpSession session) throws IOException {
		PrintWriter out=response.getWriter();
		if(!((String)session.getAttribute("token1")).equals((String)session.getAttribute("token2"))){
			//System.out.println("重复提交");
			out.println(0);
			out.flush();
		}else{
			System.out.println("用户提交数据"+useDataBean);
			useDataBean.setEmail((String)session.getAttribute("userEmail"));
			Boolean a = userApplyResService.applyResource(useDataBean);
			if (a==true) {
				out.println(1);
				out.flush();
			} else {
				out.println(0);
				out.flush();
			}
			session.removeAttribute("token1");
		}
	}
}
