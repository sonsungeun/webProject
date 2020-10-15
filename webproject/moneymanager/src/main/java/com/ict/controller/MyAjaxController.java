package com.ict.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyAjaxController {
	// 예금 xml 읽어오기
	@RequestMapping(value = "recommend_depos.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String DepositeXML() {
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL(
					"http://finlife.fss.or.kr/finlifeapi/depositProductsSearch.json?auth=31f7ce5fdcc4aa6aae56ce7372bf292f&topFinGrpNo=020000&pageNo=1");
			URLConnection conn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String msg = "";
			while ((msg = br.readLine()) != null) {
				sb.append(msg);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return sb.toString();
	}
}
