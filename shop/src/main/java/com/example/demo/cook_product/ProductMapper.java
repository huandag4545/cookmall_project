package com.example.demo.cook_product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {


	void insert(Product p); //추가
	List selectAll(); // 전체리스트
	Product selectByNum(int p_num); //상세검색
	List selectByName(String p_name); //검색창에서 검색하면 나오는리스트
	List selectByPrice(Map map); //최소가격 최대가격
	List selectByC1(int ca1_num); //대분류 리스트
	List selectByC2(int ca2_num); //중분류 리스트
	List selectByInfo(String p_info); // 원산지로 찾기
	void update(Product p); // 수정
	void delete(int p_num); //삭제
	int getNum();
	
	
//	int getTotalProductNum();
//	int getTodayProductNum();
}
