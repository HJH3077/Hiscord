package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.dao.MyDAO;
import com.ict.vo.ChatRVO;
import com.ict.vo.MVO;
import com.ict.vo.WVO;

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
	public MVO selecNickchk(String nickname) throws Exception {
		return myDAO.selecNickchk(nickname);
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
	public String selectNickUser(String nickname) throws Exception {
		return myDAO.selectNickUser(nickname);
	}
	
	@Override
	public int updateUser(MVO mvo) throws Exception {
		return myDAO.updateUser(mvo);
	}
	
	@Override
	public int deleteUser(String id) throws Exception {
		return myDAO.deleteUser(id);
	}
	
	@Override
	public int updateFont(String id, String font) throws Exception {
		return myDAO.updateFont(id, font);
	}
	
	@Override
	public List<WVO> selectTotalBanList() throws Exception {
		return myDAO.selectTotalBanList();
	}
	
	@Override
	public int insertChatroom(ChatRVO crvo) throws Exception {
		return myDAO.insertChatroom(crvo);
	}
	
	@Override
	public List<ChatRVO> selectChatList(String nickname) throws Exception {
		return myDAO.selectChatList(nickname);
	}
	
	@Override
	public List<ChatRVO> selectChatUserList(String room_id) throws Exception {
		return myDAO.selectChatUserList(room_id);
	}
	
	@Override
	public ChatRVO selectChatroom(String room_id, String nickname) throws Exception {
		return myDAO.selectChatroom(room_id, nickname);
	}
	
	@Override
	public int insertInviteChatroom(ChatRVO crvo) throws Exception {
		return myDAO.insertInviteChatroom(crvo);
	}
	
	@Override
	public int deleteExitChatroom(String room_id, String nickname) throws Exception {
		return myDAO.deleteExitChatroom(room_id, nickname);
	}
	
	@Override
	public int selectChatroomFile(String room_id) throws Exception {
		return myDAO.selectChatroomFile(room_id);
	}
	
	@Override
	public int updateFileSignal(String room_id) throws Exception {
		return myDAO.updateFileSignal(room_id);
	}
	
	// 관리자
	@Override
	public int selectCount() throws Exception {
		return myDAO.selectCount();
	}
	
	@Override
	public List<MVO> selectUserList(int begin, int end) throws Exception {
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
	public List<WVO> selectBanList(int begin, int end) throws Exception {
		return myDAO.selectBanList(begin, end);
	}
}
