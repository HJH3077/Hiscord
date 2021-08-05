package com.ict.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.MVO;
import com.ict.vo.VO;

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
	
	// 관리자
	@Override
		public int selectCount() throws Exception {
			return sqlSessionTemplate.selectOne("hiscord.count");
	}
	
	@Override
	public List<VO> selectUserList(int begin, int end) throws Exception {
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
	public List<VO> selectBanList(int begin, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("hiscord.banlist", map);
	}
}
