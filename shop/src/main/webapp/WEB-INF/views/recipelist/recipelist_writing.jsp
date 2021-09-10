<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/recipelist/recipelist_ContentWriting.css?after">
	
	<!-- Jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- JavaScript -->
	<script>
		$(document).ready(function(){
			$("#writing").click(function(){
				$("#recipelistForm").submit();
			});
			$("#reset").click(function(){
				$("#recipelistForm").attr('action','/recipelist/recipelist_board')
				$("#recipelistForm").submit();
			});
		});
	</script>
</head>
<body>
<c:if test="${sessionScope.user_type == 1 || empty sessionScope.user_id}">
		<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    </c:if>
	 <c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>

	<form method="post" id="recipelistForm" action="${pageContext.request.contextPath }/recipelist/recipelist_writing">
		<table>
			<tr>
				<th class="title">
				<input class="title_text_box" type="text" placeholder="제목을 작성하세요." name="rl_title"></th>
			</tr>

			<tr>
				<td class="content">
					<textarea name="rl_content" placeholder="내용을 입력하세요."></textarea>
				</td>
			</tr>

			<tr>
				<td class="btn_td">
					<input class="writing_btn" type="button" id="writing" value="작성완료">
					<input class="reset_btn" type="button" id="reset" value="작성취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
