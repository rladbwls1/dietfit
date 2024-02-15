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
<script>
	function week(day){
		var num = $("#day").val();
		$.ajax({
			url:'/member/week',
			type:'post',
			data:{day: day,
				  num: num},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				var dateParts = data.split(" ")[0].split("."); // 날짜 부분 파싱
	            var year = parseInt(dateParts[0]);
	            var month = parseInt(dateParts[1]) - 1; // JavaScript에서는 월이 0부터 시작하므로 -1
	            var day = parseInt(dateParts[2]);

	            var currentDate = new Date(year, month, day);

	            // 주차에 따른 날짜 간격 계산 함수
	            function calculateDateInterval(weeks) {
	                return weeks * 7; // 주차에 따른 일수 변환
	            }

	            // 출력할 날짜 개수 설정
	            var dateCount = 3;
	            
	            // 결과를 출력
	            var output = "<b>정기배송 첫 출고일</b> " +
	            currentDate.getFullYear() + "." +
	                (currentDate.getMonth() + 1).toString().padStart(2, '0') + "." +
	                currentDate.getDate().toString().padStart(2, '0') + "<br/>";

	            for (var i = 1; i < dateCount; i++) {
	                var interval = calculateDateInterval(num * i);
	                var nextDate = new Date(currentDate);
	                nextDate.setDate(currentDate.getDate() + interval);

	                // 계산된 날짜를 yyyy.MM.dd 형식으로 변환하여 결과에 추가
	                output += "<b>정기배송 " + (i + 1) + "번째 출고일</b> " +
	                    nextDate.getFullYear() + "." +
	                    (nextDate.getMonth() + 1).toString().padStart(2, '0') + "." +
	                    nextDate.getDate().toString().padStart(2, '0') + "<br/>";
	            }

	            // 결과를 출력
	            $("#calendar").html(output);
	        }
		});
	}
	
	function bott_box(num){
	    $("#days").html("<h5>배송 요일</h5>"+
	            "<input type='hidden' value="+num+" id='day'/>"+
	    		"<button onclick=\"week('Monday')\">월</button>"+
	            "<button onclick=\"week('Tuesday')\">화</button>"+
	            "<button onclick=\"week('Wednesday')\">수</button>"+
	            "<button onclick=\"week('Thursday')\">목</button>"+
	            "<button onclick=\"week('Friday')\">금</button>"+
	            "<button onclick=\"week('Saturday')\">토</button>"+
	            "<div id='calendar'></div>");
	}

</script>
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
	<p>배송지 - delivery 테이블</p>
	<p>주문상품 - orderdetail 테이블</p>
	상품명 : 
	상품명 : 
	상품 수량 : 
	상품 비과세 금액 : 
	<c:if test="${delivery == 1}">
	<h4>정기배송일</h4>
	<h5>배송주기</h5>
	<div style="display:flex;">
		<button onclick="bott_box(1)">1주에 1번</button>
		<button onclick="bott_box(2)">2주에 1번</button>
		<button onclick="bott_box(3)">3주에 1번</button>
	</div>
	<div id="days"></div>
	</c:if>
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
	<p>적립금 사용 : (-) <input type="text" pattern="[0-9]+" id="point" name="point" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); checkPoint('${mypoint }');"/> 원</p>
	<b>총 결제금액 <input type="text" id="totalAmount"  value="${amount }"/> 원</b>
	
	
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
		
		<br />
		쿠폰 아이디 <input type="text" name="couponid" id="couponid" value="null" />
		적립금 사용 금액<input type="text" name="usepoint" id="usepoint"  value="0"/>
		총 할인 금액<input type="text" name="discount" id="discount" value="0"/>
		
		
		<input type="hidden" name="partner_order_id"  value="${orderid }" />
        <input type="hidden" name="partner_user_id" value="dietfit" />
        <input type="hidden" name="item_name" value="dietfit ${quantity }건" />
        <input type="hidden" name="quantity"  value="${quantity }" />
        총 금액 <input type="text" name="total_amount" id="total_amount" value="${amount }" />
        <input type="hidden" name="tax_free_amount" value="${taxfree }" />
        
        <input type="hidden" name="command" value="ready" />
        <input type="hidden" value="TC0ONETIME" name="cid" readonly="readonly" />
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/success" name="approval_url" readonly="readonly" />
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/cancel" name="cancel_url" readonly="readonly" />
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/fail" name="fail_url" readonly="readonly" />
	    <input type="radio" name="chk_info" value="카카오페이" /> 카카오페이 <br />
		<input type="text" name="partner_order_id" value="123"><br>
        <input type="text" name="partner_user_id" value="dietfit"><br>
        <input type="text" name="item_name" value="${quantity }"><br>
        <input type="text" name="quantity" value="${quantity }"><br>
        <input type="text" name="total_amount" value="${amount }"><br>
        <input type="text" name="tax_free_amount" value="${taxfree }"><br>
        <input type="text" name="delivery" value="${delivery}">
        <input type="hidden" name="command" value="ready">
        <input type="hidden" value="TC0ONETIME" name="cid" readonly="readonly">
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/success.jsp" name="approval_url" readonly="readonly">
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/cancel.jsp" name="cancel_url" readonly="readonly">
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/fail.jsp" name="fail_url" readonly="readonly">
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