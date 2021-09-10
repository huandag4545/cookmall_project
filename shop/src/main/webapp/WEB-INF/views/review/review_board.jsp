<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- CSS -->
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/notice/notice_Board.css?after">
	 --%>
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<div class="all">
		<table>    <!-- 상단 창 생성 -->
			<tr>
				<th class="th_user_id">아이디</th>
				<th class="th_content">리뷰</th>
				<th class="th_date">작성일</th>
			</tr>
			
					<tr>
						<td> ${l.writer_id} </td>
						<td> ${l.review_content} </td>
						<td> ${l.review_date } </td>
					</tr>


				<tr>
					<td class="td_btn" colspan="3">
						<input class="delete_btn" type="button" id="Delete" onclick="location.href = '${pageContext.request.contextPath }/review/review_delete'" value="리뷰 삭제">
					</td>
				</tr>
		</table>
	</div>
</body>
</html>