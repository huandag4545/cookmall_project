package com.example.demo.cook_user;

import java.sql.Date;

public class User {

	private String user_id;
	private int user_num;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String user_tel;
	private String user_nickname;
	private String user_postcode;
	private String user_addr1;
	private String user_addr2;
	private int user_type;
	public User() {
		super();
	}
	public User(String user_id, int user_num, String user_pwd, String user_name, String user_email, String user_tel,
			String user_nickname, String user_postcode, String user_addr1, String user_addr2, int user_type) {
		super();
		this.user_id = user_id;
		this.user_num = user_num;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_nickname = user_nickname;
		this.user_postcode = user_postcode;
		this.user_addr1 = user_addr1;
		this.user_addr2 = user_addr2;
		this.user_type = user_type;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_postcode() {
		return user_postcode;
	}
	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}
	public String getUser_addr1() {
		return user_addr1;
	}
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_num=" + user_num + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", user_email=" + user_email + ", user_tel=" + user_tel + ", user_nickname="
				+ user_nickname + ", user_postcode=" + user_postcode + ", user_addr1=" + user_addr1 + ", user_addr2="
				+ user_addr2 + ", user_type=" + user_type + "]";
	}
	
	
}
