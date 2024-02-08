function modify(minkcal, maxkcal, mo, type, catogory){
	var category = 1;
	if(catogory == "se"){
		category = 0;
	}
    $.ajax({
        url: "/member/change",
        data: {mo: mo,
        	   minkcal: minkcal,
        	   maxkcal: maxkcal,
        	   type: category},
        success: function (data) {
            // 모달 내용 초기화
            $("#modalBody").empty();
			var content = "<ul class='list-unstyled row'>";
			if(data.length > 0){
            for (var i = 0; i < data.length; i++) {
                var food = data[i];
                var img = food.pimg.companyid + food.pimg.category + food.pimg.category2 + food.pimg.flavor + "F" + food.pimg.num + food.pimg.ext;
                var kcal = food.productinfo.kcal;
                var price = food.price;
                var productid = food.productinfo.productid;
                var product = food.product;
                // 모달 내용에 추가
                content += "<li class='col-md-3'><div class='thum' data-productid='"+productid+"' data-img='"+img+"' data-product='"+product+"' data-price='"+price+"'data-type='"+ type +"'data-kcal='"+kcal+"'"+
                		"style='width:120px; text-align:center;'><img style='width:120px; height: 120px;' src='/resources/p_img/" + img + "'/></div>" +
                    "<div>" + product + "</div>"+
                    "<div>칼로리 : " + kcal + "</div></li>";
				}
            content += "</ul>";
            $("#modalBody").append(content);
			}else{
					$("#modalBody").append("해당 제품은 대체 상품이 없습니다!");
            }
            // 모달 열기
            $("#myModal").modal('show');
        }
    });
}

$(document).on('click', '.thum', function() {
	var productid = $(this).data('productid');
	var img = $(this).data('img');
	var product = $(this).data('product');
	var kcal = $(this).data('kcal');
	var price = $(this).data('price');
	var type = $(this).data('type');
	var part1 = productid.substring(0, 2);
	var part2 = productid.substring(2, 4);
	var part3 = productid.substring(4, 6);
	var part4 = productid.substring(6, 8);
	$("#myModal").modal('hide');
	console.log(kcal);
	$("#"+type).html("");
	$("#"+type).html("<div  class='" + product + "' id='" + productid + "' onclick=\"management('" + part1 + "', '" + part2 + "', '" + part3 + "', '" + part4 + "');\">" +
            "<img style='width:50px;' src='/resources/p_img/" + img + "'/></div>" +
            "<div>" + product + "</div>" +
            "<div id='" + type + "_m'>" + kcal + "</div>" +
            "<div id='" + type + "_p'>" + price + "</div>" +
            "<input type='hidden' id='fonum' value='" + productid + "'/>"+
            "<input type='hidden' id='mo' value='" + productid + "'/>");

    var totalKcal = 0;
    for (var i = 0; i < 2; i++) {
        ['mo', 'br', 'de', 'se'].forEach(function(item) {
            $("#" + item + "_"+i + "_m").each(function() {
            	totalKcal += parseInt($(this).text()) || 0;
                console.log(item+i+totalKcal);
            });
        });
    }
  
    // var totalKcal = parseInt($("#mo_0_m").text()) + parseInt($("#mo_1_m").text()) + parseInt($("#br_0_m").text()) + parseInt($("#br_1_m").text()) + parseInt($("#de_0_m").text()) + parseInt($("#de_1_m").text()) + parseInt($("#se_0_m").text()) + parseInt($("#se_1_m").text());
    $("#totalKcal").text(totalKcal);
});

function management(companyid, category, category2, flavor){
	$.ajax({
        url: "/member/detail",
        data: {companyid: companyid,
        	category: category,
        	category2: category2,
        	flavor: flavor},
        success: function (product) {
          
        	content = `<div id="top_Con"><div id="top_Div">`;
        	for (var i = 0; i < product.thumimg.length; i++) {
			    content += '<img class="image" src="' + product.thumimg[i] + '">';
			}
        	content +=`</div>
            <button onclick="openCart('`+product.companyid+`','`+product.category+`','`+product.category2+`','`+product.price+`')">장바구니</button>
                <table>
                	<tr>
                		<td>
                		
                		</td>
                	</tr>	
                    <tr>
                        <td>`+product.product+`</td>
                    </tr>
                    <tr>
                        <td>`+product.price+`</td>
                    </tr>
                    <tr>
                        <td>`;
                        if (product.delivery == 0) {
                        content += '일반배송, 정기배송';
                    } else if (product.delivery == 1) {
                        content += '일반배송';
                    } else {
                        content += '기타 배송 옵션';
                    }
				    content += `
					    </td>
                    </tr>
                </table>
                </div>
            `;
			content += `<div>제품정보</div><hr>`;
			for (var i = 0; i < product.img.length; i++) {
			    content += '<img class="images" src="' + product.img[i] + '">';
			}
              $("#modalBody").empty();
            $("#modalBody").append(content);
            $("#myModal").modal('show');
        }
    });
}

function cartSelectedItems2(){
	var selectedItems = [];
    var chk = $('#chk').is(':checked') ? 1 : 0;

    $('input[name="fonum"]').each(function() {
        selectedItems.push($(this).val());
    });
	$.ajax({
		url:'addCartMore1',
		type:'post',
		async:false,
		data:{products:selectedItems.join(","), delivery:chk},
		success:function(a){
			if(confirm('장바구니에 추가 되었습니다.')){
				window.location.reload();
			}else{
				window.location.reload();
			}
		}
	});
}