package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;
import com.ict.vo.MVO;
import com.ict.vo.VO;

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
	
	@Override
	public MVO selectUser(String id) throws Exception {
		return myDAO.selectUser(id);
	}
	
	@Override
	public int updateUser(MVO mvo) throws Exception {
		return myDAO.updateUser(mvo);
	}
	
	@Override
	public int deleteUser(String id) throws Exception {
		return myDAO.deleteUser(id);
	}
	
	// 관리자
	@Override
	public int selectCount() throws Exception {
		return myDAO.selectCount();
	}
	
	@Override
	public List<VO> selectUserList(int begin, int end) throws Exception {
		return myDAO.selectUserList(begin, end);
	}
	
	@Override
	public int selectWordCount() throws Exception {
		return myDAO.selectWordCount();
	}
	
	@Override
	public int deleteWord(String word) throws Exception {
		return myDAO.deleteWord(word);
	}
	
	@Override
	public List<VO> selectBanList(int begin, int end) throws Exception {
		return myDAO.selectBanList(begin, end);
	}
}
