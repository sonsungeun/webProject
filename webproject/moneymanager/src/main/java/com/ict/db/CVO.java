package com.ict.db;

public class CVO {
	String c_idx, b_idx, writer, contents, write_date;

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getB_idx() {
		return b_idx;
	}

	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public CVO() {
		// TODO Auto-generated constructor stub
	}

	public CVO(String c_idx, String b_idx, String writer, String contents, String write_date) {
		super();
		this.c_idx = c_idx;
		this.b_idx = b_idx;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
	}
}
