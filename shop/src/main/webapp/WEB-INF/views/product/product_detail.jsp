<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/product/productDetail(css).css?after">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function() {
		$(".img").mouseover(function() {
			$("#bigImg").attr('src', this.src);
		});

		$("#del").click(function() {
			if (!confirm('정말로 삭제하시겠습니까?')) {
				return false;
			}
			$("#f1").attr('action', '/product/proddel');
			$("#f1").submit();
		});

		$("#cart_in").click(function() {
			alert('장바구니에 담겼습니다.');
			$("#f2").attr('action', '/cart/cartInsert');
			$("#f2").submit();
		});

		$("#prod_quantity").change(function() {
			var value = $("#prod_quantity option:selected").val();
			var price = ${p.p_price};
			var total = value * price;
			$("#total_price").html(total);
		});
		
		$("#order_btn").click(function(){
			var value = $("#prod_quantity option:selected").val();
			if(value==0){
				alert('수량을 입력해주세요');
				return false;
			}
		});
		
	});
</script>
</head>
<body>
	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->
	<div class="product_detail_all_container">
		<div class="pagetitle">상품 상세 페이지</div>
		<div class="content_container">
			<table id="img_table">
				<c:if test="${empty file0 }">
							등록된 이미지가 없습니다.
							</c:if>
				<c:if test="${not empty file0 }">
					<tr>
						<td colspan="3"><img id="bigImg"
							src="${pageContext.request.contextPath }/productImg?fname=${file0 }&p_num=${p.p_num }"></td>
					</tr>
					<tr>
						<td><img
							src="${pageContext.request.contextPath }/productImg?fname=${file0 }&p_num=${p.p_num }"
							class="img"></td>
						<td><img
							src="${pageContext.request.contextPath }/productImg?fname=${file1 }&p_num=${p.p_num }"
							class="img"></td>
						<td><img
							src="${pageContext.request.contextPath }/productImg?fname=${file2 }&p_num=${p.p_num }"
							class="img"></td>
					</tr>
				</c:if>
			</table>
			<div class="content_box">
				<div id="prod_name">□ ${p.p_name }</div>
				<div id="prod_info">${p.p_info }</div>
				<div id="prod_price">${p.p_price }원</div>
				<div id="prod_cate">분류 : ${c1.ca_name}/${c2.ca_name}</div>
				<form
					action="${pageContext.request.contextPath }/order/orderForm?user_id=${sessionScope.id}"
					method="post" id="f2">
					<input type="hidden" name="p_num" value="${p.p_num}">
					<div id="prod_quantity_box">
						수량 : <select id="prod_quantity" name="quantity">
							<option value="0" autofocus="autofocus">수량선택</option>
							<option value="1">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
					<div id="total_price_box">
						총 합계:<span id="total_price"></span>원
					</div>
					<!-- 유저 로그인시 버튼-->
					<div class="btn_area">
						<c:if test="${sessionScope.user_type==1 }">
							<input class="btn" id="order_btn" type="submit" value="주문하기">
							<input type="button" value="장바구니 담기" id="cart_in" class="btn">
						</c:if>
					</div>
				</form>
				<!-- 관리자 로그인시 버튼 -->
				<div class="btn_area">
					<c:if test="${sessionScope.user_type == 2 }">
						<form action="${pageContext.request.contextPath}/product/editForm"
							method="post" id="f1">
							<input type="hidden" name="p_num" value="${p.p_num }"> <input
								type="submit" value="수정" class="btn"> <input
								type="button" id="del" class="btn" value="삭제">
						</form>
					</c:if>
				</div>
			</div>


			<div>
				<c:if test="${empty file0 }">
			등록된 이미지가 없습니다.</c:if>
				<c:if test="${not empty file0 }">
					<img id="Infoimg" src="${pageContext.request.contextPath }/productImg?fname=${file3 }&p_num=${p.p_num }">
				</c:if>
			</div>

		</div>
		<c:if test="${sessionScope.user_id != null }">
			<div class="reviewBox">
				<form ac></form>
			</div>
		</c:if>
	</div>
	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>