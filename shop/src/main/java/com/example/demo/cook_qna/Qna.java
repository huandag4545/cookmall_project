package com.example.demo.cook_qna;

import java.sql.Date;

public class Qna {
	
	private int qna_num;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private int qna_type;
	
	
	
	public Qna() {
		super();
	}



	public Qna(int qna_num, String qna_title, String qna_content, Date qna_date, int qna_type) {
		super();
		this.qna_num = qna_num;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_type = qna_type;
	}



	public int getQna_num() {
		return qna_num;
	}



	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}



	public String getQna_title() {
		return qna_title;
	}



	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}



	public String getQna_content() {
		return qna_content;
	}



	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}



	public Date getQna_date() {
		return qna_date;
	}



	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}



	public int getQna_type() {
		return qna_type;
	}



	public void setQna_type(int qna_type) {
		this.qna_type = qna_type;
	}



	@Override
	public String toString() {
		return "Qna [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", qna_date="
				+ qna_date + ", qna_type=" + qna_type + "]";
	}
	
	
	
	


	
	
	
	
	

}
