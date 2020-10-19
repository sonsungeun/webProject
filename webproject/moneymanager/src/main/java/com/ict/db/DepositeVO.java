package com.ict.db;

public class DepositeVO {
	private String fin_co_no,//������ ������ȣ 
			kor_co_nm, //�������(�ѱ�)
			fin_prdt_cd, //��ǰ��(����+����)
			fin_prdt_nm, //��ǰ��(�ѱ�)
			join_way, //���԰��
			mtrt_int,//���� �� ����
			spcl_cnd, //��� ���� ����
			join_member, // ��������
			etc_note, //���
			max_limit;	//�ִ�ݾ�

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

	public DepositeVO(String fin_co_no, String kor_co_nm, String fin_prdt_cd, String fin_prdt_nm, String join_way,
			String mtrt_int, String spcl_cnd, String join_member, String etc_note, String max_limit) {
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
	}
	public DepositeVO() {
	}
}
