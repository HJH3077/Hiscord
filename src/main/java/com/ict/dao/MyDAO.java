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
	// 유저 닉네임으로 검색
	String selectNickUser(String nickname) throws Exception; 
	// 유저 정보 업데이트
	int updateUser(MVO mvo) throws Exception;
	// 폰트 변경
	int updateFont(String id, String font) throws Exception;
	// 금지어 리스트(전체)
	List<WVO> selectTotalBanList() throws Exception;
	
	// 채팅방 추가
	int insertChatroom(ChatRVO crvo) throws Exception;
	// 채팅방 리스트
	List<ChatRVO> selectChatList(String nickname) throws Exception;
	// 채팅방 유저 리스트
	List<ChatRVO> selectChatUserList(String room_id) throws Exception;
	// 채팅방 1개 검색
	ChatRVO selectChatroom(String room_id, String nickname) throws Exception;
	// 채팅방 초대
	int insertInviteChatroom(ChatRVO crvo) throws Exception;
	// 채팅방 나가기
	int deleteExitChatroom(String room_id, String nickname) throws Exception;
	// 개인 채팅방 txt파일 생성여부 검색
	int selectChatroomFile(String room_id) throws Exception;
	// 개인 채팅방 file_signal 0으로 만들기
	int updateFileSignal(String room_id) throws Exception;
	
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
