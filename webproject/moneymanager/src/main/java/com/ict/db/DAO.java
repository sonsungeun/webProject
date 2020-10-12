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
	
	// �α���
	public MVO getLogin(String mid,String mpw) throws Exception {
		MVO mvo = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("mid", mid);
		map.put("mpw", mpw);
		mvo=sqlSessionTemplate.selectOne("login", map);
		return mvo;
	}
	
	// �Խ��� �ҷ�����
	public List<BVO> getBoardList() throws Exception{
		List<BVO> list = null;
		list = sqlSessionTemplate.selectList("board_list");
		return list;
	}
	
	// �Խ��� �� ����
	public void getBoardWrite(BVO bvo) throws Exception{
		sqlSessionTemplate.insert("boardwrite",bvo);
	}
	
	// �Խñ� �ҷ�����
	public BVO getOnelist(String idx) throws Exception{
		BVO bvo = null;
		bvo = sqlSessionTemplate.selectOne("board_onelist", idx);
		return bvo;
	}
	
	
}
