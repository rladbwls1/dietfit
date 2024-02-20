<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<c:if test="${empty list }">
		<h3>쿠폰이 없습니다.</h3>
	</c:if>
	<c:if test="${!empty list }">
		<h3> 쿠폰 다운로드</h3>
		<table class="table">
			<tr>
				<td>사용</td>
				<td>쿠폰명</td>
				<td>적용회사</td>
				<td>할인율(%)</td>
				<td>만료날짜</td>
				<td></td>
			</tr>
			<c:forEach var="map" items="${list}">
			    <c:forEach var="entry" items="${companyPrice}">
			        <c:if test="${entry.key eq map.get('COMPANYID')}">
			            <tr>
			                <td><input type="radio" name="selectedCoupon" id="selectedCoupon" value="${map.get('COUPON')}" /> </td>
			                <td>${map.get('COUPON')}</td>
			                <td>${map.get('COMPANYID') }</td>
			                <td>${map.get('DISCOUNT') }</td>
			                <td><fmt:formatDate value="${map.get('DELETEDATE')}" pattern="yyyy-MM-dd"/></td>
			            	<td><input type="hidden" name="couponid" value="${map.get('COUPONID')}"></td>
			            </tr>
			        </c:if>
			        <c:if test="${!entry.key eq map.get('COMPANYID') }">
			        	<h3> xx</h3>
			        </c:if>
			    </c:forEach>
			</c:forEach>
	    </table>
		<button class="btn btn-outline-dark me md-2" type="button" onclick="return useCouponInfo()">할인적용</button>
	</c:if>
</body>

<script>
function useCouponInfo(){
	if(!$('#selectedCoupon:checked').val()){
		alert("쿠폰을 선택해주세요.");
		return false;
	}else{
		//라디오 버튼 체크 - 쿠폰명
		var selectedCoupon = $('#selectedCoupon:checked').val(); 
		//사용가능한 회사 ID
		var canuseCompany = $('input[name=selectedCoupon]:checked').closest('tr').find('td:eq(2)').text();
		//쿠폰 할인율
		var couponDiscount = $('input[name=selectedCoupon]:checked').closest('tr').find('td:eq(3)').text();
		// 선택된 라디오 버튼의 couponid를 가져옴
		var couponid = $('input[name="selectedCoupon"]:checked').closest('tr').find('input[name="couponid"]').val();
		
		//해당 회사에 따른 가격.
		var companyPriceData = {
				<c:forEach var="entry" items="${companyPrice}">
					"${entry.key}": ${entry.value},
				</c:forEach>
		};
		
		var couponPrice = 0;
		for (var companyId in companyPriceData) {
		    if (companyPriceData.hasOwnProperty(companyId)) { // 객체 있는지 확인
		        // 쿠폰 할인율이 숫자인지 확인
		        if (!isNaN(parseFloat(couponDiscount))) {
		            // 쿠폰 가격 계산: 회사 가격 * (할인율 / 100)
		            couponPrice = companyPriceData[canuseCompany] * (parseFloat(couponDiscount) / 100);
		        } else {
		            // 쿠폰 할인율이 유효하지 않은 경우에 대한 처리
		            console.error("쿠폰 할인율이 유효하지 않습니다.");
		        }
		    }
		}

		//사용한 쿠폰, 쿠폰 할인 금액, ordersum에 들어가는 쿠폰 할인 금액 및 아이디
		opener.document.getElementById("useCoupon").value=selectedCoupon;
		opener.document.getElementById("coupon").value=couponPrice;
		opener.document.getElementById("coupondiscount").value=couponPrice;
		opener.document.getElementById("couponid").value=couponid;
		
		//상품 원래 금액
		var amount = parseInt(opener.document.getElementById("total_amount").value);
		
		//사용한 쿠폰 할인금액, 적립금 / 할인금액 + 적립금  = totaldiscount
		var coupondiscount = parseInt(opener.document.getElementById("coupondiscount").value);
		var point = parseInt(opener.document.getElementById("point").value);
		var totaldiscount = parseInt(coupondiscount + point);	
		
		opener.document.getElementById("totaldiscount").value=totaldiscount;
		opener.document.getElementById("point").value=point;
		opener.document.getElementById("usepoint").value=point;
		opener.document.getElementById("totalAmount").value=amount-totaldiscount;
		opener.document.getElementById("total_amount").value=amount-totaldiscount;
		
		window.close();
	}
}
</script>
</html>