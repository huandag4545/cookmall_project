package com.example.demo.cook_cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	@Autowired
	   private CartMapper cartmapper;
	   
	   /*
	    * 장바구니DB에 장바구니리스트를 추가한다.
	    * cart_num      : 시퀀스 값으로 대체
	    * user_id      : 구매자 id(=session.id)
	    * product_num   : product의 num (=상품번호)
	    */
	   public void insertWish(Cart c) {
		   cartmapper.insertCart(c);
	   }
	   
	   /*
	    * 프로덕트에서 장바구니의 세션 아이디가 가진 아이디를 가진 프로덕트 넘버를 통해 상품정보를 가져온다
	    * user_id      : 구매자 id(=session.id)
	    * product_num   : product의 num (=상품번호)
	    */
	   public List selectByUserId(String user_id) {
	      return cartmapper.selectByUserId(user_id);
	   }
	   
	   
	   public int countUserIdByProductNum(int product_num) {
	      return cartmapper.countUserIdByProductNum(product_num);
	   }
	   
	   
	   public Cart selectByUserIdProductNum(int product_num, String user_id) {
	     Map map = new HashMap();
	     map.put("user_id", user_id);
	     map.put("product_num", product_num);
	     return cartmapper.selectByUserIdProductNum(map);
	   }
	   /*
	    * 장바구니 리스트에서 삭제
	    * cart_num : 카트리스트 시퀀스 넘버
	    */
	   public void delCart(String user_id,int product_num) {
	      Map map = new HashMap();
	      map.put("user_id", user_id);
	      map.put("product_num", product_num);
	      cartmapper.deleteCart(map);
	   }
	   /*
	    * 장바구니 리스트 전체 삭제
	    */
	   public void delcartAll(String user_id) {
		   cartmapper.deleteAllCart(user_id);
	   }
	   
	   public void deleteProductAndCart(int product_num) {
		   cartmapper.deleteProductAndCart(product_num);
	   }
	   
	   public int getNum() {
	      return cartmapper.getNum();
	   }
	}