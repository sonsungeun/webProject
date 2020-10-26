package com.ict.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ict.db.DAO;
import com.ict.db.DepositeVO;
import com.ict.db.MyVO1;
import com.ict.service.JsonService;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

@RestController
public class MyAjaxController {
	// 예금 추천 결과 저장하는 arraylist;(원래는 view단으로 arraylist를 보냈다가 해당 정보를 다시 controller로 받아서 페이지
	// 이동하려고했는데... 너무 복잡해서 일단 임시방편용으로)
	ArrayList<DepositeVO> result = null;

	@Autowired
	private JsonService jsonService;

	@Autowired
	private DAO dao;

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	// 회원가입 중복감지용 회원리스트 읽어오기
	@RequestMapping(value = "getmemlist.do", method = RequestMethod.GET)
	public Map<String, String> GetMemid(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			String mid = request.getParameter("mid");
			int result = dao.getMemidChk(mid);
			if (result == 0) {
				map.put("result", "사용가능한 아이디입니다.");
			} else {
				map.put("result", "아이디가 이미 존재합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	// 인증메세지 전송
	@RequestMapping(value = "sendmsg.do")
	public String sendMsg(HttpServletRequest request) {
		// 클라이언트로부터 수신번호 받기
		String phone = request.getParameter("phone");
		// 인증번호 생성(6자리 난수)
		int number = (int) (Math.random() * (1000000));
		String mynum = "";
		if (number < 100000) {
			mynum = "0" + String.valueOf(number);
		} else {
			mynum = String.valueOf(number);
		}

		String textmsg = "안녕하세요. 인증번호는 [ " + mynum + " ] 입니다.";
		String api_key = "NCSQUJJMAA6AYSRE";
		String api_secret = "UA1SPSZCKUI1VHNPB3UMNVRD01SNF8LM";
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", phone); // 수신번호
		set.put("from", "01029828874"); // 발신번호
		set.put("text", textmsg); // 문자내용
		set.put("type", "sms"); // 문자 타입

		JSONObject result = null;
		try {
			// 보내기
			result = coolsms.send(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 전송결과받기
		if ((boolean) result.get("status") == true) { // 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
		} else { // 메시지보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
		}
		return mynum;
	}

	// 예금 json 읽어오기
	@RequestMapping(value = "recommend_depos.do")
	@ResponseBody
	public Object DepositeJson(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		String json = "";
		try {
			URL url = new URL(
					"http://finlife.fss.or.kr/finlifeapi/depositProductsSearch.json?auth=31f7ce5fdcc4aa6aae56ce7372bf292f&topFinGrpNo=020000&pageNo=1");
			URLConnection conn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			while ((json = br.readLine()) != null) {
				sb.append(json);
			}
			// 개인이 선택한 정보 vo에 담기
			MyVO1 mine = new MyVO1();
			mine.setMonth(request.getParameter("month"));
			mine.setDepositemoney(request.getParameter("depositemoney"));
			mine.setChannel(request.getParameter("channel"));
			mine.setBirth(request.getParameter("birth"));
			mine.setGender(request.getParameter("gender"));
			mine.setArea(request.getParameter("area"));
			mine.setPrefential(request.getParameter("prefential"));
			// vo(개인이 선택한 정보) 넘기기, json 파싱, 추천 로직
			result = jsonService.jsonParser01(sb.toString().trim(), mine);
		} catch (Exception e) {
			System.out.println("2222222222" + e);
		}
		return result.size();
	}

	// 예금 추천 결과 페이지로 이동
	@RequestMapping(value = "recommend_depos_res.do")
	public ModelAndView showDepoResCommand() {
		ModelAndView mv = new ModelAndView("recommend_result");
		mv.addObject("result", result);
		mv.addObject("res","예금 추천 결과");
		return mv;
	}

	// 적금 json읽어오기
	@RequestMapping(value = "recommend_saving.do", produces = "text/html; charset=UTF-8")
	public String SavingJson(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		String json = "";
		try {
			URL url = new URL(
					"http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.xml?auth=31f7ce5fdcc4aa6aae56ce7372bf292f&topFinGrpNo=020000&pageNo=1");
			URLConnection conn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			while ((json = br.readLine()) != null) {
				sb.append(json);
			}
			// 개인이 선택한 정보 vo에 담기
			MyVO1 mine = new MyVO1();
			mine.setMonth(request.getParameter("month"));
			mine.setDepositemoney(request.getParameter("depositemoney"));
			mine.setChannel(request.getParameter("channel"));
			mine.setBirth(request.getParameter("birth"));
			mine.setGender(request.getParameter("gender"));
			mine.setArea(request.getParameter("area"));
			mine.setPrefential(request.getParameter("prefential"));
			// vo(개인이 선택한 정보) 넘기기, json 파싱, 추천 로직
			jsonService.jsonParser01(sb.toString().trim(), mine);

		} catch (Exception e) {
			System.out.println("3333" + e);
		}
		return sb.toString();
	}
	
	// 적금 추천 결과 페이지로 이동
	@RequestMapping(value = "recommend_saving_res.do")
	public ModelAndView showSaveResCommand() {
		ModelAndView mv = new ModelAndView("recommend_result");
		mv.addObject("result", result);
		mv.addObject("res","적금 추천 결과");
		return mv;
	}


}
