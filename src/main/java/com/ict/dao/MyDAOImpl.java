package com.ict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.ChatRVO;
import com.ict.vo.MVO;
import com.ict.vo.WVO;

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
	
	@Override
	public MVO selectIdchk(String id) throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.id_check", id);
	}
	
	@Override
	public MVO selecNickchk(String nickname) throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.nick_check", nickname);
	}
	
	@Override
	public String selectIdfind(String email, String name) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("name", name);
		return sqlSessionTemplate.selectOne("hiscord.id_find", map);
	}
	
	@Override
	public String selectPwfind(String id, String name, String email) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		return sqlSessionTemplate.selectOne("hiscord.pw_find", map);
	}
	
	@Override
	public MVO selectUser(String id) throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.user", id);
	}
	
	@Override
	public String selectNickUser(String nickname) throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.user_nick", nickname);
	}
	
	@Override
	public int updateUser(MVO mvo) throws Exception {
		return sqlSessionTemplate.update("hiscord.user_update", mvo);
	}
	
	@Override
	public int deleteUser(String id) throws Exception {
		return sqlSessionTemplate.delete("hiscord.user_delete", id);
	}
	
	@Override
	public int updateFont(String id, String font) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("font", font);
		return sqlSessionTemplate.update("hiscord.font_update", map);
	}
	
	@Override
	public List<WVO> selectTotalBanList() throws Exception {
		return sqlSessionTemplate.selectList("hiscord.total_banlist");
	}
	
	@Override
	public int insertChatroom(ChatRVO crvo) throws Exception {
		return sqlSessionTemplate.insert("hiscord.chatroom_insert", crvo);
	}
	
	@Override
	public List<ChatRVO> selectChatList(String nickname) throws Exception {
		return sqlSessionTemplate.selectList("hiscord.chatroom_list", nickname);
	}
	
	@Override
	public List<ChatRVO> selectChatUserList(String room_id) throws Exception {
		return sqlSessionTemplate.selectList("hiscord.user_list", room_id);
	}
	
	@Override
	public ChatRVO selectChatroom(String room_id, String nickname) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickname", nickname);
		map.put("room_id", room_id);
		return sqlSessionTemplate.selectOne("hiscord.chatroom_select", map);
	}
	
	@Override
	public int insertInviteChatroom(ChatRVO crvo) throws Exception {
		return sqlSessionTemplate.insert("hiscord.chatroom_invite", crvo);
	}
	
	@Override
	public int deleteExitChatroom(String room_id, String nickname) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickname", nickname);
		map.put("room_id", room_id);
		return sqlSessionTemplate.delete("hiscord.chatroom_exit", map);
	}
	
	@Override
	public int selectChatroomFile(String room_id) throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.chatroom_file", room_id);
	}
	
	@Override
	public int updateFileSignal(String room_id) throws Exception {
		return sqlSessionTemplate.update("hiscord.file_signal", room_id);
	}
	
	// 관리자
	@Override
		public int selectCount() throws Exception {
			return sqlSessionTemplate.selectOne("hiscord.count");
	}
	
	@Override
	public List<MVO> selectUserList(int begin, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("hiscord.userlist", map);
	}
	
	@Override
	public int selectWordCount() throws Exception {
		return sqlSessionTemplate.selectOne("hiscord.word_count");
	}
	
	@Override
	public int deleteWord(String word) throws Exception {
		return sqlSessionTemplate.delete("hiscord.word_delete", word);
	}
	
	@Override
	public List<WVO> selectBanList(int begin, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("hiscord.banlist", map);
	}
}
