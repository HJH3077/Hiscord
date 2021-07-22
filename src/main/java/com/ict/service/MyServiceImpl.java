package com.ict.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;
import com.ict.vo.MVO;

@Service("MyServiceImpl")
public class MyServiceImpl implements MyService{
	@Autowired
	private MyDAO myDAO;

	@Override
	public MVO selectLogin(MVO mvo) throws Exception {
		return myDAO.selectLogin(mvo);
	}
	
	@Override
	public int insertJoin(MVO mvo) throws Exception {
		return myDAO.insertJoin(mvo);
	}
}
