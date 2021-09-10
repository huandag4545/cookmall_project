package com.example.demo.cook_review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	void insertReview (Review r);
	
	void updateReview(Review r);
	
	void deleteReview(int review_num);
	
	List selectAllReview();
	
	List selectReviewByProductNum(int product_num);
	
	int countReviewUserIdByProductNum(int product_num);
}
