$(document).ready(function() {

	var prices = document.getElementsByClassName("p_price")
	var a
	for (i = 0; i < prices.length; i++){
	    a = prices[i].innerText.replace("원", "")
	    console.log(a)
	    a = Number(a).toLocaleString()
	    a = a + "원"    
	    prices[i].innerText = a
	    console.log(a)
	}
	
});

    $('#checkForm #allCheck').on('click',function(){
		if($('#allCheck').prop("checked")){
			$("input[type=checkbox])").prop("checked",true);
		} else{
			$("input[type=checkbox]").prop("checked",false);
		}	
});
    


