package com.ict.service;

import java.util.ArrayList;
import java.util.Arrays;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.ict.db.DepositeVO;
import com.ict.db.DepositeVO_int;
import com.ict.db.MyVO1;

@Service
public class JsonServiceImpl implements JsonService{
	JSONParser parser;
	@Override
	public void jsonParser01(String json, MyVO1 mine) {
		// deposite json을 상품별로 vo에 담는다.
		ArrayList<DepositeVO> all = new ArrayList<DepositeVO>();
		ArrayList<DepositeVO_int> allint = new ArrayList<DepositeVO_int>();
		ArrayList<DepositeVO> resultlist = new ArrayList<DepositeVO>();
		MyVO1 my = mine;
		try {
			parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(json);
			JSONObject result = (JSONObject)obj.get("result");
			JSONArray baseList = (JSONArray)result.get("baseList");
			JSONArray optionList = (JSONArray)result.get("optionList");

			for (int i = 0; i < baseList.size(); i++) {
				DepositeVO vo = new DepositeVO();
				JSONObject tmp = (JSONObject)baseList.get(i);
				vo.setFin_co_no(tmp.get("fin_co_no").toString()); 
				vo.setKor_co_nm(tmp.get("kor_co_nm").toString());
				vo.setFin_prdt_cd(tmp.get("fin_prdt_cd").toString());
				vo.setFin_prdt_nm(tmp.get("fin_prdt_nm").toString());
				vo.setJoin_way(tmp.get("join_way").toString());
				vo.setMtrt_int(tmp.get("mtrt_int").toString());
				vo.setSpcl_cnd(tmp.get("spcl_cnd").toString());
				vo.setJoin_member(tmp.get("join_member").toString());
				vo.setEtc_note(tmp.get("etc_note").toString());
				if (tmp.get("max_limit")==null) {
					vo.setMax_limit("0");
				}else {
					vo.setMax_limit(tmp.get("max_limit").toString());
				}
				all.add(vo);
			}
			for (int i = 0; i < optionList.size(); i++) {
				DepositeVO_int vo = new DepositeVO_int();
				JSONObject tmp = (JSONObject)optionList.get(i);
				vo.setFin_co_no(tmp.get("fin_co_no").toString());
				vo.setFin_prdt_cd(tmp.get("fin_prdt_cd").toString());
				vo.setIntr_rate_type(tmp.get("intr_rate_type").toString());
				vo.setIntr_rate_type_nm(tmp.get("intr_rate_type_nm").toString());
				vo.setSave_trm(tmp.get("save_trm").toString());
				vo.setIntr_rate(tmp.get("intr_rate").toString());
				vo.setIntr_rate2(tmp.get("intr_rate2").toString());
				allint.add(vo);
			}			
		} catch (Exception e) {
		}
			
			String channels = my.getChannel();
			for (DepositeVO k : all) {
				// 내가 선택한 가입경로, 한도가 예치금 이내의 상품만 뽑아오기
				if (k.getJoin_way().contains(channels) && Integer.parseInt(k.getMax_limit())<=Integer.parseInt(my.getDepositemoney())) {
					resultlist.add(k);
				}
			}
			System.out.println(resultlist.size());
			System.out.println("finish----------");
			
			for (DepositeVO k : resultlist) {
				String prdt_cd = k.getFin_prdt_cd();
				for (DepositeVO_int k2 : allint) {
					
					if (k2.getFin_prdt_cd().equals(prdt_cd)) {
						// 가입기간을 6,12,24,36개월로 구분
						int mymon=Integer.parseInt(mine.getMonth());
						if (mymon>=6 && mymon<=12) mymon = 6;
						else if (mymon>=12 && mymon<24) mymon = 12;
						else if (mymon>=24 && mymon<36) mymon = 24;
						else mymon = 36;
						
						//
						while (k2.getSave_trm().equals(String.valueOf(mymon))) {
							System.out.println(k2.getFin_prdt_cd());
							System.out.println(k2.getSave_trm());
							System.out.println("---------");
							break;
						}
						
					}
				}
			}
		
		
		
	}
}
