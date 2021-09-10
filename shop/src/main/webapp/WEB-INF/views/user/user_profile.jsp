<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user/userProfile(css).css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/order/order_mylist(css).css?after">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	
	<!-- JavaScript -->
	<script src="${pageContext.request.contextPath }/assets/js/user/userProfile.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
</head>
<body>
	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->

	<div class="main_container">
	<!-- 유저 정보 컨테이너 -->
	<div class="user_info_container">
	
	
	 <c:if test="${sessionScope.user_type == 1 }">
		<nav class="side_nav">
			<div class="title">마이페이지</div>
			<ul id="nav_ul">
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/user/user_profile">내정보관리</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/order/orderList">주문내역</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/cart/cartList?user_id=${sessionScope.user_id}">장바구니</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/qna/mav_qna_list?qna_type=1">문의내역</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }">회원탈퇴</a></li>
			</ul>
		</nav>
		</c:if>
	<div class="content_area">
	
	
		<div class="user_info_area">

			<!-- 유저 닉네임 & ID 영역 -->
			<div class="user_id_nick_area">
				<div>닉네임 ${sessionScope.user_nickname }${u.user_id}</div><br>
				<div>${u.user_nickname }</div><br>
				<div>&nbsp;&nbsp;아이디:(${sessionScope.user_id })</div>
			</div>
			<div>
				<div>
						<a href="${pageContext.request.contextPath }/user/user_edit"> 
							<input type="button" class="editbtn" value="정보수정" />
						</a>
				</div>
				</div>
				</div>
	<hr />
			 <a class="list" href="${pageContext.request.contextPath }/order/orderList"> 주문 목록 </a>
	</div>
	</div>
	<!-- <div class="my_refrigerator"></div> (나의 냉장고)-->
	</div>
	
	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>