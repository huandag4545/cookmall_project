$(document).ready(function(){
		
		var user_id = document.getElementById("user_id").value ;
    	
    	// 상품명으로 검색
    	$("#search_btn").click(function(){
    		var searchKeyword = $("#searchKeyword").val() ;
    		
    		if (searchKeyword == "") {
    			alert("검색할 상품을 입력하세요");
    			return false;
    		}
    		
    		$.post("/product/searchKeyword",{
    			user_id : user_id,
    			searchKeyword : searchKeyword
    		})
    		.done(function(data){
    			var search_product_list = eval("("+ data +")");
    			
    			// 상품이 존재하지 않을 때
				if (search_product_list[0].p_num == 0) {
					alert("존재하지 않는 상품입니다.");
					$(".tr").empty();
					$(".first_tr").show();
					$(".hr").empty();
					return false;
				}
					// 상품이 존재할 때
					$(".first_tr").hide();
					$(".tr").empty();
					$(".hr").empty();
					
	    			for(i=0; i<search_product_list.length; i++){
	    				var str = "<tr class='tr'>	<th>상품번호</th>	<td>"; 
	    				str += "<input type='submit' value='" + search_product_list[i].p_num +"'/>";
	    				str += "<input type='hidden' name='p_num' value='" + search_product_list[i].p_num +"'/>";
	    				str += "</td> </tr>";
	    				str += "<tr class='tr'>	<th>상품명</th>	<td>" + search_product_list[i].p_name +"</td> </tr>";
	    				str += "<tr class='tr'>	<th>상품가격</th>	<td>" + search_product_list[i].p_price +"</td> </tr>";
	    				str += "<tr class='tr'>	<th>상품정보</th>	<td>" + search_product_list[i].p_info +"</td> </tr>";
	    				str += "<tr class='hr'> <td colspan='2'> <hr/> </td> </tr>";

	    				
	    				$("#table").append(str);
	    			}
    		});
    	});
    });