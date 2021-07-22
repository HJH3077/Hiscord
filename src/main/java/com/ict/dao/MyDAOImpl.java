package com.ict.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.MVO;

@Repository("MyDAOImpl")
public class MyDAOImpl implements MyDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MVO selectLogin(MVO mvo) throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.login", mvo);
	}
	
	@Override
	public int insertJoin(MVO mvo) throws Exception {
		return sqlSessionTemplate.insert("hiscord.join", mvo);
	}
}
