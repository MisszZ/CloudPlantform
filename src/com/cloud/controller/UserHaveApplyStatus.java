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

import com.cloud.entity.UserHaveApplyStatusBean;
import com.cloud.entity.UserHaveStatuBySysBean;
import com.cloud.service.UserHaveApplyStatusService;
/**
 * 用户查看申请审核状态
 * @author somoOne
 */
@Controller
//@RequestMapping("/userHaveAllpyStatus")
public class UserHaveApplyStatus {
	@Resource(name = "userHaveApplyStatusServiceImpl")
	private UserHaveApplyStatusService userHaveApplyStatusService;
	// 用户查看资源申请进度
	@RequestMapping("/userLookStatus.htm")
	public String SearchStatus(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("userEmail")==null){
			return "admin/pages/index";
		}else{
			String userEmail = (String) session.getAttribute("userEmail");
			//System.out.println(userEmail);
			List<UserHaveApplyStatusBean> nowState = userHaveApplyStatusService.searchStatus(userEmail);
			//System.out.println("列表   "+nowState);
			if(nowState!=null&&nowState.size()>0){
				int state=userHaveApplyStatusService.getStateMachine(userEmail);
				request.setAttribute("state", state);
				request.setAttribute("haveOrNo", 1);
			}else{
				request.setAttribute("haveOrNo", 0);
			}
			request.setAttribute("stateInfo", nowState);
//			for(UserHaveApplyStatusBean info:nowState){
//				System.out.println(info.getSystemType());
//				System.out.println(info.getState());
//			}
			return "user/pages/speed";
		}
	}
	//用户查看虚机申请状态
	@RequestMapping("/searchApplStatus.htm")
	public void statusByName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		UserHaveStatuBySysBean userHaveStatuBySysBean=new UserHaveStatuBySysBean();
		userHaveStatuBySysBean.setEmail((String) session.getAttribute("userEmail"));
		userHaveStatuBySysBean.setSystemType(request.getParameter("systemType"));
		int state=userHaveApplyStatusService.statusByName(userHaveStatuBySysBean);
		out.print(state);
		out.flush();
	}
}
