package com.example.demo.cook_cart;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.cook_admin.AdminService;
import com.example.demo.cook_admin.Category;
import com.example.demo.cook_product.Product;
import com.example.demo.cook_product.ProductService;

@Controller
public class CartController {

	 public static String basePath = "C:\\SellerReImg\\";

	   @Autowired
	   private CartService cart_service;

	   @Autowired
	   private ProductService product_service;

	   @Autowired
	   private AdminService admin_Service;
	   
	   //@Autowired
	   //private ReviewService review_service;
	  
	   
	   // 찜하기
	   @RequestMapping(value = "/cart/cartInsert")
	   public ModelAndView cartInsert(@RequestParam(value = "user_id") String user_id,
	         @RequestParam(value = "p_num") int p_num) {
	      System.out.println("wishInsert : " + user_id + " " + p_num);
	      ModelAndView mav = new ModelAndView("/cart/cartJSON");
	      Cart w = new Cart();

	      int resultType = 0;

	      w.setC_num(cart_service.getNum());
	      w.setUser_id(user_id);
	      w.setProduct_num(p_num);

	      System.out.println("cartInsert w: " + w);
	      cart_service.insertWish(w);

	      try {
	         if (w != null) {
	            resultType = 1;
	            mav.addObject("resultType", resultType);
	         } 
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return mav;
	   }
	   
	   // 찜리스트에 상품 삭제
	   @RequestMapping("/cart/cartDel")
	   public ModelAndView cartDel(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "product_num") int product_num){
	      ModelAndView mav = new ModelAndView("/cart/cartJSON");
	      cart_service.delCart(user_id,product_num);
	      
	      int resultType = 0;
	      mav.addObject("resultType", resultType);
	      
	      return mav;
	   }
	   
	   
	   
	   // 장바구니에 출력
	   @RequestMapping(value = "/cart/cartList")
	   public ModelAndView cart(@RequestParam(value = "user_id") String user_id) {
	      ModelAndView mav = new ModelAndView("/cart/cart_List");
	      System.out.println("cartBoard 컨트롤러 : " + user_id);

	      // 세션 아이디를 가져와서 프로덕트 넘버를 호출하고 호출한 프로덕트 넘버로 P서비스에서 불러온다
	      ArrayList<Product> cartList = (ArrayList<Product>) cart_service.selectByUserId(user_id);
	      Product p = null;
	      
	      // 회수 리스트 가져오기
	      ArrayList<Integer> cartCountList	= new ArrayList<Integer>();
	      int cartCount = 0;
	    		  
	      /* 카테고리 가져오기 */
	      ArrayList<Category> c1 = new ArrayList<Category>(); 
	      ArrayList<Category> c2 = new ArrayList<Category>(); 
	  
	      // 사진 가져오기
	      ArrayList<String> fileList = new ArrayList<String>();
	      String path = "";
	      
	      // 댓글 숫자 가져오기
	  //    ArrayList<Integer> reviewCountList = new ArrayList<Integer>();
	 //     int reviewCount = 0;
	      
	      try {
	    	  
	    	  for (int i = 0; i < cartList.size(); i++) {
	    		  p = cartList.get(i);
	    		  System.out.println("장바구니출력 컨트롤 / p / get(i) : " + p);
	    		  
	    		  // 찜회수 가져오기
	    		  cartCount = cart_service.countUserIdByProductNum(p.getP_num());
	    		  cartCountList.add(cartCount);
	    		  System.out.println("장바구니출력 컨트롤 / cartCount : " + cartCount);
	    		  
	    		  // 댓글 가져오기
	    //		  reviewCount = review_service.countReviewUserIdByProductNum(p.getProduct_num());
	    //		  reviewCountList.add(reviewCount);
	    //		  System.out.println("위시출력 컨트롤 / reviewCount : " + reviewCount);
	    		  
	    		  // 사진 가져오기
	    		  path = basePath + p.getP_num() + "\\";
	    		  File imgDir = new File(path);
	    		  mav.addObject("path" + i, path);
	    		  
	    		  if (imgDir.exists()) {
	    			  String[] files = imgDir.list();
	    			  fileList.add(files[0]);
	    		  }
	    		  
	    		  // 카테고리 가져오기
	    		  Category category1 = admin_Service.selectCategory(p.getCa1_num(), 1);
	    		  c1.add(category1);
	    		  
	    		  Category category2 = admin_Service.selectCategory(p.getCa2_num(), 2);
	    		  c2.add(category2);
	    	
	    	  }
	      } catch (Exception e) {
	    	  e.printStackTrace();
	    	  
	      }
	      
	      
	      // 사진, 위시상품, 카테고리1/2/3, wishCount
	      System.out.println("cartList 컨트롤러, cartList : " + cartList);
	//      System.out.println("wishList 컨트롤러, reviewCountList : " + reviewCountList);
	      System.out.println("cartList 컨트롤러, cartCountList : " + cartCountList);
	      mav.addObject("cartList", cartList);
	      mav.addObject("c1", c1);
		  mav.addObject("c2", c2);
		  mav.addObject("fileList", fileList);
		  mav.addObject("cartCountList", cartCountList);
	//	  mav.addObject("reviewCountList", reviewCountList);
		  
		  return mav;
	   }

	   

	   // 찜리스트 전체 삭제
	   @RequestMapping("/cart/cartDelAll")
	   public String delAll(@RequestParam(value = "user_id") String user_id) {

	      cart_service.delcartAll(user_id);

	      return "redirect:/order/wish";
	   }
}
