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
</head>
<body>
<c:if test="${empty list }">
<h3>쿠폰이 없습니다.</h3>
</c:if>
<c:if test="${!empty list }">
		${cartList } <br />
		<c:if test=""></c:if>
		 ${cartList.get(0).COMPANYID} <br />
		${companyPrice} <br />
		${companyPrice.get(0).COMPANYID} <br />
		<hr />
		<c:forEach var="entry" items="${companyPrice}">
		    <c:out value="${entry.key}" /> = <c:out value="${entry.value}" /><br/>
		</c:forEach>
		
		<table>
			<tr>
				<td>사용</td>
				<td>쿠폰 이름</td>
				<td>사용가능 회사ID</td>
				<td>만료날짜</td>
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
	    

		<button type="button" onclick="return useCouponInfo()">할인적용</button>
</c:if>
<button type="button" onclick="window.location.href='all'" >all로 가기 </button>
</body>
<script>
function useCouponInfo(){
	if(!$('#selectedCoupon:checked').val()){
		alert("쿠폰을 선택해주세요.");
		return false;
	}else{
		//라디오 버튼 체크
		var selectedCoupon = $('#selectedCoupon:checked').val();
		//var coupon = $(":input[name=selectedCoupon]:checked").val();
		var couponDiscount = $('input[name=selectedCoupon]:checked').closest('tr').find('td:eq(3)').text();
		var canuseCompany = $('input[name=selectedCoupon]:checked').closest('tr').find('td:eq(2)').text();
		// 선택된 라디오 버튼의 couponid를 가져옴
		var couponid = $('input[name="selectedCoupon"]:checked').closest('tr').find('input[name="couponid"]').val();

		var companyPriceData = {
				<c:forEach var="entry" items="${companyPrice}">
					"${entry.key}": ${entry.value},
				</c:forEach>
		};
		var couponPrice = 0 ;
		for(var companyId in companyPriceData){
			if(companyPriceData.hasOwnProperty(companyId)){ //객체 있는지 확인
				couponPrice = companyPriceData[canuseCompany] * (couponDiscount / 100);
				break;
			}
		}
		
		//var couponid = $(":input[name=selectedCoupon]:checked").val();

		//사용한 쿠폰, 쿠폰 할인 금액, ordersum에 들어가는 쿠폰 할인 금액 및 아이디
		opener.document.getElementById("useCoupon").value=selectedCoupon;
		opener.document.getElementById("coupon").value=couponPrice;
		opener.document.getElementById("coupondiscount").value=couponPrice;
		opener.document.getElementById("couponid").value=couponid;
		
		//상품 원래 금액
		var amount = parseInt(opener.document.getElementById("amount").value);
		
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