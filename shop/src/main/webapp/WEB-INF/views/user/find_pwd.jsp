<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/user/find_pw(css).css?after" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(document).ready(function(){
		$('#find_pw_btn').click(function(){
			/* var email=prompt("이메일은 입력"); */
			var email=$("#user_email").val();
			var data={user_email: email }
			
			if(email==""){
				alert("찾는 사람의 이메일을 입력하세요")
				return false;
			}
			
			$.ajax({
				type : "post",
				url : "/user/emailCheck",
				data: data,
				
				success : function(name_result){
					if(name_result == "fail" ){
						alert("임시 비밀번호를"+email+"로 전송합니다")
					}else{
						alert("등록되지 않은 이메일입니다.")
					}
				}
				
			})
		});
	});
	
	
	
	
		/* $(document).ready(function(){
			$("#find_pw_btn").click(function(){
				alert("이거까지는 돼요")
			
				)};
			}); */
	
	</script>

</head>
<body>

	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    <!-- top 영역 끝 -->

    
	<div class="container">
		<div class="find_pw_container">
			<div class="find_pw_area">
				<p> 비밀번호 찾기 </p>
			</div>
			
			<div class="find_pw_input_area">
				<input type="text" name="user_email" class="user_email" id="user_email" placeholder="이메일을 입력해주세요" value=""/>
			</div>
			
			<div class="find_pw_btn_area">
				<input type="button" name="find_pw_btn" class="find_pw_btn" id="find_pw_btn" value="임시비밀번호 발급" />
			</div>
		</div>
	</div>


	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    <!-- top 영역 끝 -->

</body>
</html>