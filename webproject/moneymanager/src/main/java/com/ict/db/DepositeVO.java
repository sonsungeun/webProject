package com.ict.db;

public class DepositeVO {
	private String fin_co_no,//금융사 고유번호 
			kor_co_nm, //금융사명(한글)
			fin_prdt_cd, //상품명(영어+숫자)
			fin_prdt_nm, //상품명(한글)
			join_way, //가입경로
			mtrt_int,//만기 후 이율
			spcl_cnd, //우대 이율 조건
			join_member, // 가입제한
			etc_note, //비고
			max_limit,	//최대금액
			intr_rate_type,	//단리(S),복리(M) 구분
			intr_rate_type_nm, //단리, 복리
			save_trm, //기간
			intr_rate, //이율
			intr_rate2;	//최대이율
public DepositeVO() {
	// TODO Auto-generated constructor stub
}

public String getFin_co_no() {
	return fin_co_no;
}

public void setFin_co_no(String fin_co_no) {
	this.fin_co_no = fin_co_no;
}

public String getKor_co_nm() {
	return kor_co_nm;
}

public void setKor_co_nm(String kor_co_nm) {
	this.kor_co_nm = kor_co_nm;
}

public String getFin_prdt_cd() {
	return fin_prdt_cd;
}

public void setFin_prdt_cd(String fin_prdt_cd) {
	this.fin_prdt_cd = fin_prdt_cd;
}

public String getFin_prdt_nm() {
	return fin_prdt_nm;
}

public void setFin_prdt_nm(String fin_prdt_nm) {
	this.fin_prdt_nm = fin_prdt_nm;
}

public String getJoin_way() {
	return join_way;
}

public void setJoin_way(String join_way) {
	this.join_way = join_way;
}

public String getMtrt_int() {
	return mtrt_int;
}

public void setMtrt_int(String mtrt_int) {
	this.mtrt_int = mtrt_int;
}

public String getSpcl_cnd() {
	return spcl_cnd;
}

public void setSpcl_cnd(String spcl_cnd) {
	this.spcl_cnd = spcl_cnd;
}

public String getJoin_member() {
	return join_member;
}

public void setJoin_member(String join_member) {
	this.join_member = join_member;
}

public String getEtc_note() {
	return etc_note;
}

public void setEtc_note(String etc_note) {
	this.etc_note = etc_note;
}

public String getMax_limit() {
	return max_limit;
}

public void setMax_limit(String max_limit) {
	this.max_limit = max_limit;
}

public String getIntr_rate_type() {
	return intr_rate_type;
}

public void setIntr_rate_type(String intr_rate_type) {
	this.intr_rate_type = intr_rate_type;
}

public String getIntr_rate_type_nm() {
	return intr_rate_type_nm;
}

public void setIntr_rate_type_nm(String intr_rate_type_nm) {
	this.intr_rate_type_nm = intr_rate_type_nm;
}

public String getSave_trm() {
	return save_trm;
}

public void setSave_trm(String save_trm) {
	this.save_trm = save_trm;
}

public String getIntr_rate() {
	return intr_rate;
}

public void setIntr_rate(String intr_rate) {
	this.intr_rate = intr_rate;
}

public String getIntr_rate2() {
	return intr_rate2;
}

public void setIntr_rate2(String intr_rate2) {
	this.intr_rate2 = intr_rate2;
}

public DepositeVO(String fin_co_no, String kor_co_nm, String fin_prdt_cd, String fin_prdt_nm, String join_way,
		String mtrt_int, String spcl_cnd, String join_member, String etc_note, String max_limit, String intr_rate_type,
		String intr_rate_type_nm, String save_trm, String intr_rate, String intr_rate2) {
	super();
	this.fin_co_no = fin_co_no;
	this.kor_co_nm = kor_co_nm;
	this.fin_prdt_cd = fin_prdt_cd;
	this.fin_prdt_nm = fin_prdt_nm;
	this.join_way = join_way;
	this.mtrt_int = mtrt_int;
	this.spcl_cnd = spcl_cnd;
	this.join_member = join_member;
	this.etc_note = etc_note;
	this.max_limit = max_limit;
	this.intr_rate_type = intr_rate_type;
	this.intr_rate_type_nm = intr_rate_type_nm;
	this.save_trm = save_trm;
	this.intr_rate = intr_rate;
	this.intr_rate2 = intr_rate2;
}
}
