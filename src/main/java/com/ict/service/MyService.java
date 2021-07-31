package com.ict.service;

import java.util.List;

import com.ict.vo.MVO;
import com.ict.vo.VO;

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
	// 유저관리 게시판	// 유저 수
	int selectCount() throws Exception;
	// 유저 리스트 // 페이징때문에 begin, end 인자로 사용(begin에서 end까지만 DB에서 읽어옴)
	List<VO> selectList(int begin, int end) throws Exception;
}
