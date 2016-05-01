package com.cloud.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.service.AddTimeSetService;

//续期设置
@Controller
@RequestMapping("set")
public class AddTimeSet {
	@Resource(name = "addTimeSetServiceImpl")
	private AddTimeSetService addTimeSetService;
	@RequestMapping("/addTimeSet")
	public void addTimeSet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		Boolean info=addTimeSetService.addTimeSet();
		if(info==true){
			out.println(1);
			out.flush();
		}
		else{
			out.println(0);
			out.flush();
		}
	}
}
