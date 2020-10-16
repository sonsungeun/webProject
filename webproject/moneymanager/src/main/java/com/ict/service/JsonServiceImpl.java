package com.ict.service;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class JsonServiceImpl implements JsonService{
	JSONParser parser;
	@Override
	public void jsonParser01(String str) {
		// deposite json¿ª ∞¥√º∫∞∑Œ parsing
		parser = new JSONParser(str);
		try {
			JSONObject object = (JSONObject)parser.parse();
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
