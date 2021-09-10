<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div>삭제 완료되었습니다.</div>
	<a href="${pageContext.request.contextPath }/cart/cart_List">완료</a></div>
	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>