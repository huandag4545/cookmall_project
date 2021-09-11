package com.example.demo.cook_product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.cook_admin.AdminService;
import com.example.demo.cook_admin.Category;
import com.example.demo.cook_user.User;
import com.example.demo.cook_user.UserService;

@Controller
public class ProductController {


	@Autowired
	private ProductService product_service;

	@Autowired
	private AdminService admin_service;
	
	@Autowired
	private UserService user_service;
	
	public static String basePath = "C:\\cookimg\\";

	// product_add.jsp로 이동
	@GetMapping(value = "/product/product_add")
	public void productAddForm() {

	}

	// 이미지저장 메서드
		public void saveImg(int num, MultipartFile file) {
			String fileName = file.getOriginalFilename();
			if (fileName != null && !fileName.equals("")) {
				File dir = new File(basePath + num);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File f = new File(basePath + num + "\\" + fileName);
				try {
					file.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		// product_add.jsp에서 데이터를 가져와 함수실행
		@RequestMapping(value = "/product/add")
		public String addProduct(Product p,@RequestParam("ca1_num")int ca1_num) {
			System.out.println(ca1_num);
			int num = product_service.getNum();
			p.setP_num(num);
			product_service.addProduct(p);
			saveImg(num, p.getP_img1());
			saveImg(num, p.getP_img2());
			saveImg(num, p.getP_img3());
			saveImg(num, p.getP_infoimg());
			
			System.out.println(p.getP_name());
			System.out.println(p.getP_info());
			System.out.println(p.getP_price());
			System.out.println(p.getResult());
			System.out.println(p.getCa1_num());
			System.out.println(p.getCa2_num());
			return "/product/addsucess";
		}

		// product_allList 이동 등록한 제품의 리스트들을 출력
		@RequestMapping(value = "/product/prodlist")
		public ModelAndView allList(Product p) {
			ModelAndView mav = new ModelAndView("/product/product_list");
			ArrayList<Product> allprodlist = (ArrayList<Product>) product_service.AllList();
			ArrayList<String> filelist = new ArrayList<String>();
			String path = "";
			for (int i = 0; i < allprodlist.size(); i++) {
				p = allprodlist.get(i);
				path = basePath + p.getP_num() + "\\";
				File imgDir = new File(path);
				mav.addObject("path" + i, path);

				if (imgDir.exists()) {
					String[] files = imgDir.list();
					filelist.add(files[0]);
				}
			}
			mav.addObject("allprodlist", allprodlist);
			mav.addObject("fileList", filelist);
	
			return mav;
		}

		// 이미지를 헤더에 저장
		@RequestMapping("productImg")
		public ResponseEntity<byte[]> getImg(@RequestParam("fname") String fname, @RequestParam("p_num") int p_num) {

			String path = basePath + p_num + "\\" + fname;
			File f = new File(path);
			HttpHeaders header = new HttpHeaders();
			ResponseEntity<byte[]> result = null;

			try {// 헤더에
				header.add("Content-Type", Files.probeContentType(f.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);

			} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
		}

		@RequestMapping(value = "/product/productdetail")
		public ModelAndView productDetail(@RequestParam(value = "p_num") int p_num) {
			ModelAndView mav = new ModelAndView("/product/product_detail");
			
			Product p = product_service.selectByNum(p_num);
			Category c1 = admin_service.selectCategory(p.getCa1_num(), 1);
			Category c2 = admin_service.selectCategory(p.getCa2_num(), 2);
			mav.addObject("c1",c1);
			mav.addObject("c2",c2);
			
			String path = basePath + p.getP_num() + "\\";
			File imgDir = new File(path);
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				for (int j = 0; j < files.length; j++) {
					mav.addObject("file" + j, files[j]);
					System.out.println(files[j]);
				}
			}
			mav.addObject("p", p);

			return mav;
		}

		@RequestMapping(value = "/product/proddel")
		public String del(@RequestParam(value = "p_num") int p_num) {
			product_service.delete(p_num);
			String path = basePath + p_num + "\\";
			File imgDir = new File(path);
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				for (int j = 0; j < files.length; j++) {

					File f = new File(path + files[j]);
					f.delete();
				}
			}
			imgDir.delete();
			return "/product/delsucess";
		}

		@RequestMapping(value = "/product/editForm")
		public ModelAndView editForm(@RequestParam("p_num") int p_num) {
			Product p = product_service.selectByNum(p_num);
			ModelAndView mav = new ModelAndView("/product/product_edit");
			mav.addObject("p", p);
			return mav;

		}

		@RequestMapping(value = "/product/productedit")
		public String edit(Product p, @RequestParam(value = "p_num") int p_num,HttpServletRequest req) {
			String path = basePath + p_num + "\\";
			File imgDir = new File(path);
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				for (int j = 0; j < files.length; j++) {
					File f = new File(path + files[j]);
					f.delete();
				}
			}
			saveImg(p_num, p.getP_img1());
			saveImg(p_num, p.getP_img2());
			saveImg(p_num, p.getP_img3());
			saveImg(p_num, p.getP_infoimg());
			
			req.setAttribute("p_num", p_num);
			product_service.update(p);

			return "/product/editsucess";
		}

		// 이름으로 검색한 리스트 출력 ****마지막에 시간이남는다면 추가***
		@RequestMapping(value = "/product/nameList")
		public ModelAndView nameList(@RequestParam(value = "p_name") String p_name, Product p) {
			ModelAndView mav = new ModelAndView("/search/search");
			System.out.println(p_name);
			ArrayList<Product> prodlist = (ArrayList<Product>) product_service.SearchList(p_name);
			ArrayList<String> fileList = new ArrayList<String>();
			String path = "";
			for (int i = 0; i < prodlist.size(); i++) {
				p = prodlist.get(i);
				path = basePath + p.getP_num() + "\\";
				File imgDir = new File(path);
				mav.addObject("path" + i, path);

				if (imgDir.exists()) {
					String[] files = imgDir.list();
					fileList.add(files[0]);
				}
			}
			mav.addObject("prodlist", prodlist);
			mav.addObject("fileList", fileList);
			return mav;
		}

		// 가격으로 검색한 리스트 출력
		@RequestMapping(value = "/product/selectProductByPrice")
		public ModelAndView priceList(@RequestParam(value = "min") int min, @RequestParam(value = "max") int max,
				Product p) {
			ModelAndView mav = new ModelAndView("/product/product_list");
			ArrayList<Product> allprodlist = (ArrayList<Product>) product_service.PriceList(min, max);
			ArrayList<String> fileList = new ArrayList<String>();
			
			String path = "";
			for (int i = 0; i < allprodlist.size(); i++) {
				p = allprodlist.get(i);
				path = basePath + p.getP_num() + "\\";
				File imgDir = new File(path);
				mav.addObject("path" + i, path);

				if (imgDir.exists()) {
					String[] files = imgDir.list();
					fileList.add(files[0]);
				}
			}
			mav.addObject("allprodlist", allprodlist);
			mav.addObject("fileList", fileList);
			return mav;
		}
	
	 @RequestMapping(value= "/product/searchKeyword")
	    public ModelAndView searchKeywordResult(@RequestParam(value = "user_id") String user_id, 
	    										@RequestParam(value = "searchKeyword") String searchKeyword) {
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/product/product_list");
	      Product p = null;
	      ArrayList<Product> allProdList = (ArrayList<Product>) product_service.SearchList(searchKeyword);
	      /* 카테고리 가져오기 */
	      ArrayList<Category> c1 = new ArrayList<Category>(); 
	      ArrayList<Category> c2 = new ArrayList<Category>(); 
	      
		  // 관리자일 경우
	      if (user_id != "") {
	    	  User u = user_service.checkUserId(user_id);
	      
		       if (u.getUser_type() == 2) {
		    	  if(allProdList.isEmpty()) {
		    		  allProdList.add(new Product(0, "", 0, "", 0, 0, null,0));
		    	  }
		    	  mav.setViewName("/admin/productJSON");
		    	  mav.addObject("allProdList", allProdList);
		      }
	      }
	      /* 등록된 이미지 가져오기 */
	  		ArrayList<String> fileList = new ArrayList<String>();
	  		String path = "";
	  	
		  	for (int i = 0; i < allProdList.size(); i++) {
		  		p = allProdList.get(i);
		  		path = basePath + p.getP_num() + "\\";
		  		File imgDir = new File(path);
		  		mav.addObject("path" + i, path);
		  		
		  		if (imgDir.exists()) {
		  			String[] files = imgDir.list();
		  			fileList.add(files[0]);
	  		}
	  		
	  		Category category1 = admin_service.selectCategory(allProdList.get(i).getCa1_num(), 1);
	  		c1.add(category1);
	  		
	  		Category category2 = admin_service.selectCategory(allProdList.get(i).getCa2_num(), 2);
	  		c2.add(category2);
	  		
	  	}
	      
	      
	      mav.addObject("allProdList", allProdList);
	      mav.addObject("searchKeyword", searchKeyword);
	      mav.addObject("fileList", fileList);
	      mav.addObject("c1", c1);
	      mav.addObject("c2", c2);
	      
	      return mav;
	    }

	

	 @RequestMapping("/product/cate1_prodlist")
	 public ModelAndView cate1_prodlist(@RequestParam ("ca1_num")int ca1_num,Product p) {
			ModelAndView mav = new ModelAndView("/product/product_list");
			ArrayList<Product> allprodlist = (ArrayList<Product>)product_service.Cate1List(ca1_num);
			ArrayList<String> fileList = new ArrayList<String>();
			String path = "";

			
			for (int i = 0; i < allprodlist.size(); i++) {
				p = allprodlist.get(i);
				path = basePath + p.getP_num() + "\\";
				File imgDir = new File(path);
				mav.addObject("path" + i, path);

				if (imgDir.exists()) {
					String[] files = imgDir.list();
					fileList.add(files[0]);
				}
			}
			mav.addObject("allprodlist", allprodlist);
			mav.addObject("fileList", fileList);
			return mav;
		}
	 }
