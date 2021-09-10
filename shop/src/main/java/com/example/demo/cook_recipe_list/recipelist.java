package com.example.demo.cook_recipe_list;

import java.sql.Date;

public class recipelist {

	private int rl_num;
	private String rl_title;
	private String rl_content;
	private Date rl_date;
	
	public recipelist() {
		super();
	}

	public recipelist(int rl_num, String rl_title, String rl_content, Date rl_date) {
		super();
		this.rl_num = rl_num;
		this.rl_title = rl_title;
		this.rl_content = rl_content;
		this.rl_date = rl_date;
	}

	public int getRl_num() {
		return rl_num;
	}

	public void setRl_num(int rl_num) {
		this.rl_num = rl_num;
	}

	public String getRl_title() {
		return rl_title;
	}

	public void setRl_title(String rl_title) {
		this.rl_title = rl_title;
	}

	public String getRl_content() {
		return rl_content;
	}

	public void setRl_content(String rl_content) {
		this.rl_content = rl_content;
	}

	public Date getRl_date() {
		return rl_date;
	}

	public void setRl_date(Date rl_date) {
		this.rl_date = rl_date;
	}

	@Override
	public String toString() {
		return "recipelist [rl_num=" + rl_num + ", rl_title=" + rl_title + ", rl_content=" + rl_content + ", rl_date="
				+ rl_date + "]";
	}

}
