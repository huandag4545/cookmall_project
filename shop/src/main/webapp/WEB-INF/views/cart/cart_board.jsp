<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

	<!-- top 영역 시작 -->
	<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id }">
		<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    </c:if>
    <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
    <!-- top 영역 끝 -->



<div class="cart_all">
		<table>    <!-- 상단 창 생성 -->
			<tr>
				<th class="crt_num"><input type="checkbox" class="checkbox_num" value=""/>번호</th>
				<th class="crt_info">제목</th>
				<th class="crt_price">작성일</th>
				<th class="crt_price">수량</th>
				<th class="crt_totalprice">합계 금액</th>
			</tr>
			
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">담겨진 상품이 없습니다.</td>
				</tr>
			</c:if>
				
			<c:if test="${not empty list}">
				<c:forEach var="p" items="${list }" varStatus="status">
					<tr>
						<td> <input type="checkbox" class="checkbox_p_num" value=""/> ${status.count} </td>
						<td>
							<img src="product_img">
							<a class="link" href="${pageContext.request.contextPath }/notice/product_detail?product_num=${p.product_num}">${p.product_name}</a>
						</td>
						<td> ${p.product_price} </td>
						<td> ${p.product_quantity} </td>  <!-- product 수량을 사용하는지 확인 필요 + 여기에 수량 조절할 수 있도록 설정-->
					</tr>
				</c:forEach>
			</c:if>



			<c:if test="${sessionScope.user_type == 1 }">
				<tr>
					<td class="check_del_btn"><input type="button" value="선택항목 삭제" class="btn_del_cart" onclick="deleteCart();">  <!-- deleteCart()도 준비-->
					<td class="td_btn" colspan="3"> <!--이전 다음 버튼 생성 페이지도 만들기 (참고:https://freehoon.tistory.com/112)-->
						<!--<input type="button" class="before_btn" onclick=##page -1 value="이전">-->
						<!--<now page> -->
						<!--<input type="button" class="before_btn" onclick=##page +1 value="다음">-->
					</td>
					<td> 상품 총 금액: 해당 아이디의 result가 1인 상품들의 가격 합치기
				</tr>
				</c:if>
		</table>
	</div>
	
<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>