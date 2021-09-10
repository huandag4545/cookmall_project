<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/product/product_edit(css).css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$.post("/admin/getCategory",{
		category_type : 1, 
		parent_category_num : 0 // 부모아이이디값
	}).done(function(data){
		var c = eval("("+data+")");
		for(i=0;i<c.length;i++){
			$("#s1").append("<option value='"+c[i].ca_num+"'>"+c[i].ca_name+"</option>");
			}	
		});
	
	$("#s1").click(function(){
		var x = 0;
		x = this.options[this.options.selectedIndex].value
		$.post("/admin/getCategory",{
			category_type : 2,
			parent_category_num : x
		}).done(function(data){
			var c = eval("("+data+")");
			$("#s2").empty();
			for(i = 0;i<c.length;i++){
				$("#s2").append("<option value='"+c[i].ca_num+"'>"+c[i].ca_name+"</option>");
			}
		});
	});
	
	$("#cansel").click(function(){
		alert("입력이 취소되었습니다.")
		window.history.back();
	})
	
});
</script>

</head>
<body>
	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
	<!-- top 영역 끝 -->

<div class="content_area">
	<div class="edit_title">제품수정</div>
	<div class="edit_form_area">
		<form action="${pageContext.request.contextPath}/product/productedit " method="post" enctype="multipart/form-data">
		<input type="hidden" name="p_num" value="${p.p_num}">
		<div class="edit_form_box" id="name_box">제품명&nbsp;:&nbsp;<input type="text" name="p_name" value="${p.p_name}" class="input_box"></div>
		<div class="edit_form_box" id="price_box">가 격&nbsp;:&nbsp;<input type="text" name="p_price" value="${p.p_price}" class="input_box"></div>
		<div class="edit_form_box" id="info_box">원산지&nbsp;:&nbsp;<input type="text" name="p_info" value="${p.p_info} " class="input_box"></div>
		<div class="edit_form_box" id="select_box">분 류&nbsp;:&nbsp;<select id="s1" name="ca1_num" class="s_box"></select>&nbsp;<select id="s2" name="ca2_num" class="s_box"></select></div>
		<div class="edit_form_box" id="img_box1">이미지1&nbsp;:&nbsp;<input type="file" class="file" name="p_img1"></div>
		<div class="edit_form_box" id="img_box2">이미지2&nbsp;:&nbsp;<input type="file" class="file" name="p_img2"></div>
		<div class="edit_form_box" id="img_box3">이미지3&nbsp;:&nbsp;<input type="file" class="file" name="p_img3"></div>
		<div class="edit_form_box" id="img_infoimg">상세페이지&nbsp;:&nbsp;<input type="file" class="file" name="p_infoimg"></div>
		<div class="edit_button_box"><input type="submit" value="수정하기" class="btn"><input type="button" value="취소" id="cansel" class="btn"></div>
		</form>
	</div>
</div>

	<!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>