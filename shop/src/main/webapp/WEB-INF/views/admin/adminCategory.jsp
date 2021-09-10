<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- Jquery -->    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin/adminCategory(css).css?aft">    
	
	<!-- JS -->
	<script src="${pageContext.request.contextPath }/assets/js/admin/admin_category.js?after"></script>
</head>
<body>
	
	 <!-- 관리자 Topbar 영역 -->
   	
	<c:if test="${sessionScope.user_type == 2 }">
		<c:import url="${pageContext.request.contextPath }/inc/adminTopbar.jsp" />
    </c:if>
	
	<div class = "admin_category_container">
		<div class = "admin_category_area">
			<p> 카테고리 추가 - 수정 - 삭제 </p>
			<hr />  <!-- hr태그는 웹 문서 내 구분선 -->
		</div>
		
		<div class = "admin_all_category_area">
			<!-- category1 -->
			<div class = "admin_category1">
				<table id = "category1_print">
					<!-- caption은 테이블의 제목 -->
					<caption class = "admin_category_caption">대분류</caption> 
						<tr>
							<td>
								<input type = "text" id = "category1_name" class = "category1" placeholder = "대분류 추가" />
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="button" id="add_category1_btn" value="추가" />
							</td>
						</tr>
				</table>
			</div>
			<input type="hidden" name="category_type" value="1">
			
			<!-- category2 -->
			<div class = "admin_category2">
				<table id = "category2_print">
					<caption class = "admin_category_caption">중분류</caption>
						<tr>
							<td>
								<input type="text" id="category2_name" name="category_name" class="category2" placeholder="중분류 추가"/>
							</td>
						</tr>
		
						<tr>
							<td>
								<input type="button" id="add_category2_btn" value="추가" />
							</td>
						</tr>
				</table>
			</div>
			<input type="hidden" id="category2_num" name="parent_category_num" value=""/>
			
			<!-- 선택된 카테고리 영역 -->
			<div class = "admin_select_category_area">
				<table>
					<caption class = "admin_category_caption">선택한 카테고리</caption>
						<tr>
							<td>
								<input type = "text" name = "select_category" class = "select_category" id = "selected_category" value = "" />
							</td>
						</tr>
						
						<tr>
							<td>
								<input type = "button" name = "edit_btn" class = "edit_btn" value = "수정하기" id ="edit_btn"/>
								<input type = "button" name = "del_btn" class = "del_btn" id = "del_btn" value = "삭제하기" />
							</td>
						</tr>
				</table>
			</div>			
		</div>		
	</div>

</body>
</html>