package com.example.demo.cook_admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	// 카테고리 추가
		void insertCategory1(Category c);
		void insertCategory2(Category c);


		// 카테고리 선택
		Category selectCategory1(int ca_num);
		Category selectCategory2(int ca_num);

		
		// 카테고리 전체 선택
		List selectAllCategory1();
		List selectAllCategory2(int parent_category_num);
		
		// 카테고리 수정
		void updateCategory1(Category c);
		void updateCategory2(Category c);
		
		// 카테고리 삭제
		void deleteCategory1(int ca_num);
		void deleteCategory2(int ca_num);
		
		int getNum1();
		int getNum2();
	
}
