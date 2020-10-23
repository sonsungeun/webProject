package com.ict.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class DAO {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 회원가입 id 중복 체크
	public Integer getMemidChk(String mid) throws Exception{
		int result = 0;
		result=sqlSessionTemplate.selectOne("joincheck",mid);
		return result;
	}
	// 회원가입
	public void getJoin(MVO mvo) throws Exception{
		sqlSessionTemplate.insert("join", mvo);
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
	
	// 전체 게시글의 수
	public int getTotalCount()throws Exception{
		int result = 0;
		result = sqlSessionTemplate.selectOne("totalCount");
		return result;
	}
	// 게시판 불러오기
	public List<BVO> getBoardList(int begin, int end) throws Exception{
		List<BVO> list = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		list = sqlSessionTemplate.selectList("board_list", map);
		return list;
	}
	
	// 게시판 글 저장
	public void getBoardWrite(BVO bvo, MVO mvo) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("mnickname", mvo.getMnickname());
		map.put("mid", mvo.getMid());
		map.put("title", bvo.getTitle());
		map.put("content", bvo.getContent());
		sqlSessionTemplate.insert("boardwrite",map);
	}
	
	// 조회수 업데이트
	public void getHitUp(String b_idx) throws Exception{
		sqlSessionTemplate.update("hitup",b_idx);
	}
	
	// 게시글 불러오기
	public BVO getOnelist(String b_idx) throws Exception{
		BVO bvo = null;
		bvo = sqlSessionTemplate.selectOne("board_onelist", b_idx);
		return bvo;
	}
	
	// 게시글 수정
	public void getBoardUpdate(BVO bvo) throws Exception{
		sqlSessionTemplate.update("boardupdate", bvo);
	}
	// 게시글 삭제
	public void getBoardDelete(BVO bvo) throws Exception{
		sqlSessionTemplate.delete("boarddelete", bvo);
	}
	
	// 댓글 작성
	public void getCommentWrite(CVO cvo) throws Exception{
		sqlSessionTemplate.insert("commentwrite", cvo);
	}
	
	// 댓글 불러오기
	public List<CVO> getCList(String b_idx) throws Exception{
		List<CVO> list = null;
		list= sqlSessionTemplate.selectList("comment_list", b_idx);
		return list;
	}
	
	// 댓글 삭제
	public void getCommentDelete(String c_idx) throws Exception{
		sqlSessionTemplate.delete("commentdelete", c_idx);
	}
	
	
}
