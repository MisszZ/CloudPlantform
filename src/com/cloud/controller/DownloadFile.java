package com.cloud.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SuppressWarnings("serial")
@Controller
/**
 * 下载相关文件
 * @author somoOne
 *
 */
public class DownloadFile extends HttpServlet {
	@RequestMapping("/loadFiles.htm")
	public void downloadFile1(HttpServletRequest request,
			HttpServletResponse response) {
		String dataDirectory = request.getServletContext().getRealPath(
				"/WEB-INF/upload");
		File file = new File(dataDirectory,"办公机使用说明.doc");
		download(file,response,"办公机使用说明.doc");
	}
	@RequestMapping("/loadFilesLinux.htm")
	public void downloadFile2(HttpServletRequest request,
			HttpServletResponse response) {
		String dataDirectory = request.getServletContext().getRealPath(
				"/WEB-INF/upload");
		File file = new File(dataDirectory,"虚拟化资源使用说明(Linux).doc");
		download(file,response,"虚拟化资源使用说明(Linux).doc");
	}
	@RequestMapping("/loadFilesWids.htm")
	public void downloadFile3(HttpServletRequest request,
			HttpServletResponse response) {
		String dataDirectory = request.getServletContext().getRealPath(
				"/WEB-INF/upload");
		File file = new File(dataDirectory,"虚拟化资源使用说明(Windows).doc");
		download(file,response,"虚拟化资源使用说明(Windows).doc");
	}
	public void download(File file,HttpServletResponse response,String filename){
		if(!file.exists()){
			System.out.println("file is not exit");
		}
		if (file.exists()) {
			response.setContentType("application/txt");
			response.setHeader("Content-disposition",
					"attachment;filename="+filename+"");
			//System.out.println(filename);
			byte[] buffer = new byte[1024];

			FileInputStream fis = null;
			BufferedInputStream bis = null;
			try {
				fis = new FileInputStream(file);

				bis = new BufferedInputStream(fis);
				OutputStream os = response.getOutputStream();
				int i = bis.read(buffer);
				while (i != -1) {
					os.write(buffer,0,i);
					i = bis.read(buffer);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(bis!=null){
					try {
						bis.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if(fis!=null){
					try {
						fis.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
