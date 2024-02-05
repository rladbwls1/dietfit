<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/member2.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- Bootstrap JS 및 Popper.js -->
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
	.product{
	    width: fit-content;
	}
	.images{
	    width: -webkit-fill-available;
	}
</style>
<script>
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

				if(data.length > 0){
	            for (var i = 0; i < data.length; i++) {
	                var food = data[i];
	                var img = food.pimg.companyid + food.pimg.category + food.pimg.category2 + food.pimg.flavor + "F" + food.pimg.num + food.pimg.ext;
	                var kcal = food.productinfo.kcal;
	                var price = food.price;
	                var productid = food.productinfo.productid;
	                var product = food.product;
	                // 모달 내용에 추가
	                $("#modalBody").append("<li class='col-md-4'><div class='thum' data-productid='"+productid+"' data-img='"+img+"' data-product='"+product+"' data-price='"+price+"'data-type='"+ type +"'data-kcal='"+kcal+"'"+
	                		"style='width:120px; text-align:center;'><img style='width:120px; height: 120px;' src='/resources/p_img/" + img + "'/></div>" +
	                    "<div>" + product + "</div>"+
	                    "<div>칼로리 : " + kcal + "</div></li>");
					}
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
	          
	        	content = `<h2>Product Details</h2>
	            <button onclick="openCart('`+product.companyid+`','`+product.category+`','`+product.category2+`','`+product.price+`')">장바구니</button>
	                <table>
	                	<tr>
	                		<td>
	                		 for (var i = 0; i < product.thumimg.length; i++) {
	         				    <img src="' + product.thumimg[i] + '">
	         				}
	                		</td>
	                	</tr>	
	                    <tr>
	                        <td>상품이름:</td>
	                        <td>`+product.product+`</td>
	                    </tr>
	                    <tr>
	                        <td>가격:</td>
	                        <td>`+product.price+`</td>
	                    </tr>
	                    <tr>
	                        <td>배송정보:</td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td>조회수:</td>
	                        <td>`+product.count+`</td>
	                    </tr>
	                    <tr>
	                        <td>유통기한:</td>
	                        <td>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <form action="/sellerchat/chat" method="post">
	                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                                <input type="hidden" name="product" value="${product.product}">
	                                <input type="hidden" name="companyid" value="${product.companyid}">
	                                <button type="submit">상품 문의</button>
	                            </form>
	                        </td>
	                    </tr>
	                </table>
	            `;
				content += `<div>상세정보</div><hr>`;
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

        $('input[name="fonum"]').each(function() {
            selectedItems.push($(this).val());
        });
    	$.ajax({
			url:'addCartMore1',
			type:'post',
			async:false,
			data:{products:selectedItems.join(",")},
			success:function(a){
				if(confirm('장바구니에 추가 되었습니다.')){
					window.location.reload();
				}else{
					window.location.reload();
				}
			}
		});
    }
</script>
<body>
	<button onclick="window.location.href='/member/eat?kcal=${kc}'">전체 상품 변경</button>
	<c:forEach var="food" items="${mo_re}" varStatus="loop">
	    <h2>아침</h2>
	    <div id="mo_${loop.index}">
	    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    </div>
	    <div id="mo_${loop.index}_m">${food.productinfo.kcal}</div>
	    <div id="mo_${loop.index}_p">${food.price}</div>
	    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
	    </div>
	    <div><button type="button" onclick="modify('${mo_minkcal}', '${mo_maxkcal}', '${food.productinfo.productid}','mo_${loop.index}', 'mo');" id="modify">다른 식품 추천</button></div>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	    <div id="result"></div>
	</c:forEach>
	<hr>
	<c:forEach var="food" items="${br_re}" varStatus="loop">
	    <h2>점심</h2>
	    <div id="br_${loop.index}">
	    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    </div>
	    <div id="br_${loop.index}_m">${food.productinfo.kcal}</div>
	    <div id="mo_${loop.index}_p">${food.price}</div>
	    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
	    </div>
	    <div><button type="button" onclick="modify('${br_minkcal}', '${br_maxkcal}', '${food.productinfo.productid}','br_${loop.index}', 'br');" id="modify">다른 식품 추천</button></div>
	    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	</c:forEach>
	<hr>
	<c:forEach var="food" items="${de_re}" varStatus="loop">
	    <h2>저녁</h2>
	    <div id="de_${loop.index}">
	    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    </div>
	    <div id="de_${loop.index}_m">${food.productinfo.kcal}</div>
	    <div id="mo_${loop.index}_p">${food.price}</div>
	    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
	    </div>
	    <div><button type="button" onclick="modify('${de_minkcal}', '${de_maxkcal}', '${food.productinfo.productid}','de_${loop.index}', 'de');" id="modify">다른 식품 추천</button></div>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	</c:forEach>
	<hr>
	<c:forEach var="food" items="${se_re}" varStatus="loop">
	    <h2>간식</h2>
	    <div id="se_${loop.index}">
	    <div class="product" onclick="management('${food.pimg.companyid}','${food.pimg.category}','${food.pimg.category2}','${food.pimg.flavor}');">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    </div>
	    <div id="se_${loop.index}_m">${food.productinfo.kcal}</div>
	    <div id="mo_${loop.index}_p">${food.price}</div>
	    <input type="hidden" name="fonum" value="${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}">
	    </div>
	    <div><button type="button" onclick="modify('${se_minkcal}', '${se_maxkcal}', '${food.productinfo.productid}','se_${loop.index}', 'se');" id="modify">다른 식품 추천</button></div>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	</c:forEach>
	<hr>
	<div style="display: flex;">
	Total Kcal: 
	<div id="totalKcal">
	${totalKcal}
	</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">다른 제품 추천</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
             	<ul id="modalBody" class="list-unstyled row">
             	</ul>	
            </div>
        </div>
    </div>
</div>
<button onclick="cartSelectedItems2();">전체 상품 장바구니 담기</button>
<script>
/*
function management(companyid, category, category2, flavor){
	var width = 850;
    var height = 650;
    var screenWidth = window.innerWidth;
    var screenHeight = window.innerHeight;

    var left = (screenWidth - width) / 2;
    var top = (screenHeight - height) / 2;

    var popOption = "width=" + width + "px, height=" + height + "px, top=" + top + "px, left=" + left + "px, scrollbars=yes";
    var openUrl = '/member/detail/'+companyid+'/'+category+'/'+category2+'/'+flavor;
    window.open(openUrl, 'pop', popOption);
}
*/
</script>
</body>
</html>