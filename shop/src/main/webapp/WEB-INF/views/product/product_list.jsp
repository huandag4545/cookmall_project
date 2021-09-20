<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/product/product_list(css).css">

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



	<!-- 메인영역 -->
	<main id ="main">
		<div class="list_container">
			<div class="page_title">
				<p id="title"><a class="list_a" href="${pageContext.request.contextPath }/product/prodlist">상품리스트 페이지</a></p>
			</div>
			<div class="price_search_box">
				<form action="${pageContext.request.contextPath }/product/selectProductByPrice" method="post">
					가격으로 검색 : <input type="text" name="min"> ~ <input
						type="text" name="max"> <input type="submit" value="검색">
				</form>
			</div>
			<div class="list_box">
				<c:if test="${empty allprodlist }">
					<div class="empty">상품이 없습니다.</div>
				</c:if>
				<c:if test="${not empty allprodlist }">
					<c:forEach items="${allprodlist }" var="p" varStatus="status">
						<div class="prod_box">
							<a class="list_a" href="${pageContext.request.contextPath }/product/productdetail?p_num=${p.p_num}">
							<img class="prod_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&p_num=${p.p_num}">
							</a>

							<p id="prod_name"><a href="${pageContext.request.contextPath }/product/productdetail?p_num=${p.p_num}">${p.p_name }</a></p>

							<p id="prod_price">${p.p_price }원</p>
							<p id="prod_info">${p.p_info }</p>
						</div>
					
					</c:forEach>
				</c:if>
			</div>
		</div>
	</main>

	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->


</body>
</html>