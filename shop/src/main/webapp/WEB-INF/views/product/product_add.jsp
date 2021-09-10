<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/product/product_add(css).css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/product/product_add.js?after"></script>
</head>
<body>


	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->
	

	<div class="container">
		<div class="product_add_container">
			<p class="prod_add"> 상품등록 </p>
		</div>
		
		<form method="post" enctype="multipart/form-data" class="product_add_form" action="${pageContext.request.contextPath}/product/add">
			<div class="product_name_container">
				<label for="product_name"> * 상품명 </label>
				<div class="prod_name_area">
					<input type="text" name="p_name" id="prod_name" class="prod_name" required />
				</div>
			</div>
			
			<div class="product_price_container">
				<label for="product_price"> * 가격 </label>
				<div class="prod_price_area">
					<input type="text" name="p_price" id="prod_price" class="prod_pice" pattern="[0-9]+" required />
				</div>
			</div>
			
			<div class="product_img_container">
				<label for="product_img"> * 상품이미지</label>
				<div class="product_img_area">
					<div class="img"> 
						<span>대표이미지</span> 
						<div>
							<input type="file" class="file" name="p_img1" id="file" required/>
						</div>
					</div>
					
					<div class="img"> 
						<span> 이미지2 </span> 
						<div>
							<input type="file" class="file2" name="p_img2" id="file2" />
						</div>
					</div>
					
					<div class="img"> 
						<span> 이미지3 </span> 
						<div>
							<input type="file" class="file3" name="p_img3" id="file3" />
						</div>
					</div>
					<div class="img"> 
						<span> 상세페이지 </span> 
						<div>
							<input type="file" class="file4" name="p_infoimg" id="file3" />
						</div>
					</div>
				
					
					
				</div>
			</div>		
			
			<div class="product_info_container">
				<label for="product_info"> * 원산지 </label>
				<div class="prod_info_area">
					<textarea class="prod_info" id="prod_info" name="p_info" required></textarea>
				</div>
			</div>
			
			<div class="product_cate_container">
				<label for="product_cate"> 카테고리 </label>
				<div>
					<select id="s1" class="required" name="ca1_num" required><option>1차분류</option></select>
					<select id="s2" class="required" name="ca2_num" required><option>2차분류</option></select>					
				</div>
			</div>
			
			<div class="product_add_btn_container">
				<input type="submit" class="addbtn" id="add" value="등록하기" />
				<input type="button" class="cancelbtn" onClick="history.back();" value="등록취소" />
			</div>
			<input type="hidden" name="result" value="1">
		</form>
	</div>

	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>