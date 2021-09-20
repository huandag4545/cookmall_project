package com.example.demo.cook_review;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.cook_admin.AdminService;
import com.example.demo.cook_product.ProductService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService review_Service;
	@Autowired
	private ProductService product_service;
	
	@Autowired
	private AdminService admin_service;
	
	public static String basePath = "C:\\cookimg\\";

	
	// 리뷰 작성
	@RequestMapping(value = "/review/insertReview")
	@ResponseBody
	public Map<String, Object> insertReview(Review r, @RequestParam(required = false) Map param) {
		System.out.println("param ==> " + param);
		
		review_Service.insertReview(r);
		

		
		Map<String, Object> result = new HashMap<>();
		result.put("success", true);
		result.put("message", "리뷰 작성 완료");
		
		return result;
	}
	
	// 리뷰 수정
	@RequestMapping(value = "/review/updateReview")
	public String updateReview(RedirectAttributes redirect ,Review r) {
		
		
		review_Service.updateReview(r);
		
		redirect.addAttribute("product_num", r.getProduct_num());
		redirect.addAttribute("user_id", r.getWriter_id());
		
		return "redirect:/product/productDetail";
	}
	
	// 리뷰 삭제
	@RequestMapping(value = "/review/deleteReview")
	@ResponseBody
	public Map<String, Object> deleteReview(@RequestParam("review_num")int review_num) {
		System.out.println("del_review_num="+review_num);
		review_Service.deleteReview(review_num);
		Map<String, Object> result = new HashMap<>();
		result.put("success", true);
		result.put("message", "리뷰 삭제 완료");
		
		return result;
	}
	
//	 리뷰 출력
	@RequestMapping(value = "/reivew/selectAllReview")
	public ModelAndView selectAllList(@RequestParam ("product_num")int product_num) {
		System.out.println("rep 출력영역");
		System.out.println(product_num);
		
		ModelAndView mav = new ModelAndView("/review/reviewJSON");
		ArrayList<Review> allReviewList = 
		(ArrayList<Review>) review_Service.selectAllReview(product_num);
		mav.addObject("reps", allReviewList);
		return mav;
		
	}
    
}
