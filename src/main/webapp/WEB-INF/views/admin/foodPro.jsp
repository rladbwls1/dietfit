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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- Bootstrap JS 및 Popper.js -->
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
	function modi(minkcal, maxkcal, mo, type){
		 $("#modalBody").empty();
		 if(type == "br"){
			 <c:forEach var="fo" items="${br_rest}">
	        console.log("${fo}");
	        var divContent = $("<div class='tu'><b>"); // <div> 열기
	        
	        <c:forEach var="food" items="${fo}">
	            console.log("${food}");
	            var product = "${food.product}";
	            var img = "${food.pimg.companyid}" + "${food.pimg.category}" + "${food.pimg.category2}" + "${food.pimg.flavor}" + "F" + "${food.pimg.num}" + "${food.pimg.ext}";
	            var kcal = "${food.productinfo.kcal}";
	            var productid = "${food.productinfo.productid}";
	            // 모달 내용에 추가
	            var divContent += $("<li class='col-md-4'><div class='thum' data-productid='" + productid + "' data-img='" + img + "' data-product='" + product + "'data-type='" + type + "'data-kcal='" + kcal + "'" +
	                "style='width:120px; text-align:center;'><img style='width:120px; height: 120px;' src='/resources/p_img/" + img + "'/></div>" +
	                "<div>" + product + "</div>" +
	                "<div>칼로리 : " + kcal + "</div></li>");
	        </c:forEach>
	        var divContent = $("</div>"); // </div> 닫기
	        $("#modalBody").append(endDiv);
	    </c:forEach>
	}else if(type == "de"){
		<c:forEach var="fo" items="${de_rest}">
	    console.log("${fo}");
	    var divContent = "<div class='tu'>"; // <div> 열기
	    
	    <c:forEach var="food" items="${fo}">
	        console.log("${food}");
	        var product = "${food.product}";
	        var img = "${food.pimg.companyid}" + "${food.pimg.category}" + "${food.pimg.category2}" + "${food.pimg.flavor}" + "F" + "${food.pimg.num}" + "${food.pimg.ext}";
	        var kcal = "${food.productinfo.kcal}";
	        var productid = "${food.productinfo.productid}";
	        
	        // 모달 내용에 추가
	        divContent += "<li class='col-md-4'><div class='thum' data-productid='" + productid + "' data-img='" + img + "' data-product='" + product + "'data-type='" + type + "'data-kcal='" + kcal + "'" +
	            "style='width:120px; text-align:center;'><img style='width:120px; height: 120px;' src='/resources/p_img/" + img + "'/></div>" +
	            "<div>" + product + "</div>" +
	            "<div>칼로리 : " + kcal + "</div></li>";
	    </c:forEach>

	    divContent += "</div>"; // </div> 닫기
	    $("#modalBody").append(divContent);
	</c:forEach>
	}
		 $(".tu").click(function () {
	            var clickedContent = $(this).html();
	            $("#myModal").modal('hide');
	            $("#de").html("");
	            $("#de").html(clickedContent);
	        });
		 
		 
		$("#myModal").modal('show');
	}
</script>
<script>
	function modify(minkcal, maxkcal, mo, type){
		var category = 1;
		if(type == "se"){
			category = 0;
		}
	    $.ajax({
	        url: "/admin/change",
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
	                var productid = food.productinfo.productid;
	                var product = food.product;
	                // 모달 내용에 추가
	                $("#modalBody").append("<li class='col-md-4'><div class='thum' data-productid='"+productid+"' data-img='"+img+"' data-product='"+product+"'data-type='"+ type +"'data-kcal='"+kcal+"'"+
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
    	var type = $(this).data('type');
    	$("#myModal").modal('hide');
    	console.log(kcal);
    	
        $("#"+type).html("");
        $("#"+type).html("<div id='"+ productid +"'><img style='width:50px;' src='/resources/p_img/" + img + "'/></div>"
        			+"<div>"+product+"</div>"+
        			"<div id='"+type+"_m'>"+kcal+"</div>"+
        			"<input type='hidden' id='mo' value='"+ productid +"'/>");
        var totalKcal = parseInt($("#mo_m").text()) + parseInt($("#br_m").text()) + parseInt($("#de_m").text()) + parseInt($("#se_m").text());
        $("#totalKcal").text(totalKcal);
    });
</script>

<body>
	<h2>식단 짜주기 페이지</h2>
	<c:forEach var="fo" items="${list}">
		${fo.productid}
	</c:forEach>
	
	<c:set var="totalKcal" value="0" scope="page" />
	
	<c:if test="${mo_check == 1}">
		<h2>아침</h2>
		<c:forEach var="food" items="${mo_group}">
		<div id="mo">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="mo_m">${food.productinfo.kcal}</div>
	    </div>
	    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
	    	<c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	    	<c:set var="productid" value="${food.productinfo.productid}" scope="page" />
    	</c:forEach>
	    <div><button type="button" onclick="modi('${mo_minkcal}', '${mo_maxkcal}', '${productid}','mo');" id="modify">다른 식품 추천</button></div>
	</c:if>
	<c:if test="${mo_check != 1}">
	<c:forEach var="food" items="${mo_re}">
	    <h2>아침</h2>
	    <div id="mo">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="mo_m">${food.productinfo.kcal}</div>
	    </div>
	    <div><button type="button" onclick="modify('${mo_minkcal}', '${mo_maxkcal}', '${food.productinfo.productid}','mo');" id="modify">다른 식품 추천</button></div>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	    <div id="result"></div>
	</c:forEach>
	</c:if>
	<hr/>
	
	<c:if test="${br_check == 1}">
		<h2>점심</h2>
		<c:forEach var="food" items="${br_group}">
		<div id="br">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="br_m">${food.productinfo.kcal}</div>
	    </div>
	    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
	    	<c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	    	<c:set var="productid" value="${food.productinfo.productid}" scope="page" />
    	</c:forEach>
	    <div><button type="button" onclick="modi('${br_minkcal}', '${br_maxkcal}', '${productid}','br');" id="modify">다른 식품 추천</button></div>
	</c:if>
	<c:if test="${br_check != 1}">
	<c:forEach var="food" items="${br_re}">
	    <h2>점심</h2>
	    <div id="br">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="br_m">${food.productinfo.kcal}</div>
	    </div>
	    <div><button type="button" onclick="modify('${br_minkcal}', '${br_maxkcal}', '${food.productinfo.productid}','br');" id="modify">다른 식품 추천</button></div>
	    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	</c:forEach>
	</c:if>
	<hr/>
	
	<c:if test="${de_check == 1}">
		<h2>저녁</h2>
		<div id="de">
		<c:forEach var="food" items="${de_group}">
		<div id="dee">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="de_m">${food.productinfo.kcal}</div>
	    </div>
	    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
	    	<c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
    	<c:set var="productid" value="${food.productinfo.productid}" scope="page" />
    	</c:forEach>
    	</div>
	    <div><button type="button" onclick="modi('${de_minkcal}', '${de_maxkcal}', '${productid}','de');" id="modify">다른 식품 추천</button></div>
	</c:if>
	<c:if test="${de_check != 1}">
	<c:forEach var="food" items="${de_re}">
	    <h2>저녁</h2>
	    <div id="de">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="de_m">${food.productinfo.kcal}</div>
	    </div>
	    <div><button type="button" onclick="modify('${de_minkcal}', '${de_maxkcal}', '${food.productinfo.productid}','de');" id="modify">다른 식품 추천</button></div>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	</c:forEach>
	</c:if>
	<hr/>
	
	<c:if test="${se_check == 1}">
		<h2>간식</h2>
		<c:forEach var="food" items="${se_group}">
		<div id="se">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="se_m">${food.productinfo.kcal}</div>
	    </div>
	    <input type="hidden" id="mo" value="${food.productinfo.productid}"/>
	    	<c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
			<c:set var="productid" value="${food.productinfo.productid}" scope="page" />
    	</c:forEach>
	    <div><button type="button" onclick="modify('${se_minkcal}', '${se_maxkcal}', '${productid}','se');" id="modify">다른 식품 추천</button></div>
	</c:if>
	<c:if test="${se_check != 1}">
	<c:forEach var="food" items="${se_re}">
	    <h2>간식</h2>
	    <div id="se">
	    <img style="width:50px;" src="/resources/p_img/${food.pimg.companyid}${food.pimg.category}${food.pimg.category2}${food.pimg.flavor}F${food.pimg.num}${food.pimg.ext}"/>
	    <div>${food.product}</div>
	    <div id="se_m">${food.productinfo.kcal}</div>
	    </div>
	    <div><button type="button" onclick="modify('${se_minkcal}', '${se_maxkcal}', '${food.productinfo.productid}','se');" id="modify">다른 식품 추천</button></div>
	    <c:set var="totalKcal" value="${totalKcal + food.productinfo.kcal}" scope="page" />
	</c:forEach>
	</c:if>
	<hr/>
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
	</body>
</html>