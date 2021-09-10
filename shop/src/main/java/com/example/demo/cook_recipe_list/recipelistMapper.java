package com.example.demo.cook_recipe_list;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface recipelistMapper {

	void insertrecipelist(recipelist r);			//레시피 추가

	List selectAllrecipelist();					//레시피 리스트 출력
	
	recipelist selectrecipelist(int rl_num);	//rl_num으로 레시피 출력
	
	void updaterecipelist(recipelist r);			//레시피 수정
	
	void deleterecipelist(int rl_num);		//레시피 삭제
}
