<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/navbar(css).css?after">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		
		$.post("/admin/getCategory",{
		parent_category_num : 0,
		category_type : 1
		}).done(function(data){
			var category_data = eval("("+data+")");
			for(i = 0; i<category_data.length;i++){
				var str = "<li class='cate_li'><a href='${pageContext.request.contextPath }/product/cate1_prodlist?ca1_num="+category_data[i].ca_num+"'>"+category_data[i].ca_name+"</a></li>";
				$(".drop_cate").append(str);
			}
		});
	});

</script>
</head>
<body>
<!-- nav 영역 -->	
	<div class="nav_area">	
	<div class="dropmenu">
			<ul class="dropcategory">
				<li><a href="#" id="current">카테고리</a>
					<ul class="drop_cate">
					</ul></li>
			</ul>
		</div>
		<div id="ul_box">
			<ul class="nav_ul">
				<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/recipelist/recipelist_board">레시피</a></li>
				<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/notice/notice_board">공지사항</a></li>
				<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/qna/qna_list">고객센터</a></li>
				<li class="nav_li"><a class="nav_li_link">자유게시판</a></li>
			</ul>
		</div>
	</div>
	<!-- nav 영역 끝 -->		



</body>
</html>