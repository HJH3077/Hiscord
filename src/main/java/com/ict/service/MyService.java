package com.ict.service;

import com.ict.vo.MVO;

public interface MyService {
	// 로그인
	MVO selectLogin(MVO mvo) throws Exception;
	// 회원가입
	int insertJoin(MVO mvo) throws Exception;
	// id 중복검사
	MVO selectIdchk(String id) throws Exception;
	// id찾기
	String selectIdfind(String email, String name) throws Exception;
	// pw찾기
	String selectPwfind(String id, String name, String email) throws Exception;
}
