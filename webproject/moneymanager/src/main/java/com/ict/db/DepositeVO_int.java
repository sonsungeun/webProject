package com.ict.db;

public class DepositeVO_int {
	private String fin_co_no,//금융사 고유번호 
			fin_prdt_cd, //상품명(영어+숫자)
			intr_rate_type,	//단리(S),복리(M) 구분
			intr_rate_type_nm, //단리, 복리
			save_trm, //기간
			intr_rate, //이율
			intr_rate2;	//최대이율

	public String getFin_co_no() {
		return fin_co_no;
	}

	public void setFin_co_no(String fin_co_no) {
		this.fin_co_no = fin_co_no;
	}

	public String getFin_prdt_cd() {
		return fin_prdt_cd;
	}

	public void setFin_prdt_cd(String fin_prdt_cd) {
		this.fin_prdt_cd = fin_prdt_cd;
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

	public DepositeVO_int(String fin_co_no, String fin_prdt_cd, String intr_rate_type, String intr_rate_type_nm,
			String save_trm, String intr_rate, String intr_rate2) {
		super();
		this.fin_co_no = fin_co_no;
		this.fin_prdt_cd = fin_prdt_cd;
		this.intr_rate_type = intr_rate_type;
		this.intr_rate_type_nm = intr_rate_type_nm;
		this.save_trm = save_trm;
		this.intr_rate = intr_rate;
		this.intr_rate2 = intr_rate2;
	}
	public DepositeVO_int() {
	}
}
