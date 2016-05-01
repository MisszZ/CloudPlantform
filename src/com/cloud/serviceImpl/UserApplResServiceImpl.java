package com.cloud.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;




import org.springframework.stereotype.Service;

import com.cloud.entity.UseDataBean;
import com.cloud.mapper.UserApplyResMapper;
import com.cloud.service.UserApplyResService;
@Service
public class UserApplResServiceImpl implements UserApplyResService {
	@Resource(name="userApplyResMapper")
	UserApplyResMapper userApplyResMapper;
	public Boolean applyResource(UseDataBean useDataBean) {
		String time=useDataBean.getTime();
		String timed=useDataBean.getTimed();
		Calendar c = Calendar.getInstance();
		if(useDataBean.getTemPort().length()==0){
			useDataBean.setTemPort("需默认值");
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = null;
		try {
			date = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		c.add(Calendar.MONTH,Integer.parseInt(timed));
		useDataBean.setTimed(format.format(c.getTime()));
		//在操作系统类型上添加时间戳
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm");
		String dateString = formatter.format(currentTime);
		String sysType=useDataBean.getSystemType()+"_"+dateString;
		useDataBean.setSystemType(sysType);
		return dealPorts(useDataBean);
	}
	//拆分字符串
	public boolean dealPorts(UseDataBean useDataBean){
		int tim=0;
		Boolean a=userApplyResMapper.applyResource(useDataBean);
		//将中文逗号转换为引文逗号
//		String ports=useDataBean.getTemPort().replace("，", ",");
//		String tempPort[]=ports.split(",");
//		for (int i=0;i<tempPort.length;i++) {
//			useDataBean.setTemPort(tempPort[i]);
//			Boolean a=userApplyResMapper.applyResource(useDataBean);
//			if(a==true)
//				tim++;
//		}
		if(a){
			Boolean b=userApplyResMapper.insertInfo(useDataBean);
			if(b)
				return true;
		}
//		if(tim==tempPort.length&&b)
//			return true;	
		return false;
	}

}
