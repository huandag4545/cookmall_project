/* wish_icon ==> cart_in
	class=
*/


$(document).ready(function() {
    var user_id = $("#login_user_id").val();

    console.log(user_id)
    $(".cart_in").click(function() {
	 	if (user_id === null || user_id === "") {
            alert("로그인을 하세요")
            return
        }
        
        var p_num = $("#p_num").val();
       
            $.post("/cart/cartInsert", {
                    p_num: p_num,
                    user_id: user_id

                })
                .done(function(data) {
                    var result_data = eval("(" + data + ")")

                    if (result_data.result == 1) {
                        alert("찜목록에 추가되었습니다.")
                    }

                });
        });
	$(".cart_out").click(function() {
          
		  $.post("/cart/cartDel", {
                    p_num: p_num,
                    user_id: user_id
                })
                .done(function(data) {
                    var result_data = eval("(" + data + ")")

                    if (result_data.result == 0) {
                        alert("찜목록에서 삭제되었습니다.")
                    }
                });
        });
});
