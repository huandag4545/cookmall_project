package com.example.demo.cook_admin;

public class Category {

	private int ca_num;
	private String ca_name;
	private int parent_category_num;

	public Category() {
		super();
	}
	
	public Category(int ca_num, String ca_name) {
		super();
		this.ca_num = ca_num;
		this.ca_name = ca_name;
	}
	
	public Category(int ca_num, String ca_name, int parent_category_num) {
		super();
		this.ca_num = ca_num;
		this.ca_name = ca_name;
		this.parent_category_num = parent_category_num;
	}



	public int getCa_num() {
		return ca_num;
	}

	public void setCa_num(int ca_num) {
		this.ca_num = ca_num;
	}

	public String getCa_name() {
		return ca_name;
	}

	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}

	public int getParent_category_num() {
		return parent_category_num;
	}

	public void setParent_category_num(int parent_category_num) {
		this.parent_category_num = parent_category_num;
	}

	@Override
	public String toString() {
		return "Category [ca_num=" + ca_num + ", ca_name=" + ca_name + ", parent_category_num=" + parent_category_num
				+ "]";
	}
	
	
	

}
