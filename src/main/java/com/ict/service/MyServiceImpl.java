package com.ict.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;

@Service("MyServiceImpl")
public class MyServiceImpl implements MyService{
	@Autowired
	private MyDAO myDAO;
}
