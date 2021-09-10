package com.example.demo.cook_review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;	
	
	public void insertReview(Review r) {
		mapper.insertReview(r);
	}
	
	public void updateReview(Review r) {
		mapper.updateReview(r);
	}
	
	public void deleteReview(int review_num) {
		mapper.deleteReview(review_num);
	}
	
	public List selectAllReview() {
		return mapper.selectAllReview();
	}
	
	public List selectReviewByProductNum(int product_num) {
		return mapper.selectReviewByProductNum(product_num);
	}
	
	public int countReviewUserIdByProductNum(int product_num) {
		return mapper.countReviewUserIdByProductNum(product_num);
	}

}
