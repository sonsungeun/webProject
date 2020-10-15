package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.BVO;
import com.ict.db.DAO;
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

	@RequestMapping("goboard.do")
	public ModelAndView goBoard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("board_list");
		List<BVO> list = null;
		try {
			list = dao.getBoardList();
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("goboardonelist.do")
	public ModelAndView goBoardOnelist(HttpServletRequest request,HttpSession session) {
		ModelAndView mv = new ModelAndView("board_onelist");
		try {
			String idx = request.getParameter("idx");
			BVO bvo = dao.getOnelist(idx);
			session.setAttribute("bvo", bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("goboardwrite.do")
	public ModelAndView goBoardWrite() {
		ModelAndView mv = new ModelAndView("board_write");
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

	// �α���
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

	// �α׾ƿ�
	@RequestMapping("logout.do")
	public ModelAndView logoutCommand(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:gomain.do");
	}

	// ȸ������

	// �Խ��� ���ۼ�
	@RequestMapping(value = "boardwrite.do", method = RequestMethod.POST)
	public ModelAndView boardWriteOKCommand(BVO bvo) {
		try {
			dao.getBoardWrite(bvo);
			ModelAndView mv = new ModelAndView("redirect:goboard.do");
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
}
