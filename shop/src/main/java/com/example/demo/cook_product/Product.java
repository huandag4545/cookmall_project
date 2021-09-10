package com.example.demo.cook_product;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Product {

	private int p_num;
	private String p_name;
	private int p_price;
	private String p_info;
	private int ca1_num;
	private int ca2_num;
	private Date reg_date;
	private int result;
	private MultipartFile p_img1;
	private MultipartFile p_img2;
	private MultipartFile p_img3;
	private MultipartFile p_infoimg;
	
	public Product() {
		
	}

	public Product(int p_num, String p_name, int p_price, String p_info, int ca1_num, int ca2_num,
			Date reg_date, int result) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_info = p_info;
		this.ca1_num = ca1_num;
		this.ca2_num = ca2_num;
		this.reg_date = reg_date;
		this.result = result;
	}

	public Product(int p_num, String p_name, int p_price, String p_info, int ca1_num, int ca2_num,
			Date reg_date, int result, MultipartFile p_img1, MultipartFile p_img2, MultipartFile p_img3,
			MultipartFile p_infoimg) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_info = p_info;
		this.ca1_num = ca1_num;
		this.ca2_num = ca2_num;
		this.reg_date = reg_date;
		this.result = result;
		this.p_img1 = p_img1;
		this.p_img2 = p_img2;
		this.p_img3 = p_img3;
		this.p_infoimg = p_infoimg;
	}
	
	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}


	public int getCa1_num() {
		return ca1_num;
	}

	public void setCa1_num(int ca1_num) {
		this.ca1_num = ca1_num;
	}

	public int getCa2_num() {
		return ca2_num;
	}

	public void setCa2_num(int ca2_num) {
		this.ca2_num = ca2_num;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public MultipartFile getP_img1() {
		return p_img1;
	}

	public void setP_img1(MultipartFile p_img1) {
		this.p_img1 = p_img1;
	}

	public MultipartFile getP_img2() {
		return p_img2;
	}

	public void setP_img2(MultipartFile p_img2) {
		this.p_img2 = p_img2;
	}

	public MultipartFile getP_img3() {
		return p_img3;
	}

	public void setP_img3(MultipartFile p_img3) {
		this.p_img3 = p_img3;
	}

	public MultipartFile getP_infoimg() {
		return p_infoimg;
	}

	public void setP_infoimg(MultipartFile p_infoimg) {
		this.p_infoimg = p_infoimg;
	}

	@Override
	public String toString() {
		return "Product [p_num=" + p_num + ", p_name=" + p_name + ", p_price=" + p_price + ", p_info=" + p_info
				+ ", ca1_num=" + ca1_num + ", ca2_num=" + ca2_num + ", reg_date=" + reg_date
				+ ", result=" + result + ", p_img1=" + p_img1 + ", p_img2=" + p_img2 + ", p_img3=" + p_img3
				+ ", p_infoimg=" + p_infoimg + "]";
	}
	
	
	
}
