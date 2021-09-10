package com.example.demo.cook_order;

import java.sql.Date;

import com.example.demo.cook_product.Product;

public class Order {

	private int o_num;
	private Date o_date;
	private int o_quantity;
	private String o_postcode;
	private String o_addr1;
	private String o_addr2;
	private String user_id;
	private int p_num;
	private int result;
	private Product p = new Product();
	
	public Order() {
		super();
	}

	public Order(int o_num, int result) {
		super();
		this.o_num = o_num;
		this.result = result;
	}

	public Order(int o_num, Date o_date, int o_quantity, String o_postcode, String o_addr1, String o_addr2,
			String user_id, int p_num, int result) {
		super();
		this.o_num = o_num;
		this.o_date = o_date;
		this.o_quantity = o_quantity;
		this.o_postcode = o_postcode;
		this.o_addr1 = o_addr1;
		this.o_addr2 = o_addr2;
		this.user_id = user_id;
		this.p_num = p_num;
		this.result = result;
	}

	public Order(int o_num, Date o_date, int o_quantity, String o_postcode, String o_addr1, String o_addr2,
			String user_id, int p_num, int result, Product p) {
		super();
		this.o_num = o_num;
		this.o_date = o_date;
		this.o_quantity = o_quantity;
		this.o_postcode = o_postcode;
		this.o_addr1 = o_addr1;
		this.o_addr2 = o_addr2;
		this.user_id = user_id;
		this.p_num = p_num;
		this.result = result;
		this.p = p;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getO_quantity() {
		return o_quantity;
	}

	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}

	public String getO_postcode() {
		return o_postcode;
	}

	public void setO_postcode(String o_postcode) {
		this.o_postcode = o_postcode;
	}

	public String getO_addr1() {
		return o_addr1;
	}

	public void setO_addr1(String o_addr1) {
		this.o_addr1 = o_addr1;
	}

	public String getO_addr2() {
		return o_addr2;
	}

	public void setO_addr2(String o_addr2) {
		this.o_addr2 = o_addr2;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public Product getP() {
		return p;
	}

	public void setP(Product p) {
		this.p = p;
	}

	@Override
	public String toString() {
		return "Order [o_num=" + o_num + ", o_date=" + o_date + ", o_quantity=" + o_quantity + ", o_postcode="
				+ o_postcode + ", o_addr1=" + o_addr1 + ", o_addr2=" + o_addr2 + ", user_id=" + user_id + ", p_num="
				+ p_num + ", result=" + result + ", p=" + p + "]";
	}
	
	
	
	
}
