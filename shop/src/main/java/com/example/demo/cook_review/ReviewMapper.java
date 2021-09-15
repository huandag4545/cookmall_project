package com.example.demo.cook_review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	void insertReview (Review r);
	void insertReviewMap (Map param);
	
	void updateReview(Review r);
	
	void deleteReview(int review_num);
	
	List selectAllReview(int product_num);
	
	List selectReviewByProductNum(int product_num);
	
	int countReviewUserIdByProductNum(int product_num);
}
