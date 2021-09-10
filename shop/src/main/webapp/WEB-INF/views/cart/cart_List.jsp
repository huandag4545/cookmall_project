<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
    <script src="${pageContext.request.contextPath }/assets/js/product_priceReplace.js"></script>
	<script>
 
 $(document).ready(function(){
	    //최상단 체크박스 
	    // #All_Check -> .All_Check로 수정
	    
	    $(".allCheck").click(function(){
	        if($(".allCheck").prop("checked")){//클릭
	            $("input[type=checkbox]").prop("checked",true);
	        }else{//클릭 해제
	            $("input[type=checkbox]").prop("checked",false);
	        }
	    });
	});
 
 $(document).ready(function() {
	 	 const query = 'input[class="checkDt"]:checked';
	 	 var user_id=query.user_id;
	 	 
	 	 
	 	$("#buy_byn0").click(function() {
	    	 var c = $("input[class=checkDt]:checked").length;
	    	 console.log(c)
	    	 if(c>0){
	    		location.href="/order/order_form?user_id=${sessionScope.user_id}";
			}else{
				alert("체크된 항목이 없습니다");
			}
	    });
	    
	    $("#buy_byn0").click(function() {
	    	 var c = $("input[class=checkDt]:checked").length;
	    	 console.log(c)
	    	 arr=document.getElementsByName("check[]");
	    	 //check 의 이름 값 받아오기
	    	 
	    	 if(c==0){
				alert("체크된 항목이 없습니다.");
			}else{
				for(var i=0;i<arr.length;i++){ //전체 행 반복
					if(arr[i].checked==true){ //체크 된 값들 중에서 
						
						}
					}
	    	 }
			});	
	});
	</script>


    <title>CartList</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/cart/cartList.css?af">
</head>
<body>

	<!-- top 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/topbar.jsp" />
    <!-- top 영역 끝 -->
    
    
    <!-- nav 영역 설정 -->
		<nav class="side_nav">
			<div class="title">마이페이지</div>
			<ul id="nav_ul">
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/user/user_profile">내정보관리</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/order/orderList">주문내역</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/cart/cartList?user_id=${sessionScope.user_id}">장바구니</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }/qna/mav_qna_list?qna_type=1">문의내역</a></li>
				<li class="nav_li"><a class="my_link"
					href="${pageContext.request.contextPath }">회원탈퇴</a></li>
			</ul>
		</nav>
    
    <div class="cart_product_font_area">
        <p class="cart_font"> 
            장바구니
        </p>
        <hr class="hr1"/>
    </div>

    <!-- 상품 리스트 컨테이너-->
    <div class="product_list_container">

        <!--상품이 없을 때 컨테이너-->
    <!--<div class="empty_cart_product_container">
            <img class="empty_cart_img" src="images/cart1.png" />
        </div>
        <div class="empty_font">
            <p> 장바구니에 담긴 상품이 없습니다. </p>
        </div>-->

		
		<div id="checkForm">
        <div class="checkbutn">
        <input type="checkbox" class="allCheck">
     	<form action="${pageContext.request.contextPath }/order/orderadd" method="post" id="f2">
		<input type="hidden" name="user_id" value="${sessionScope.user_id}">
		<input type="hidden" name="o_quantity" value="${quantity} ">
		<input type="hidden" name="p_num" value="${p_num} ">
		<input type="hidden" name="o_postcode" value="${postcode} ">
		<input type="hidden" name="o_addr1" value="${addr1} ">
		<input type="hidden" name="o_addr2" value="${addr2} ">
		<input type="hidden" name="p_num" value="${p_num} ">
		<input type="hidden" name="user_id" value="${user_id} ">
		<input type="hidden" name="result" value=0>
		
        <input type="button" value="구매하기" id="buy_byn0" class="buy_btn1"/>
        <input type="button" value="선택삭제" id="delBuy_byn0" class="delbuy_btn1"/>   
        </form>     
        </div>

        <!--상품이 있을 때 컨테이너 -->
        <c:forEach var="i" items="${cartList }" varStatus="status">
        <!-- 상품 이미지 영역-->
        <div class="cart_product_container">
            <input type="checkbox" name="check[]" class="checkDt">
            
            <hr class="hr3"/>
            <div class="product_img_area">
               <a class="prod_detail_link" href="${pageContext.request.contextPath }/product/productdetail?p_num=${i.p_num}" >
                   <img class="product_img" src="${pageContext.request.contextPath }/productImg?fname=${fileList[status.index]}&p_num=${i.p_num}" />
               </a>
            </div>
        
            <!-- 상품 정보 영역-->
            <div class="product_info_area">
                <!-- 상품 이름 영역 -->
                <div class="cart_product_name_container">
                    <div class="cart_product_name">
                        <a class="cart_product_list" href="${pageContext.request.contextPath }/product/productdetail?user_id=${sessionScope.user_id }&p_num=${i.p_num}">
                           ${i.p_name }  
                        </a>
                    </div>
                </div>

                <!--상품 가격 영역 -->
                <div class="cart_product_price_container">
                    <div class="cart_product_price">
                        <a class="cart_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&p_num=${i.p_num}">
                            <span class="product_price">${i.p_price } 원</span>
                        </a>
                    </div>
                </div>

                <!--상품 정보 영역 -->
                <div class="cart_product_info_container">
                    <div class="cart_product_info">
                        <a class="cart_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&p_num=${i.p_num}">
                            ${i.p_info }
                        </a>
                    </div>
                </div>

                <!--상품 카테고리 영역 -->
                <div class="cart_product_category_container">
                    <div class="cart_product_category">
                        <a class="cart_product_list" href="#">
                            <div class="prod_category"> ${ c1[status.index].ca_name } > ${ c2[status.index].ca_name } > ${ c3[status.index].ca_name } </div>
                        </a>
                    </div>
                </div>
            </div>

            <!--상품 찜 이미지 영역-->
            <div class="cart_product_img_container">
                <div class="cart_product_img_area">
                    <!--찜 이미지 영역 -->
                    <div class="cart_product_img">
                        <a class="cart_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&p_num=${i.p_num}">
                            <img src="${pageContext.request.contextPath }/assets/img/wish_1.png" />
                        </a>
                    </div>

                    <!--찜 갯수 영역-->
                    <div class="cart_product_count">
                        <a class="cart_product_list" href="${pageContext.request.contextPath }/product/productDetail?user_id=${sessionScope.user_id }&p_num=${i.p_num}">
                            <p class="cart_count"> ${cartCountList[status.index]} </p>
                        </a>
                    </div>
                </div>
                
                <!--상품 댓글 영역 -->
                <div class="cart_product_reply_container">
                    <div class="cart_product_reply_area">
                        <!--댓글 이미지 영역-->
                        <div class="cart_product_reply_img">
                            <a class="cart_product_list" href="#">
                                <img src="${pageContext.request.contextPath }/assets/img/bb.png" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="hr2"/>
       
        </c:forEach> 
       
    </div>
    </div>
  
    
    <!-- footer 영역 시작 -->
	<c:import url="${pageContext.request.contextPath }/inc/footer.jsp" />
    <!-- footer 영역 끝 -->

</body>
</html>