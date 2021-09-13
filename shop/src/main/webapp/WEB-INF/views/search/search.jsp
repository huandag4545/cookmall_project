<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/search/search(css).css?after">
</head>
<body>

	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->


	<div class="page_total_area">
		<div class="page_title">검색결과</div>
		<div class="list_total_area">
			<c:if test="${empty prodlist }">
				<div class="empty_search">찾으시는 품목이 존재하지 않습니다</div>
			</c:if>
			<c:if test="${not empty prodlist }">
				<table class="search_table">
					<tr id="search_th_tr">
						<th class="prod_num_area">제품번호</th>
						<th class="prod_img_area">제품이미지</th>
						<th class="prod_name_area">제품명</th>
						<th class="prod_price_area">제품가격</th>
					</tr>
					<c:forEach items="${prodlist }" var="p" varStatus="status">
						<tr id="list_tr">
							<td class="prod_num"><a class="list_a" href="${pageContext.request.contextPath }/product/productdetail?p_num=${p.p_num}">${p.p_num }</a></td>
							<td class="prod_img"><a class="list_a" href="${pageContext.request.contextPath }/product/productdetail?p_num=${p.p_num}">
							<img class="imgs" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&p_num=${p.p_num}"></a></td>
							<td class="prod_name"><a class="list_a" href="${pageContext.request.contextPath }/product/productdetail?p_num=${p.p_num}">${p.p_name }&nbsp;&nbsp;<span id="prod_info">&lt;원산지 : ${p.p_info } &gt;</span></a></td>
							<td class="prod_price"><a class="list_a" href="${pageContext.request.contextPath }/product/productdetail?p_num=${p.p_num}">${p.p_price }원</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>


</body>
</html>