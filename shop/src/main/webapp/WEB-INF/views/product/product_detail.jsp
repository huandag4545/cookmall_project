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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/review/review.css?afte">
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

		$("#order_btn").click(function() {
			var value = $("#prod_quantity option:selected").val();
			if (value == 0) {
				alert('수량을 입력해주세요');
				return false;
			}
		});

		$("#review_btn").click(function() {
			var rev_box = $("#rev_box option:selected").val();
			var review_content = $("#review_content").val();
			var user_id = '${sessionScope.user_id}';
			
			if(review_content == ""){
				alert("리뷰를 입력해주세요.");
				$("#review_content").val("");
				return false;
			}else if(rev_box==0){
				alert('별점을 입력해주세요');
				return false;
			}
			
			if (user_id == null || user_id == "") {
				alert("로그인 하세요");
			} else {
				
				$.ajax({
					type : 'POST',
					url : '/review/insertReview',
					data : $("#rev_form").serialize(),
					success : function(result) {
						if (result.success) {
							alert(result.message);
							location.reload();
						} else {
							alert("작성 실패");
						}

					}
				});
			}
		});
		

		
	});
	
	function reviewDelete(reviewNum) {
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type : 'POST',
				url : '/review/deleteReview',
				data : {
					"review_num" : reviewNum // json 으로 전송 가능하게 파라미터를 만들어 준다.
				},
				// json 으로 만들어진 param 이라는 변수를 컨트롤러로 전송한다.
				success : function(result){
					if (result.success) {
						alert(result.message);
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
	

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
						총 합계:<span id="total_price"> </span>원
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
						<form action="${pageContext.request.contextPath}/product/editForm" method="post" id="f1">
							<input type="hidden" name="p_num" value="${p.p_num }">
							<input type="submit" value="수정" class="btn">
							<input type="button" id="del" class="btn" value="삭제">
						</form>
					</c:if>
				</div>
			</div>


			<div>
				<c:if test="${empty file0 }">
			등록된 이미지가 없습니다.</c:if>
				<c:if test="${not empty file0 }">
					<img id="Infoimg"
						src="${pageContext.request.contextPath }/productImg?fname=${file3 }&p_num=${p.p_num }">
				</c:if>
			</div>

		</div>
		<div class="reviewBox">
			<div class="review_title">리뷰</div>
			<div class="review_form_area">
				<form method="post" id="rev_form">
					<input type="hidden" name="writer_id" id="writer_id" value="${sessionScope.user_id }">
					<input type="hidden" name="product_num" id="product_num" value="${p.p_num }">
					<select name="review_score" id="rev_box">
						<option value="1" autofocus="autofocus">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
					<textarea id="review_content" id="review_content" name="review_content" rows="7" style="width: -webkit-fill-available;"></textarea>
					<input type="button" value="작성" id="review_btn">
				</form>
			</div>
			<div class="review_list">
				<form id="review_form">
					<table class="review_table">
						<tr id="review_box">
							<th>댓글번호</th>
							<th>별점</th>
							<th>작성자</th>
							<th>작성내용</th>
							<th>작성시간</th>
						</tr>
						<c:forEach var="r" items="${reviews }">
						
							<tr>
								<td>${r.review_num }</td>
								<td>${r.review_score }</td>
								<td>${r.writer_id }</td>
								<td>${r.review_content }</td>
								<td>${r.review_date }
								<c:if test="${r.writer_id == sessionScope.user_id }">
									<input class="rev_del" type="button" onclick="reviewDelete(${r.review_num })" value='삭제'">
								</c:if>
								</td>
							</tr>
						
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>