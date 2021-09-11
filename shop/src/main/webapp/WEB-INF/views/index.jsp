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
   
    <script>
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
   
   <style>
	   h2{
	   margin:auto;
	   }
	   h3{
	   margin:auto;
	   }
   </style>
</head>
<body>

   <!-- top ���� ���� -->
   <c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
   <!-- top ���� �� -->
   
   
   <div>
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
    </div>
    <!-- ��� �����̵� �� -->
      
   <div class="suggestion_area">
   <div class="sug_title">������ ��õ �޴�</div>
   <ul class="suggestion_menu">
      <div class="scale"><li><a href="#"><img class="sug1" src="/assets/img/sug1.jpg" /></a><hr/>�߰����� ������<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug2" src="/assets/img/sug2.jpg"/></a><hr/>�����Ľ�Ÿ ������<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug3" src="/assets/img/sug3.jpg"/></a><hr/>�丶�� ���� �Ľ�Ÿ<br></li>   </div>

   </ul>
   </div>
   
      <div class="sale_area">
   <div class="sug_title">������ Ư�� ����</div>
   <ul class="suggestion_menu">
      <div class="scale"><li><a href="#"><img class="sug1" src="/assets/img/eggs.jpg" /></a><hr/>�̽��� ���<br>5,000��<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug2" src="/assets/img/tomato.jpg"/></a><hr/>����� �丶��<br>4,500��<br></li></div>
      <div class="scale"><li><a href="#"><img class="sug3" src="/assets/img/melon1.jpg"/></a><hr/>�޴� �޷�<br>7,000��<br></li></div>

   </ul>
   </div>
<!-- 
   <ul class="sale_area">
      <li><h2>������ Ư��</h2><br><h3>-<br>24�ð� ���� Ư��</h3></li>
      <li><a href="#"><img class="sal1" src="/assets/img/sale1.jpg"/></a></li>
   
   </ul>
 -->


   <!-- footer ���� ���� -->
   <c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
   <!-- footer �� -->

</body>
</html>