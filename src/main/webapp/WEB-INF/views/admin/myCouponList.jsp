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
			                <td><input type="radio" name="selectedCoupon" id="selectedCoupon" value="${map.get('COUPONID')}" /> </td>
			                <td>${map.get('COUPON')}</td>
			                <td>${map.get('COMPANYID') }</td>
			                <td>${map.get('DISCOUNT') }</td>
			                <td><fmt:formatDate value="${map.get('DELETEDATE')}" pattern="yyyy-MM-dd"/></td>
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
		
		var couponDiscount = $('input[name=selectedCoupon]:checked').closest('tr').find('td:eq(3)').text();
		var canuseCompany = $('input[name=selectedCoupon]:checked').closest('tr').find('td:eq(2)').text();
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
		
		var couponid = $(":input[name=selectedCoupon]:checked").val();

		
		opener.document.getElementById("useCoupon").value=selectedCoupon;
		opener.document.getElementById("coupon").value=couponPrice;
		opener.document.getElementById("couponid").value=couponid;
		
		var amount = parseInt(opener.document.getElementById("amount").value);
		var coupon = parseInt(opener.document.getElementById("coupon").value);
		var point = parseInt(opener.document.getElementById("point").value);
		var discount = parseInt(coupon + point);
		
		opener.document.getElementById("point").value=point;
		opener.document.getElementById("usepoint").value=point;
		opener.document.getElementById("discount").value=discount;
		
		opener.document.getElementById("totalAmount").value=amount-coupon-point;
		opener.document.getElementById("total_amount").value=amount-coupon-point;
		window.close();
	}
}
</script>
</html>