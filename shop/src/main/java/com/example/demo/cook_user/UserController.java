package com.example.demo.cook_user;

//import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

   public static String basePath = "C:\\cookingmallImg\\";

   @Autowired
   private UserService user_Service;

   // index로 이동
   @RequestMapping(value = "/index")
   public ModelAndView index() {

      System.out.println("home index text");
      ModelAndView mav = new ModelAndView("/index");

      return mav;
   }

   // login으로 이동
   @GetMapping(value = "/user/login")
   public void login() {

   }

   // signup_agree로 이동
   @RequestMapping(value = "/user/signup_agree")
   public void signup_agree() {

   }

   // signupForm로 이동
   @RequestMapping(value = "/user/signupform")
   public void signupform() {

   }

   // find_pwd로 이동
   @RequestMapping(value = "/user/find_pwd")
   public void findPwForm() {

   }
   
   // user_profile로 이동
   @GetMapping(value = "/user/user_profile")
   public void profileForm() {
         
   }
   
   // user_edit로 이동
      @GetMapping(value = "/user/user_edit")
      public void user_edit() {
            
   }
      
   // ==================== ▲ Page Control ▲ ====================

   //회원가입 Service 실행 후 로그인 페이지로 이동
   @RequestMapping(value = "/user/signup")
   public String join(User u) {

      user_Service.addUser(u);

      return "redirect:/user/login";
   }
   
   // 로그인 후 메인페이지로 이동
   @RequestMapping(value = "/user/login")
   public String loginOk(HttpServletRequest request, @RequestParam(value = "user_id") String user_id) {

      User u = user_Service.checkUserId(user_id);
      HttpSession session = request.getSession();
      session.setAttribute("user_id", u.getUser_id());
      session.setAttribute("user_nickname", u.getUser_nickname());
      session.setAttribute("user_type", u.getUser_type());

      if (u.getUser_type() == 1) {
         return "redirect:/index";
      } else if (u.getUser_type() == 2) {
         return "/admin/adminMain";
      }

      return null;
   }

   // 회원검색하여 수정창을 띄우는 메소드
   @RequestMapping(value = "/user/userEdit")
   public ModelAndView userEdit(HttpServletRequest request) {

      ModelAndView mav = new ModelAndView("/user/userEdit");
      HttpSession session = request.getSession(false);
      String user_id = (String) session.getAttribute("user_id");

      User u = user_Service.checkUserId(user_id);
      mav.addObject("u", u);

      return mav;
   }

   // 회원정보 수정을 실행하는 메소드
   @RequestMapping(value = "user/edit")
   public String edit(HttpServletRequest request, RedirectAttributes redirect, User u,
                  @RequestParam(value = "user_id") String user_id) {

      HttpSession session = request.getSession(false);
      session.setAttribute("user_nickname", u.getUser_nickname());

      user_Service.editUser(u);

      redirect.addAttribute("user_id", user_id);

      return "redirect:/user/userprofile";
   }

   // 로그아웃 후 메인페이지로 이동
   @RequestMapping(value = "/user/logout")
   public String logout(HttpServletRequest request) {

      HttpSession session = request.getSession(false);
      session.removeAttribute("user_id");
      session.invalidate();

      return "redirect:/index";
   }

   // 회원 탈퇴를 실행하는 메소드
   @RequestMapping(value = "/user/userDelete")
   public String userDelete(HttpServletRequest request) {

      HttpSession session = request.getSession(false);
      String user_id = (String) session.getAttribute("user_id");
      user_Service.deleteUser(user_id);

      session.removeAttribute("user_id");
      session.invalidate();

      return "redirect:/index";
   }

   // 아이디 중복 검사
   @RequestMapping(value = "/user/IdCheck")
   @ResponseBody
   public String checkId(@RequestParam(value = "user_id") String user_id) {
      
      int id_result = user_Service.idCheck(user_id);
      
      if (id_result != 0) {
         return "fail"; // 중복일 때
      } else {
         return "success"; // 중복이 아닐때
      }
   }

   // 닉네임 중복 검사
   @RequestMapping(value = "/user/nicknameCheck")
   @ResponseBody
   public String checkName(@RequestParam(value = "user_nickname") String user_nickname) {
      
      int name_result = user_Service.nicknameCheck(user_nickname);
      
      if (name_result != 0) {
         return "fail";
      } else {
         return "success";
      }
   }

   //이메일 중복 검사
   @RequestMapping(value = "/user/emailCheck")
   @ResponseBody
   public String checkEmail(@RequestParam(value = "user_email") String user_email) {
      
      int name_result = user_Service.emailCheck(user_email);
      
      if (name_result != 0) {
         return "fail";
      } else {
         return "success";
      }
   }

   // 임시 비밀번호찾기
   @RequestMapping(value = "/user/pwdCheck")
   public ModelAndView findPwd(@RequestParam(value = "user_email") String user_email) {
      
	   ModelAndView mav = new ModelAndView("/user/pwdCheck"); 
	      int result = user_Service.emailCheck(user_email);
	      User u = user_Service.selectUserEmail(user_email);

	     
			 mav.addObject("result", result);
			 mav.addObject("u",u);
			 return mav;
			 
   }
   
   //  로그인 시 아이디 & 비밀번호 체크
   @RequestMapping(value = "/user/userLoginCheck")
   public ModelAndView loginCheck(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "user_pwd") String user_pwd) {
      
      ModelAndView mav = new ModelAndView("user/userLoginCheckJSON");
      User u = user_Service.checkUserId(user_id);
      String pwd2 = u.getUser_pwd();
      String result = "";
      
      if (!user_pwd.equals(pwd2)) {
         result = "비밀번호가 맞지 않습니다.";
         mav.addObject("result", result);
      } else {
         mav.addObject("result", result);
         mav.addObject("user_id", user_id);
      }
      
      return mav;
   }
	
	
}

