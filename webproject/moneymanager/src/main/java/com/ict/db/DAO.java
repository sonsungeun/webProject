package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class DAO {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 로그인
	public MVO getLogin(String mid,String mpw) throws Exception {
		MVO mvo = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("mid", mid);
		map.put("mpw", mpw);
		mvo=sqlSessionTemplate.selectOne("login", map);
		return mvo;
	}
	
	// 게시판 불러오기
	public List<BVO> getBoardList() throws Exception{
		List<BVO> list = null;
		list = sqlSessionTemplate.selectList("board_list");
		return list;
	}
	
	// 게시판 글 저장
	public void getBoardWrite(BVO bvo) throws Exception{
		sqlSessionTemplate.insert("boardwrite",bvo);
	}
	
	// 게시글 불러오기
	public BVO getOnelist(String idx) throws Exception{
		BVO bvo = null;
		bvo = sqlSessionTemplate.selectOne("board_onelist", idx);
		return bvo;
	}
	
	
}
