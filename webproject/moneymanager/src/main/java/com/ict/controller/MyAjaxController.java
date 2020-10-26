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
	// ���� ��õ ��� �����ϴ� arraylist;(������ view������ arraylist�� ���´ٰ� �ش� ������ �ٽ� controller�� �޾Ƽ� ������
	// �̵��Ϸ����ߴµ�... �ʹ� �����ؼ� �ϴ� �ӽù��������)
	ArrayList<DepositeVO> result = null;

	@Autowired
	private JsonService jsonService;

	@Autowired
	private DAO dao;

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	// ȸ������ �ߺ������� ȸ������Ʈ �о����
	@RequestMapping(value = "getmemlist.do", method = RequestMethod.GET)
	public Map<String, String> GetMemid(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			String mid = request.getParameter("mid");
			int result = dao.getMemidChk(mid);
			if (result == 0) {
				map.put("result", "��밡���� ���̵��Դϴ�.");
			} else {
				map.put("result", "���̵� �̹� �����մϴ�.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	// �����޼��� ����
	@RequestMapping(value = "sendmsg.do")
	public String sendMsg(HttpServletRequest request) {
		// Ŭ���̾�Ʈ�κ��� ���Ź�ȣ �ޱ�
		String phone = request.getParameter("phone");
		// ������ȣ ����(6�ڸ� ����)
		int number = (int) (Math.random() * (1000000));
		String mynum = "";
		if (number < 100000) {
			mynum = "0" + String.valueOf(number);
		} else {
			mynum = String.valueOf(number);
		}

		String textmsg = "�ȳ��ϼ���. ������ȣ�� [ " + mynum + " ] �Դϴ�.";
		String api_key = "NCSQUJJMAA6AYSRE";
		String api_secret = "UA1SPSZCKUI1VHNPB3UMNVRD01SNF8LM";
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", phone); // ���Ź�ȣ
		set.put("from", "01029828874"); // �߽Ź�ȣ
		set.put("text", textmsg); // ���ڳ���
		set.put("type", "sms"); // ���� Ÿ��

		JSONObject result = null;
		try {
			// ������
			result = coolsms.send(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// ���۰���ޱ�
		if ((boolean) result.get("status") == true) { // �޽��� ������ ���� �� ���۰�� ���
			System.out.println("����");
		} else { // �޽��������� ����
			System.out.println("����");
			System.out.println(result.get("code")); // REST API �����ڵ�
			System.out.println(result.get("message")); // �����޽���
		}
		return mynum;
	}

	// ���� json �о����
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
			// ������ ������ ���� vo�� ���
			MyVO1 mine = new MyVO1();
			mine.setMonth(request.getParameter("month"));
			mine.setDepositemoney(request.getParameter("depositemoney"));
			mine.setChannel(request.getParameter("channel"));
			mine.setBirth(request.getParameter("birth"));
			mine.setGender(request.getParameter("gender"));
			mine.setArea(request.getParameter("area"));
			mine.setPrefential(request.getParameter("prefential"));
			// vo(������ ������ ����) �ѱ��, json �Ľ�, ��õ ����
			result = jsonService.jsonParser01(sb.toString().trim(), mine);
		} catch (Exception e) {
			System.out.println("2222222222" + e);
		}
		return result.size();
	}

	// ���� ��õ ��� �������� �̵�
	@RequestMapping(value = "recommend_depos_res.do")
	public ModelAndView showDepoResCommand() {
		ModelAndView mv = new ModelAndView("recommend_result");
		mv.addObject("result", result);
		mv.addObject("res","���� ��õ ���");
		return mv;
	}

	// ���� json�о����
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
			// ������ ������ ���� vo�� ���
			MyVO1 mine = new MyVO1();
			mine.setMonth(request.getParameter("month"));
			mine.setDepositemoney(request.getParameter("depositemoney"));
			mine.setChannel(request.getParameter("channel"));
			mine.setBirth(request.getParameter("birth"));
			mine.setGender(request.getParameter("gender"));
			mine.setArea(request.getParameter("area"));
			mine.setPrefential(request.getParameter("prefential"));
			// vo(������ ������ ����) �ѱ��, json �Ľ�, ��õ ����
			jsonService.jsonParser01(sb.toString().trim(), mine);

		} catch (Exception e) {
			System.out.println("3333" + e);
		}
		return sb.toString();
	}
	
	// ���� ��õ ��� �������� �̵�
	@RequestMapping(value = "recommend_saving_res.do")
	public ModelAndView showSaveResCommand() {
		ModelAndView mv = new ModelAndView("recommend_result");
		mv.addObject("result", result);
		mv.addObject("res","���� ��õ ���");
		return mv;
	}


}
