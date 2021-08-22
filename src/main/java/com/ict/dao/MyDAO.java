package com.ict.dao;

import java.util.List;

import com.ict.vo.ChatRVO;
import com.ict.vo.MVO;
import com.ict.vo.WVO;

public interface MyDAO {
	// 로그인
	MVO selectLogin(MVO mvo) throws Exception;
	// 회원가입
	int insertJoin(MVO mvo) throws Exception;
	// id 중복검사
	MVO selectIdchk(String id) throws Exception;
	// nickname 중복검사
	MVO selecNickchk(String nickname) throws Exception;
	// id찾기
	String selectIdfind(String email, String name) throws Exception;
	// pw찾기
	String selectPwfind(String id, String name, String email) throws Exception;
	// 유저 검색
	MVO selectUser(String id) throws Exception; 
	// 유저 정보 업데이트
	int updateUser(MVO mvo) throws Exception;
	// 폰트 변경
	int updateFont(String id) throws Exception;
	
	// 채팅방 추가
	int insertChatroom(ChatRVO crvo) throws Exception;
	// 채팅방 리스트
	List<ChatRVO> selectChatList(String id) throws Exception;
	
	// 유저 삭제
	int deleteUser(String id) throws Exception;
	// 금지어 삭제
	int deleteWord(String word) throws Exception;
	// 유저관리 게시판	// 유저 수
	int selectCount() throws Exception;
	// 금지어 게시판	// 금지어 수
	int selectWordCount() throws Exception;
	// 유저 리스트 // 페이징때문에 begin, end 인자로 사용(begin에서 end까지만 DB에서 읽어옴)
	List<MVO> selectUserList(int begin, int end) throws Exception;
	// 금지어 리스트
	List<WVO> selectBanList(int begin, int end) throws Exception;
}
