<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Jquery -->
   <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
   
   <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/index(css).css?afte">
   <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bxslider.css?afte">
   
   <!-- BX Slider -->
   <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
   
    <script type="text/javascript">
       $(document).ready(function() {
          $(".slider").bxSlider({
             auto : true,
             speed : 50,
             mode : 'fade',
             infiniteLoop : true,
             pager : true,
             slideWidth : 1800
          });
       });
    </script>
   
   <style type="text/css">
   h2{
   margin:auto;
   }
   h3{
   margin:auto;
   }
   </style>
</head>
<body>

   <!-- top 영역 시작 -->
   <c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
   <!-- top 영역 끝 -->
   
   
   
   <div class="main_banner_container">
       <div class="bx-viewport">
          <ul class="slider">
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img11.jpg"/>
            </li>
            
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img12.jpg" />
            </li>
                        
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img13.jpg" />
            </li>
            
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img14.jpg" />
            </li>
            
            <li>
               <img class="slider_img" src="${pageContext.request.contextPath }/assets/img/img15.jpg" />
            </li>
         </ul>
       </div>
    </div>
    <!-- 배너 슬라이드 끝 -->
      
   <div class="suggestion_area">
   <div class="sug_title">오늘의 추천 메뉴</div>
   <ul class="suggestion_menu">
      <div class="scale"><li><a href="#"><img class="sug1" src="/assets/img/sug1.jpg" /></a><hr/>닭가슴살 샐러드<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug2" src="/assets/img/sug2.jpg"/></a><hr/>새우파스타 샐러드<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug3" src="/assets/img/sug3.jpg"/></a><hr/>토마토 바질 파스타<br></li>   </div>

   </ul>
   </div>
   
      <div class="sale_area">
   <div class="sug_title">오늘의 특별 할인</div>
   <ul class="suggestion_menu">
      <div class="scale"><li><a href="#"><img class="sug1" src="/assets/img/eggs.jpg" /></a><hr/>싱싱한 계란<br>5,000원<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug2" src="/assets/img/tomato.jpg"/></a><hr/>유기농 토마토<br>4,500원<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug3" src="/assets/img/melon1.jpg"/></a><hr/>달달 메론<br>7,000원<br></li></div>

   </ul>
   </div>
<!-- 
   <ul class="sale_area">
      <li><h2>오늘의 특가</h2><br><h3>-<br>24시간 한정 특가</h3></li>
      <li><a href="#"><img class="sal1" src="/assets/img/sale1.jpg"/></a></li>
   
   </ul>
 -->


</body>
</html>