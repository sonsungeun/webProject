package com.ict.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.BVO;
import com.ict.db.CVO;
import com.ict.db.DAO;
import com.ict.db.DepositeVO;
import com.ict.db.MVO;
import com.ict.model.Paging;

@Controller
public class MyController {
	@Autowired
	private DAO dao;
	@Autowired
	private Paging paging;

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	@RequestMapping("gomain.do")
	public ModelAndView goMain() {
		ModelAndView mv = new ModelAndView("mainpage");
		return mv;
	}
	
	@RequestMapping("gocalendar.do")
	public ModelAndView goCalendar() {
		ModelAndView mv = new ModelAndView("calendar");
		return mv;
	}
	@RequestMapping("goout.do")
	public ModelAndView goOut() {
		ModelAndView mv = new ModelAndView("out");
		return mv;
	}
	@RequestMapping("goin.do")
	public ModelAndView goIn() {
		ModelAndView mv = new ModelAndView("in");
		return mv;
	}
	@RequestMapping("godeposite.do")
	public ModelAndView goDeposite() {
		ModelAndView mv = new ModelAndView("deposite_recommend_q");
		return mv;
	}

	@RequestMapping("gosavings.do")
	public ModelAndView goSavings() {
		ModelAndView mv = new ModelAndView("savings_recommend_q");
		return mv;
	}

	@RequestMapping("gocard.do")
	public ModelAndView goCard() {
		ModelAndView mv = new ModelAndView("card_recommend_q");
		return mv;
	}

	@RequestMapping("golending.do")
	public ModelAndView goLending() {
		ModelAndView mv = new ModelAndView("lending_recommend_q");
		return mv;
	}



	@RequestMapping("goboardwrite.do")
	public ModelAndView goBoardWrite() {
		ModelAndView mv = new ModelAndView("board_write");
		return mv;
	}

	@RequestMapping("goboardupdate.do")
	public ModelAndView goBoardUpdate() {
		ModelAndView mv = new ModelAndView("board_update");
		return mv;
	}

	@RequestMapping("login.do")
	public ModelAndView goLogin() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}

	@RequestMapping("join.do")
	public ModelAndView goJoin() {
		ModelAndView mv = new ModelAndView("join");
		return mv;
	}

	@RequestMapping("find.do")
	public ModelAndView goFind() {
		ModelAndView mv = new ModelAndView("find_id");
		return mv;
	}

	// 로그인
	@RequestMapping("login_ok.do")
	public ModelAndView loginOkCommand(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");
			MVO mvo = dao.getLogin(mid, mpw);
			if (mvo == null) {
				mv.setViewName("login_fail");
			} else {
				session.setAttribute("mvo", mvo);
				session.setAttribute("login", "ok");
				mv.setViewName("redirect:gomain.do");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logoutCommand(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:gomain.do");
	}

	// 회원가입
	@RequestMapping("join_ok.do")
	public ModelAndView joinOkCommand(MVO mvo,HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			dao.getJoin(mvo);
			mv.setViewName("redirect:gomain.do");
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	// 게시글작성
	@RequestMapping(value = "boardwrite.do", method = RequestMethod.POST)
	public ModelAndView boardWriteOKCommand(BVO bvo,HttpSession session) {
		try {
			MVO mvo = (MVO)session.getAttribute("mvo");
			dao.getBoardWrite(bvo, mvo);
			ModelAndView mv = new ModelAndView("redirect:goboard.do");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 게시판 보기
	@RequestMapping("goboard.do")
	public ModelAndView goBoard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("board_list");
		List<BVO> list = null;
		try {
			// 전체 게시물의 수
			int result = dao.getTotalCount();
			paging.setTotalRecord(result);
			
			// 2. 전체 페이지의 수
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			} else {
				paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
				if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
					paging.setTotalPage(paging.getTotalPage() + 1);
				}
			}

			String cPage = request.getParameter("cPage");
			// 3.
			if (cPage == null) {
				paging.setNowPage(1);
			} else {
				paging.setNowPage(Integer.parseInt(cPage));
			}

			// 4. 시작번호, 끝번호
			paging.setBegin((paging.getNowPage() - 1) * paging.getNumPerPage() + 1);
			paging.setEnd((paging.getBegin() - 1) + paging.getNumPerPage());
			
			// 5. 시작블록, 끝블록
			paging.setBeginBlock(
					(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

			// 주의사항
			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}
			list = dao.getBoardList(paging.getBegin(),paging.getEnd());
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 게시글(하나) 보기
	@RequestMapping("goboardonelist.do")
	public ModelAndView goBoardOnelist(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("board_onelist");
		try {
			String b_idx = request.getParameter("b_idx");
			String cPage = request.getParameter("cPage");
			
			dao.getHitUp(b_idx);
			BVO bvo = dao.getOnelist(b_idx);
			List<CVO> c_list = dao.getCList(b_idx);
			session.setAttribute("c_list", c_list);
			session.setAttribute("bvo", bvo);
			mv.addObject("cPage",cPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 게시글수정
	@RequestMapping(value = "boardupdate_ok.do", method = RequestMethod.POST)
	public ModelAndView boardUpdateOKCommand(BVO bvo, HttpServletRequest request) {
		try {
			String cPage = request.getParameter("cPage");
			String b_idx = request.getParameter("b_idx");
			ModelAndView mv = new ModelAndView("redirect:goboardonelist.do?b_idx=" + b_idx+"&cPage="+cPage);
			dao.getBoardUpdate(bvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 게시글 삭제
	@RequestMapping(value = "boarddelete_ok.do", method = RequestMethod.GET)
	public ModelAndView boardDeleteOKCommand(BVO bvo) {
		try {
			ModelAndView mv = new ModelAndView("redirect:goboard.do");
			dao.getBoardDelete(bvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 게시글에 댓글 등록
	@RequestMapping(value = "commentinsert.do", method = RequestMethod.POST)
	public ModelAndView commentInsertCommand(CVO cvo, HttpServletRequest request) {
		try {
			String cPage = request.getParameter("cPage");
			String b_idx = request.getParameter("b_idx");
			ModelAndView mv = new ModelAndView("redirect:goboardonelist.do?b_idx="+b_idx+"&cPage="+cPage);
			dao.getCommentWrite(cvo);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "commentdelete.do", method = RequestMethod.POST)
	public ModelAndView commentDeleteCommand(CVO cvo, HttpServletRequest request) {
		try {
			String cPage = request.getParameter("cPage");
			String b_idx = request.getParameter("b_idx");
			String c_idx = request.getParameter("c_idx");
			System.out.println(c_idx);
			ModelAndView mv = new ModelAndView("redirect:goboardonelist.do?b_idx="+b_idx+"&cPage="+cPage);
			dao.getCommentDelete(c_idx);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	

}
