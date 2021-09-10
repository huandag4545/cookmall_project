<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/order/order_mylist(css).css?after">

</head>
<body>

	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->

	<!-- main 전체 컨테이너 -->
	<div class="main_container">
		<!-- nav 영역 설정 -->
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

		<!-- content 영역 -->
		<div class="content_area">
			<div class="page_title">주문내역</div>
			<div class="sub_title">${sessionScope.user_id }님의 주문내역</div>

			<!-- 리스트 시작 -->
			<div class="list_box">
				<!-- 주문내역이 없을시 나타나는 화면 -->
				<c:if test="${empty orderlist }">
					<div id="empty_orderlist">주문 내역이 없습니다.</div>
				</c:if>
				<!-- 주문내역이 있을시 나타나는 화면 -->
				<c:if test="${not empty orderlist }">
					<c:forEach var="o" items="${orderlist }" varStatus="status">
						<div id="order_content">
							<div class="order_num">${o.o_num }</div>
							<div class="prod_img">
								<img id="order_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&p_num=${o.p_num}">
							</div>
							<div class="prod_content">
								<div id="prod_name">
									제품명&nbsp;:&nbsp; <a
										href="${pageContext.request.contextPath}/product/product_detail?p_num=${o.p_num}">${o.p.p_name }</a>
								</div>
								<div id="prod_info">원산지&nbsp;:&nbsp;국내산</div>
								<div id="prod_price">주문총액&nbsp;:&nbsp;${o.p.p_price * o.o_quantity }원</div>
								<div id="order_quantity">주문수량&nbsp;:&nbsp;${o.o_quantity }</div>
							</div>
							<div class="order_date">${o.o_date }</div>
							<c:if test="${o.result == 0 }">
								<div class="order_result">배송중</div>
								<div class="cansel">
									<form
										action="${pageContext.request.contextPath }/order/delOrder"
										method="post">
										<input type="hidden" name="o_num" value="${o.o_num }">
										<input id="cen_btn" type="submit" value="주문취소하기">
									</form>
								</div>
							</c:if>
							<c:if test="${o.result == 1 }">
								<div class="order_result">배송완료</div>
							</c:if>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- 리스트 끝 -->
		</div>
		<!-- 컨텐츠영역 끝 -->
	</div>
	<!--  메인영역 끝 -->

	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->