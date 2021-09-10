package com.example.demo.cook_cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper {

	 //현재 아이디와 보고 있는 상품 입력
    void insertCart(Cart c);
    
    //현재 아이디의 장바구니리스트가 나와야함 id :session_Id, 구매자 id
    List selectByUserId(String user_id);
    
    //담기 횟수 계수
    int countUserIdByProductNum(int product_num);
    
    // 선택 삭제   // 세션아이디를 비교해서 product_num을 삭제
    void deleteCart(Map map);
    
    // 전체 삭제
    void deleteAllCart(String user_id);
    
    Cart selectByUserIdProductNum(Map map);
    
    void deleteProductAndCart(int product_num);
    
    int getNum();
}
