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
	
	@Override
	public MVO selectIdchk(String id) throws Exception {
		return myDAO.selectIdchk(id);
	}
	
	@Override
	public String selectIdfind(String email, String name) throws Exception {
		return myDAO.selectIdfind(email, name);
	}
	
	@Override
	public String selectPwfind(String id, String name, String email) throws Exception {
		return myDAO.selectPwfind(id, name, email);
	}
}
