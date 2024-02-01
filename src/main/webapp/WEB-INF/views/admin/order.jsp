<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
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
	<h4>할인적용</h4>
	<p>쿠폰</p>
	<p>포인트</p>
	<p>마일리지</p>
	
	<h4>결제금액</h4>
	<p>상품금액:  ${amount }   원 </p>
	<p>배송비:      원</p>
	<p>할인금액:(-)     원 </p>
	<b>총 결제금액 </b>
	
	<h4>결제방식</h4>
	<form id="kakaoPayForm" action="kakaopay" >
	    <input type="radio" name="chk_info" value="카카오페이" /> 카카오페이 <br />
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

    // 결제 유형에 따라 동적으로 폼 제출
    if (paymentType === '카카오페이') {
        document.getElementById('kakaoPayForm').submit();
    } else if (paymentType === '계좌 간편결제') {
        document.getElementById('accountPaymentForm').submit();
    } else if (paymentType === '일반결제') {
        document.getElementById('normalPaymentForm').submit();
    }
}


$(document).ready(function(){
    $('#kakaoPayBtn').click(function(){
        $.ajax({
            url: 'kakaopaygo',
            type: 'POST',
            data: $('#kakaoPayForm').serialize(),
            dataType: 'json',
            success: function(data) {
                console.log(data);
                if (data.next_redirect_pc_url) {
                    location.href = data.next_redirect_pc_url;
                } else {
                    console.error('리다이렉트 URL이 정의되지 않았습니다.');
                    alert('카카오페이 요청 중 오류가 발생했습니다.');
                }
            },
            error: function(error) {
                console.error(error);
                alert('카카오페이 요청 중 오류가 발생했습니다.');
            }
        });
    });
});

</script>

</html>