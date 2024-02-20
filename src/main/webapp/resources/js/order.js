
//order.jsp

function showPaymentOptions() {
    // 선택된 결제 유형 가져오기
    var paymentType = document.querySelector('input[name="chk_info"]:checked').value;

    // 결제 옵션들을 감싸는 부모 엘리먼트 가져오기
    var paymentOptions = document.getElementById('paymentOptions');

    // 결제 유형에 따라 옵션들을 동적으로 생성하고 보이게 함
    if (paymentType === 'normal') {
        paymentOptions.innerHTML = `
            <h5>일반결제 옵션</h5>
            <label><input type="radio" name="normalPayment" value="creditcard"> 신용/체크카드</label>
            <label><input type="radio" name="normalPayment" value="unaccount"> 무통장</label>
            <label><input type="radio" name="normalPayment" value="phone"> 휴대폰</label>
        `;
        paymentOptions.style.display = 'block';
    } else {
        paymentOptions.innerHTML = ''; // 다른 결제 방식일 경우 내용을 지움
        paymentOptions.style.display = 'none';
    }
}

// 폼 내부의 라디오 버튼에 대한 클릭 이벤트 핸들러 추가
document.querySelectorAll('.payment-form').forEach(function(form) {
    form.querySelectorAll('input[type="radio"]').forEach(function(radio) {
        radio.addEventListener('click', function() {
            // 해당 폼 내의 모든 라디오 버튼 해제
            form.querySelectorAll('input[type="radio"]').forEach(function(innerRadio) {
                innerRadio.checked = false;
            });
            // 현재 클릭한 라디오 버튼 선택
            this.checked = true;
        });
    });
});

// 결제 폼 제출 함수
function submitForm() {
    // 선택된 결제 유형 가져오기
    var paymentType = document.querySelector('input[name="chk_info"]:checked').value;

    // 결제 유형에 따라 동적으로 폼 제출 또는 카카오페이 API 호출
    if (paymentType === 'kakaopay') {
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
    } else if (paymentType === 'easybank') {
        document.getElementById('accountPaymentForm').submit();
    } else if (paymentType === 'normal') {
        document.getElementById('normalPaymentForm').submit();
    }
}

function selectPayment(paymentType) {
  // 선택된 결제 방식에 해당하는 'checked' 속성을 true로 설정
  document.querySelector('input[name="chk_info"][value="' + paymentType + '"]').checked = true;

  // 선택된 결제 방식을 제외한 다른 옵션 비활성화
  for (var i = 0; i < document.querySelectorAll('input[name="chk_info"]').length; i++) {
    var option = document.querySelectorAll('input[name="chk_info"]')[i];
    if (option.value !== paymentType) {
      option.disabled = true;
    }
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
    
    //coupondiscount에 넣어둔 값 가져오기
    var coupondiscount = parseInt(document.getElementById("coupondiscount").value);
    document.getElementById("totaldiscount").value=point+coupondiscount;
    
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
	var totaldiscount = coupon + point;	
	
	document.getElementById("totaldiscount").value=totaldiscount;
	
	document.getElementById("totalAmount").value=amount-totaldiscount;
	document.getElementById("total_amount").value=amount-totaldiscount;
}

//주문상품에서 상품 볼때 접었다 폈다
function toggleTable() {
        var table = document.getElementById("orderTable");
        if (table.style.display === "none") {
            table.style.display = "block";
        } else {
            table.style.display = "none";
        }
    }
    
    
 
