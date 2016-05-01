package com.cloud.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.entity.AddTimeResInfoBean;
import com.cloud.entity.UserAddTimeApplBean;
import com.cloud.mapper.UserAddTimeApplMapper;
import com.cloud.service.UserAddTimeApplService;
@Service
public class UserAddTimeApplServiceImpl implements UserAddTimeApplService {
	/**
	 * 用户资源续期
	 */
	@Resource(name="userAddTimeApplMapper")
	UserAddTimeApplMapper userAddTimeApplMapper;
	public int lookRenewalNum(UserAddTimeApplBean userAddTimeApplBean) {
		UserAddTimeApplBean machineInfo=userAddTimeApplMapper.lookRenewalNum(userAddTimeApplBean);
		String addTime=userAddTimeApplBean.getTimed();
		System.out.println("续期时长"+addTime);
		if(machineInfo.getRenewalNum()==1){
			return 1;
		}else{
			if(addTime.equals("一个月"))
				addTime="1";
			else if(addTime.equals("三个月"))
				addTime="3";
			else if(addTime.equals("六个月"))
				addTime="6";
			else
				addTime="12";
			Calendar c = Calendar.getInstance();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = format.parse(machineInfo.getTimed());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.setTime(date);
			c.add(Calendar.MONTH,Integer.parseInt(addTime));
			userAddTimeApplBean.setTimed(format.format(c.getTime()));
			Boolean state=userAddTimeApplMapper.addTime(userAddTimeApplBean);
			if(state==true){
				return 2;
			}else{
				return 3;
			}
		}
	}
	//获取可以续期的资源信息
	public List<AddTimeResInfoBean> getAddTimeResInfo(String email) {
		return userAddTimeApplMapper.getAddTimeResInfo(email);
	}

}
