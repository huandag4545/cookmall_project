package com.example.demo.cook_order;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.cook_product.Product;
import com.example.demo.cook_product.ProductService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;
	
	public static String basePath = "C:\\cookimg\\";

	
	@RequestMapping(value = "/order/orderForm")
	public ModelAndView orderForm(@RequestParam("quantity") int quantity, @RequestParam("p_num") int p_num,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/order/order_form");
		Product p = productService.selectByNum(p_num);
		
		String path = basePath + p.getP_num() + "\\";
		File imgDir = new File(path);
		
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
				System.out.println(files[j]);
			}
		}
		
		int total = p.getP_price() * quantity;
		req.setAttribute("quantity", quantity);
		req.setAttribute("p_num", p_num);
		req.setAttribute("total", total);

		mav.addObject("p",p);

		return mav;
	}
	
//	//주문하기 폼으로이동
//	@RequestMapping(value = "/order/orderForm")
//	public String orderForm(@RequestParam("quantity") int quantity, @RequestParam("p_num") int p_num,
//			HttpServletRequest req) {
//		Product p = productService.selectByNum(p_num);
//		int total = p.getP_price() * quantity;
//		req.setAttribute("quantity", quantity);
//		req.setAttribute("p_num", p_num);
//		req.setAttribute("total", total);
//
//		System.out.println(p_num);
//
//		return "/order/order_form";
//	}
	//주문하기 기능
	@RequestMapping(value = "/order/orderadd")
	public String orderadd(Order o) {
		//확인하는 코드
		System.out.println(o.getO_num());
		System.out.println(o.getO_quantity());
		System.out.println(o.getO_postcode());
		System.out.println(o.getO_addr1());
		System.out.println(o.getO_addr2());
		System.out.println(o.getP_num());
		System.out.println(o.getUser_id());
		System.out.println(o.getResult());
		System.out.println("***** 주문 input값 출력 test*****");
		orderService.orderAdd(o);
		return "/order/sucess";
	}
	// 유저별 주문 내역 
	@RequestMapping(value = "/order/orderList")
	public ModelAndView orderList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("/order/myOrderList");
		HttpSession session = req.getSession(false);
		String user_id = (String) session.getAttribute("user_id");
		ArrayList<Order> orderlist = (ArrayList<Order>) orderService.orderList(user_id);
		ArrayList<String> filelist = new ArrayList<String>();
		String path="";
		
		
		for (int i = 0; i < orderlist.size(); i++) {
			Order o = orderlist.get(i);
			o.setP(productService.selectByNum(o.getP_num()));
			System.out.println("*****주문리스트 출력 test*****");
			System.out.println(o.getO_num());
			System.out.println(o.getO_quantity());
			System.out.println(o.getO_postcode());
			System.out.println(o.getO_addr1());
			System.out.println(o.getO_addr2());
			System.out.println(o.getP_num());
			System.out.println(o.getUser_id());
			System.out.println(o.getResult());
			
			path = basePath+o.getP_num()+"\\";
			File imgDir = new File(path);
			mav.addObject("path"+i,path);
			
			if(imgDir.exists()) {
				String[] files = imgDir.list();
				filelist.add(files[0]);
			}			
		}
		
		mav.addObject("fileList",filelist);
		mav.addObject("orderlist", orderlist);
		return mav;
	}
	// 주문삭제 
	@RequestMapping(value = "/order/delOrder")
	public String OrderDel(@RequestParam("o_num") int o_num,HttpServletRequest req) {
		orderService.orderDel(o_num);
		HttpSession session = req.getSession(false);
		int type = (int)session.getAttribute("user_type");
		System.out.println(type);
		String path = "";
		if(type == 1) {
			return "/order/delsucess";
		}else if(type == 2) {
			return "/admin/delsucess";
		}
		return null;
	}
	//관리자 주문관리페이지 이동
	@RequestMapping(value = "/order/orderadmin")
	public ModelAndView orderadmin() {
		ModelAndView mav = new ModelAndView("/admin/admin_order");
		ArrayList<Order> orderlist = (ArrayList<Order>)orderService.selectAdmin();
		
		for(int i =0; i<orderlist.size();i++) {
			Order o = orderlist.get(i);
			o.setP(productService.selectByNum(o.getP_num()));
			System.out.println(o.getO_num());
			System.out.println(o.getO_date());
		}
		mav.addObject("orderlist",orderlist);
		return mav;
	}
	// 배송완료 result값 변환 메서드
	@RequestMapping(value = "/order/resultChange")
	public String resultChange(Order o) {
		orderService.orderSucess(o);
		
		return "/admin/resultchangesucess";
	}
}
