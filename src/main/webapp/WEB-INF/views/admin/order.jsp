<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/findIdPw.js"></script>
<script src="/resources/js/order.js"></script>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<hr/>
${nums }
<hr/>

	<h2>주문/결제</h2>
        
		배송지 명 : <input type="text" name="nicaddr" id="nicaddr" value="${delivery.nicaddr}"/> <br />
		수령인 : <input type="text" name="receiver" id="receiver" value="${delivery.receiver}"/> <br />
		휴대폰 : <input type="text" name="phone" id="phone" value="${delivery.phone}"/> <br />
	    우편번호 : <input type="text" name="postcode" id="sample6_postcode" value="${delivery.postnum}" /><br />
	    주소지 : <input type="text" name="address1" id="sample6_address" value="${delivery.addr1}"/> <br />
	    상세주소 : <input type="text" name="address2" id="sample6_detailAddress" value="${delivery.addr2}"/> <br />

	
	<button type="button" onclick="toOrderDelivery()">배송지 변경</button>
	
	<div id="deliveryPopup" style="display: none;">
    <!-- 배송지 목록 및 선택 기능을 포함한 코드를 넣어주세요 -->
</div>
	
	<p>주문상품 </p>
	주문번호 : ${orderid } <br />
	${cartList } <br />
	상품 수량 : 총 ${quantity }건
	<h4>할인적용</h4>
	쿠폰적용 : <input type="text" name="useCoupon" id="useCoupon" value="쿠폰을 선택해주세요" />
	<button type="button" onclick="toMyCoupon('${nums}')">내 쿠폰함 </button> <br />
	보유 적립금: ${mypoint }
	<button type="button" onclick="useAllPoint('${mypoint }')" >적립금 모두 사용하기</button>
	
	<hr />
	
	<h4>결제금액</h4>
	<p>총 상품 : ${quantity } 개 </p>
	<p>상품금액: <input type="text" id="amount" value="${amount }" />원 </p>
	<p>배송비:      원</p>
	<p>쿠폰할인금액:(-) <input type="text" name="coupon" id="coupon" oninput="totalAmount()"/>   원 </p>
	<p>적립금 사용 : (-) <input type="text" pattern="[0-9]+" id="point" name="point" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); checkPoint('${mypoint }');"/> </p>
	<b>총 결제금액 <input type="text" id="totalAmount" /> 원</b>
	
	
	<h4>결제방식</h4>
	<form id="kakaoPayForm" >
	    <input type="radio" name="chk_info" value="카카오페이" /> 카카오페이
		<input type="hidden" name="nums" value="${nums }"/>
		
	    <input type="hidden" name="address1" id="dbaddress" value="${delivery.addr1}"/> 
	    <input type="hidden" name="address2" id="dbaddress2" value="${delivery.addr2}"/> 
		<input type="hidden" name="phone" id="dbphone" value="${delivery.phone}"/> 
		<input type="hidden" name="nicaddr" id="dbnicaddr" value="${delivery.nicaddr}"/> 
	    <input type="hidden" name="postcode" id="dbpostcode" value="${delivery.postnum}" /> 
		<input type="hidden" name="receiver" id="dbreceiver" value="${delivery.receiver}"/> 
		
		<input type="hidden" name="partner_order_id"  value="${orderid }" />
        <input type="hidden" name="partner_user_id" value="dietfit" />
        <input type="hidden" name="item_name" value="dietfit ${quantity }건" />
        <input type="hidden" name="quantity"  value="${quantity }" />
        <input type="hidden" name="total_amount" id="total_amount" value="${amount }" />
        <input type="hidden" name="tax_free_amount" value="${taxfree }" />
        
        <input type="hidden" name="command" value="ready" />
        <input type="hidden" value="TC0ONETIME" name="cid" readonly="readonly" />
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/success" name="approval_url" readonly="readonly" />
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/cancel" name="cancel_url" readonly="readonly" />
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/fail" name="fail_url" readonly="readonly" />
	</form>
	
	<form id="accountPaymentForm" action="#" method="post">
	    <input type="radio" name="chk_info" value="계좌 간편결제"> 계좌 간편결제
	</form>
	
	<form id="normalPaymentForm" action="#" method="post">
	    <input type="radio" name="chk_info" value="일반결제" onchange="showPaymentOptions()"> 일반 결제
	    <div id="paymentOptions"></div>
	</form>
	
	<br />
	<button type="button" onclick="submitForm()">결제하기</button>
</body>


</html>