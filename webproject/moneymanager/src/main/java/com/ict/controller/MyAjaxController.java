package com.ict.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.db.DepositeVO;
import com.ict.db.MyVO1;
import com.ict.service.JsonService;

@RestController
public class MyAjaxController {
	@Autowired
	private JsonService jsonService;
	
	
	// 예금 json 읽어오기
	@RequestMapping(value = "recommend_depos.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String DepositeJson(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		String json ="";
		try {
			URL url = new URL(
					"http://finlife.fss.or.kr/finlifeapi/depositProductsSearch.json?auth=31f7ce5fdcc4aa6aae56ce7372bf292f&topFinGrpNo=020000&pageNo=1");
			URLConnection conn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			while ((json = br.readLine())!=null) {
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
			jsonService.jsonParser01(sb.toString().trim(),mine);
		
		} catch (Exception e) {
			System.out.println("2222222222"+e);
		}
		return sb.toString();
	}
}
