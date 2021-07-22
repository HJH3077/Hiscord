package com.ict.dao;

import com.ict.vo.MVO;

public interface MyDAO {
	// 로그인
	MVO selectLogin(MVO mvo) throws Exception;
	// 회원가입
	int insertJoin(MVO mvo) throws Exception;
}
