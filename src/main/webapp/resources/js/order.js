
//order.jsp

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



function toOrderDelivery() {
    // 배송지 변경 팝업 띄우기
    window.open("/dietfit/orderDelivery", "배송지", "width=600, height=800, top=100, left=200, location=no");
}

function toMyCoupon(a) {
    // 배송지 변경 팝업 띄우기
    window.open("/dietfit/myCouponList?nums="+a, "쿠폰함", "width=500, height=600, top=100, left=200, location=no");
}


function useAllPoint(mypoint) {
    var point = parseInt(mypoint);

    document.getElementById("point").value = point;
    document.getElementById("usepoint").value = point;
    
    document.getElementById("discount").value=point;
    var amount = parseInt(document.getElementById("amount").value);
    document.getElementById("totalAmount").value=amount-point;
	document.getElementById("total_amount").value=amount-point;
}


function checkPoint(mypoint){
	if(parseInt($('#point').val())<0){
		$('#point').val(0);
	}
	if(parseInt($('#point').val())>parseInt(mypoint)){
		$('#point').val(mypoint);
	}
	var point = parseInt($('#point').val());
	if (isNaN(point) || point < 0) {
	    point = 0;
	}
	
	document.getElementById("point").value=point;
	document.getElementById("usepoint").value = point;

	var amount = parseInt(document.getElementById("amount").value);
	var couponValue = document.getElementById("coupon").value;
	var coupon = couponValue ? parseInt(couponValue) : 0;
	var discount = coupon + point;		
	
	
	document.getElementById("discount").value=discount;
	
	document.getElementById("totalAmount").value=amount-coupon-point;
	document.getElementById("total_amount").value=amount-coupon-point;
}
