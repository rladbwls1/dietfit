<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
	<p>쿠폰</p>
	<p>포인트</p>
	<p>마일리지</p>
	
	<h4>결제금액</h4>
	<p>총 상품 : ${quantity } 개 </p>
	<p>상품금액:  ${amount }   원 </p>
	<p>배송비:      원</p>
	<p>할인금액:(-)     원 </p>
	<b>총 결제금액 </b>
	
	<h4>결제방식</h4>
	<form id="kakaoPayForm" >
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
<script>
function showPaymentOptions() {
    // 선택된 결제 유형 가져오기
    var paymentType = document.querySelector('input[name="chk_info"]:checked').value;

    // 결제 옵션들을 감싸는 부모 엘리먼트 가져오기
    var paymentOptions = document.getElementById('paymentOptions');

    // 결제 유형에 따라 옵션들을 동적으로 생성하고 보이게 함
    if (paymentType === '일반결제') {
        paymentOptions.innerHTML = `
            <h5>일반결제 옵션</h5>
            <label><input type="radio" name="normalPayment" value="신용/체크카드"> 신용/체크카드</label>
            <label><input type="radio" name="normalPayment" value="무통장"> 무통장</label>
            <label><input type="radio" name="normalPayment" value="휴대폰"> 휴대폰</label>
        `;
        paymentOptions.style.display = 'block';
    } else {
        paymentOptions.innerHTML = ''; // 다른 결제 방식일 경우 내용을 지움
        paymentOptions.style.display = 'none';
    }
}

function submitForm() {
    // 선택된 결제 유형 가져오기
    var paymentType = document.querySelector('input[name="chk_info"]:checked').value;

    // 결제 유형에 따라 동적으로 폼 제출 또는 카카오페이 API 호출
    if (paymentType === '카카오페이') {
        $.ajax({
            url: 'kakaopaygo',
            type: 'POST',
            data: $('#kakaoPayForm').serialize(),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data.next_redirect_pc_url) {
                    location.href = data.next_redirect_pc_url;
                } else {
                    console.error('리다이렉트 URL이 정의되지 않았습니다.');
                    alert('카카오페이 요청 중 오류가 발생했습니다.');
                }
            },
            error: function (error) {
                console.error(error);
                alert('카카오페이 요청 중 오류가 발생했습니다.');
            }
        });
    } else if (paymentType === '계좌 간편결제') {
        document.getElementById('accountPaymentForm').submit();
    } else if (paymentType === '일반결제') {
        document.getElementById('normalPaymentForm').submit();
    }
}

</script>

</html>