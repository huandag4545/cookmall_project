package com.example.demo.cook_cart;

import java.util.ArrayList;

import com.example.demo.cook_product.Product;

public class Cart {

	   private int c_num;
	   private String user_id;
	   private int product_num; 
	   private ArrayList<Product> p = new ArrayList<Product>();// 프로덕트 리스트
       private ArrayList<Cart> c = new ArrayList<Cart>();// 위시리스트
	public Cart() {
		super();
	}
	public Cart(int c_num, String user_id, int product_num, ArrayList<Product> p, ArrayList<Cart> c) {
		super();
		this.c_num = c_num;
		this.user_id = user_id;
		this.product_num = product_num;
		this.p = p;
		this.c = c;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public ArrayList<Product> getP() {
		return p;
	}
	public void setP(ArrayList<Product> p) {
		this.p = p;
	}
	public ArrayList<Cart> getC() {
		return c;
	}
	public void setC(ArrayList<Cart> c) {
		this.c = c;
	}
	@Override
	public String toString() {
		return "Cart [c_num=" + c_num + ", user_id=" + user_id + ", product_num=" + product_num + ", p=" + p + ", c="
				+ c + "]";
	}
	
       
}
