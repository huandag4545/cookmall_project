<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/order/order_form(css).css?after">


<!-- Jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 다음 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath }/assets/js/daumPostCode.js"></script>
</head>
<body>


	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->


	<div class="orderform_area">
		<div class="page_title">주문 상세페이지</div>
		
		<div class="product_title">□&nbsp;&nbsp;주문내역</div>
		<div class="product_info">
			<div class="prod_img"><img id="order_img" src="${pageContext.request.contextPath }/productImg?fname=${file0 }&p_num=${p.p_num }"></div>
			<div class="prod_content">
				<div id="prod_name">제품명&nbsp;:&nbsp; ${p.p_name }</div>
				<div id="prod_info">원산지&nbsp;:&nbsp;${p.p_info }</div>
				<div id="prod_price">제품가격&nbsp;:&nbsp;${p.p_price }원</div>
				<div id="order_quantity">주문수량&nbsp;:&nbsp;${quantity } 개</div>
			</div>
		</div>
		
		
		<div class="order_form_area">
			<div id="order_title">□&nbsp;&nbsp;주문 상세정보 입력</div>
			<form action="${pageContext.request.contextPath}/order/orderadd"
				method="post">
				<input type="hidden" name="user_id" value="${sessionScope.user_id}">
				<input type="hidden" name="o_quantity" value="${quantity} ">
				<input type="hidden" name="p_num" value="${p_num} "> <input
					type="hidden" name="result" value="0">
				<!-- 우편번호 (postcode) -->
				<div class="form-group">
					<label class="fo" for='postcode'> * 우편번호</label>
					<div class="col-md-15 clearfix" id="post_container">
						<input type="text" name="o_postcode" id="postcode"
							class="form-control pull-left"
							style='width: 30rem; margin-right: 5px' />
						<!-- 클릭 시, Javascript 함수 호출 : openDaumPostcode() -->
						<input type='button' value='우편번호 찾기' class='btn btn-warning'
							id="btn1"
							onclick='execDaumPostcode("postcode", "addr1", "addr2")' required />
					</div>
				</div>

				<!-- 주소 (user_addr1) -->
				<div class="form-group">
					<label class="fo" for='addr1' class="col-md-6"> * 주소</label>
					<div class="col-md-15">
						<input type="text" name="o_addr1" id="addr1" class="form-control"
							required />
					</div>
				</div>

				<!-- 상세주소 (user_addr2) -->
				<div class="form-group">
					<label class="fo" for='addr2' class="col-md-6"> * 상세주소</label>
					<div class="col-md-15">
						<input type="text" name="o_addr2" id="addr2" class="form-control"
							required />
					</div>
				</div>

				<div class="total_area"> 총금액 : ${total}</div>
				<div class="input_area"><input id="sb_btn" type="submit"
					value="구매하기 "></div>
			</form>
			</div>
		</div>
		
	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>