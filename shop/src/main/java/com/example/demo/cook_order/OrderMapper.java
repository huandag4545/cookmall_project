package com.example.demo.cook_order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {


	void insertOrder(Order o); //주문하기

	Order selectOrder(int o_num); //주문상세정보

	List selectAllOrder(String user_id); //주문리스트 

	void deleteOrder(int o_num); // 주문내역수정

	void updateOrder(Order o); //주문취소
	
	List selectAdmin(); // 관리자 전용 전체 주문내역 보기
}
