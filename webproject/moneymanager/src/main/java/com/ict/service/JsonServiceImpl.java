package com.ict.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.db.DepositeVO;
import com.ict.db.MyVO1;

@Service
public class JsonServiceImpl implements JsonService {
	JSONParser parser;

	@Override
	public void jsonParser01(String json, MyVO1 mine) {
		// deposite json을 상품별로 vo에 담는다.
		ArrayList<DepositeVO> all = new ArrayList<DepositeVO>();
		ArrayList<DepositeVO> allInt = new ArrayList<DepositeVO>();
		ArrayList<DepositeVO> resultList = new ArrayList<DepositeVO>();
		MyVO1 my = mine;
		try {
			parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(json);
			JSONObject result = (JSONObject) obj.get("result");
			JSONArray baseList = (JSONArray) result.get("baseList");
			JSONArray optionList = (JSONArray) result.get("optionList");

			for (int i = 0; i < baseList.size(); i++) {
				DepositeVO vo = new DepositeVO();
				JSONObject tmp = (JSONObject) baseList.get(i);
				vo.setFin_co_no(tmp.get("fin_co_no").toString());
				vo.setKor_co_nm(tmp.get("kor_co_nm").toString());
				vo.setFin_prdt_cd(tmp.get("fin_prdt_cd").toString());
				vo.setFin_prdt_nm(tmp.get("fin_prdt_nm").toString());
				vo.setJoin_way(tmp.get("join_way").toString());
				vo.setMtrt_int(tmp.get("mtrt_int").toString());
				vo.setSpcl_cnd(tmp.get("spcl_cnd").toString());
				vo.setJoin_member(tmp.get("join_member").toString());
				vo.setEtc_note(tmp.get("etc_note").toString());
				if (tmp.get("max_limit") == null) {
					vo.setMax_limit("0");
				} else {
					vo.setMax_limit(tmp.get("max_limit").toString());
				}
				all.add(vo);
			}

			for (int i = 0; i < optionList.size(); i++) {
				DepositeVO vo = new DepositeVO();
				JSONObject tmp = (JSONObject) optionList.get(i);
				vo.setFin_co_no(tmp.get("fin_co_no").toString());
				vo.setFin_prdt_cd(tmp.get("fin_prdt_cd").toString());
				vo.setIntr_rate_type(tmp.get("intr_rate_type").toString());
				vo.setIntr_rate_type_nm(tmp.get("intr_rate_type_nm").toString());
				vo.setSave_trm(tmp.get("save_trm").toString());
				vo.setIntr_rate(tmp.get("intr_rate").toString());
				vo.setIntr_rate2(tmp.get("intr_rate2").toString());
				allInt.add(vo);
			}
		} catch (Exception e) {
		}

		String channels = my.getChannel();
		for (DepositeVO k : all) {
			// 내가 선택한 가입경로, 한도가 예치금 이내의 상품만 뽑아오기
			if (k.getJoin_way().contains(channels)
					&& (Long.parseLong(k.getMax_limit()) >= Long.parseLong(my.getDepositemoney())
							|| Long.parseLong(k.getMax_limit()) == 0)) {
				resultList.add(k);
			}
		}

		// 결과 상품중에서 가입기간이 일치하는(가입기간에 가장 근접한) 상품의 이자율 뽑는 로직
		for (DepositeVO k : resultList) {
			String prdt_cd = k.getFin_prdt_cd();
			for (DepositeVO k2 : allInt) {
				// 사용자가 입력한 가입기간을 6,12,24,36개월로 구분
				int mymon = Integer.parseInt(mine.getMonth());
				if (mymon >= 6 && mymon <= 12)
					mymon = 6;
				else if (mymon >= 12 && mymon < 24)
					mymon = 12;
				else if (mymon >= 24 && mymon < 36)
					mymon = 24;
				else
					mymon = 36;

				// 일치하는 가입기간이 있을경우 바로 해당 값들을 결과 vo에 넣음
				if (k2.getFin_prdt_cd().equals(prdt_cd)) {
					if (k2.getSave_trm().equals(String.valueOf(mymon))) {
						k.setIntr_rate_type(k2.getIntr_rate_type());
						k.setIntr_rate_type_nm(k2.getIntr_rate_type_nm());
						k.setSave_trm(k2.getSave_trm());
						k.setIntr_rate(k2.getIntr_rate());
						k.setIntr_rate2(k2.getIntr_rate2());
						break;
					} else {
						// 일치하는 가입기간이 없을경우 allint의 save_trn중에 가장 큰 save_trn을 결과 vo에 넣음
						if (k.getSave_trm() == null
								|| Integer.parseInt(k.getSave_trm()) < Integer.parseInt(k2.getSave_trm())) {
							k.setIntr_rate_type(k2.getIntr_rate_type());
							k.setIntr_rate_type_nm(k2.getIntr_rate_type_nm());
							k.setSave_trm(k2.getSave_trm());
							k.setIntr_rate(k2.getIntr_rate());
							k.setIntr_rate2(k2.getIntr_rate2());
						}
					}
				}
			}
		}

		// 결과 리스트 보기(Test)
		System.out.println("내 입력 기간  : " + mine.getMonth());
		System.out.println("내 입력 체널 : " + mine.getChannel());
		System.out.println("내 예치금 : " + mine.getDepositemoney());
		for (DepositeVO k : resultList) {
			if (resultList.size() == 0) {
				System.out.println("상품이 없습니다.");
			}
			System.out.println(k + "번째 결과");
			System.out.println("상품명" + k.getFin_prdt_nm());
			System.out.println("이율" + k.getIntr_rate());
			System.out.println("가입경로" + k.getJoin_way());
			System.out.println("예치기간" + k.getSave_trm());
		}
		System.out.println(resultList.size());
		// 결과(resultList)를 이자율 높은 순으로 정렬
		Collections.sort(resultList, new Comparator<DepositeVO>() {
			@Override
			public int compare(DepositeVO o1, DepositeVO o2) {
				double testint1 = Double.parseDouble(o1.getIntr_rate());
				double testint2 = Double.parseDouble(o2.getIntr_rate());

				if (testint1 > testint2) {
					return -1;
				} else if (testint1 < testint2) {
					return 1;
				} else {
					return 0;
				}
			}
		});

		for (DepositeVO k : resultList) {
			System.out.println("이자율 : " + k.getIntr_rate());
			System.out.println("상품명 : " + k.getFin_prdt_nm());
			System.out.println("====================");
		}
	}
}
