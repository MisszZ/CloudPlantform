package com.cloud.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cloud.mapper.AddTimeSetMapper;
import com.cloud.service.AddTimeSetService;
@Service
public class AddTimeSetServiceImpl implements AddTimeSetService {
	@Resource(name="addTimeSetMapper")
	AddTimeSetMapper addTimeSetMapper;
	public Boolean addTimeSet() {
		int info=addTimeSetMapper.getStatus();
		//System.out.println("db  "+info);
		if(info==1)
			info=0;
		else
			info=1;
		//System.out.println("flush  "+info);
		return addTimeSetMapper.addTimeSet(info);
	}

}
