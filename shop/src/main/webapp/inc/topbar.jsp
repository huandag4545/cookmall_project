<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- CSS 기입? -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar(css).css?aft">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/topbar2(css).css?of">
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/inc/navbar(css).css?after">

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
	<div class = "topbar_container">
		<div class = "topbar_area">

			<c:if test = "${empty sessionScope.user_id }">
	
				<ul>
					<li><a class="list" href="${pageContext.request.contextPath }/user/login"> 로그인 </a></li>
	                <li><a class="list" href="${pageContext.request.contextPath }/user/signup_agree"> 회원가입 </a></li>
	            
				</ul>
			</c:if>
			
			<c:if test="${not empty sessionScope.user_id }">
        		<ul>
	        		<c:if test="${sessionScope.user_type == 1 }">
		                <li><a class="list" href="${pageContext.request.contextPath }/user/user_profile"> ${sessionScope.user_nickname}님 </a></li>
		                <li><a class="list"  href="${pageContext.request.contextPath }/user/logout" onClick="alert('로그아웃 되었습니다')"> 로그아웃 </a></li>               
		                <!--  -->
	        		</c:if>
	        		<c:if test="${sessionScope.user_type == 2 }">
		                <li><a class="list" href="/admin/adminMain?user_id=${sessionScope.user_id}"> ${sessionScope.user_nickname}님 </a></li>
		                <li><a class="list"  href="${pageContext.request.contextPath }/user/logout" onClick="alert('로그아웃 되었습니다')"> 로그아웃 </a></li>
	        		</c:if>
                </ul>
        	</c:if>
		</div>
	</div>
	
	<div class="logo_search_area">
		<div class="top_menu_total_container">    
		 <!-- 로고 시작 -->
	        <div class="top_menu_logo_area">
	            <a href="${pageContext.request.contextPath }/index" class="top_menu_logo_a">
	                <img src="${pageContext.request.contextPath }/assets/img/logo1.jpg" alt="logo" class="top_menu_logo_img">
	            </a>
	        </div>
		</div>
		<div class="top_menu_total_container2">
	            <!-- 검색창 -->
	        <form action="${pageContext.request.contextPath }/product/nameList">
	           <div class="top_menu_search_area">          
	               <input type="text" class="top_menu_search_input" id="top_search_input" name="p_name" placeholder="검색어를 입력하세요">
	               <input type="submit" class="top_menu_search_input" id="top_search_icon" value="" />
	           </div>
	           <input type="hidden" id="searchKeyword_id" name="user_id" value="${sessionScope.user_id}"/>
	      	</form>
	     </div>
	</div>
	
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
			<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/product/prodlist">상품목록</a></li>
				<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/recipelist/recipelist_board">레시피</a></li>
				<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/notice/notice_board">공지사항</a></li>
				<li class="nav_li"><a class="nav_li_link" href="${pageContext.request.contextPath }/qna/mav_qna_list?qna_type=1">문의사항</a></li>
				
			</ul>
		</div>
	</div>
	<!-- nav 영역 끝 -->	


</body>
</html>