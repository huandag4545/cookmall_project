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
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->


	<div class="page_total_area">
		<div class="page_title"></div>
		<div class="list_total_area">
			<c:if test="${empty prodlist }">
				<div class="empty_search">찾으시는 품목이 존재하지 않습니다</div>
			</c:if>
			<c:if test="${not empty prodlist }">
				<table class="search_table">
					<tr id="search_th_tr">
						<th class="prod_num_area"></th>
						<th class="prod_img_area"></th>
						<th class="prod_name_area"></th>
						<th class="prod_price_area"></th>
					</tr>
					<c:forEach items="${prodlist }" var="p" varStatus="status">
						<tr id="list_tr">
							<td class="prod_num">${p.p_num }</td>
							<td class="prod_img">
							<img class="prod_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&p_num=${p.p_num}"></td>
							<td class="prod_name">${p.p_name }<span id="prod_info">p_info</span></td>
							<td class="prod_price">${p.p_price }</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>


</body>
</html>