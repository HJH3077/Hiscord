package com.ict.service;

import com.ict.vo.MVO;

public interface MyService {
	// 로그인
	MVO selectLogin(MVO mvo) throws Exception;
	// 회원가입
	int insertJoin(MVO mvo) throws Exception;
}
