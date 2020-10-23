package com.ict.service;

import java.util.ArrayList;

import org.json.JSONArray;

import com.ict.db.DepositeVO;
import com.ict.db.MyVO1;

public interface JsonService {
	public ArrayList<DepositeVO> jsonParser01(String str, MyVO1 mVo1);
	public void jsonParser02(String str, MyVO1 mVo1);
}
