package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.MachineNameBean;
import com.cloud.entity.SomeInfoOfMaBean;
import com.cloud.entity.UseDataBean;
import com.cloud.entity.UserGetMachineBean;
import com.cloud.service.UserHaveResInfoService;

@Controller
public class UserHaveResInfo {
	@Resource(name="userHaveResInfoServiceImpl")
	UserHaveResInfoService userHaveResInfoService;
		//查看申请到的资源
		@RequestMapping("/lookResource.htm")
		public String SearchResource(HttpServletRequest request){ 
			HttpSession session=request.getSession();
			if(session.getAttribute("userEmail")==null){
				return "admin/pages/index";
			}else{
				String userEmail=(String) session.getAttribute("userEmail");
				List<MachineNameBean> nameInfo=userHaveResInfoService.searchResource(userEmail);
				UseDataBean info=userHaveResInfoService.getFirstInfo(userEmail);
				List<SomeInfoOfMaBean> someInfoOfMa=userHaveResInfoService.getSomeInfoOfirFMa(userEmail);
				request.setAttribute("nameInfo", nameInfo);
				request.setAttribute("info", info);
				request.setAttribute("someInfoOfMa", someInfoOfMa);
				return "user/pages/information";
			}
		}
		//根据选中的名称查看信息
		@RequestMapping("/getMachineInfo.htm")
		public void getInfo(HttpServletRequest request,HttpServletResponse response) throws IOException{
			response.setContentType("text/html;charset=UTF-8");
			UserGetMachineBean userGetMachineBean=new UserGetMachineBean();
			PrintWriter out=response.getWriter();
			HttpSession session = request.getSession();
			String machineName=new String (request.getParameter("machineName").getBytes("iso-8859-1"), "utf-8");
			userGetMachineBean.setEmail((String)session.getAttribute("userEmail"));
			userGetMachineBean.setMachineName(machineName);
			//List<SomeInfoOfMaBean> someInfoOfMa=userHaveResInfoService.getSomeInfoOfirFMa((String)session.getAttribute("userEmail"));
			List<UseDataBean> info=userHaveResInfoService.getMachineInfo(userGetMachineBean);
			JSONArray array = JSONArray.fromObject(info);
			out.print(array);
			out.flush();
		}
}
