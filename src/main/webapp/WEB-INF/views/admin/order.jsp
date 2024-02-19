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
<link href="/resources/css/order.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

 <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/css/style.css" rel="stylesheet">
        
        <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
      		integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>


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
	<jsp:include page="/WEB-INF/views/navbar.jsp"/>
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="d-grid gap-2 col-6 mx-auto">
			<h1>주문 및 결제</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item">장바구니</li>
				    <li class="breadcrumb-item active" aria-current="page"><b style="color: #50AB89;">주문</b></li>
				    <li class="breadcrumb-item active" aria-current="page">결제</li>
				  </ol>
				</nav>
			</div>
		</div>
	</div>	
	
	<div class="container-fluid fruite py-5">
		<div class="d-grid gap-2 col-6 mx-auto">
			<h4>배송지</h4> 
			<div>
				<input type="text" name="nicaddr" id="nicaddr" value="${delivery9.nicaddr}" style="width: 60px;"/> 
				<button type="button" onclick="toOrderDelivery()">배송지 변경</button> <br />
				<input type="text" name="receiver" id="receiver" value="${delivery9.receiver}" style="width: 60px;"/> 
				• <input type="text" name="phone" id="phone" value=" ${delivery9.phone}" style="width: 120px;"/> <br />
				 <input type="text" name="address1" id="sample6_address" value="${delivery9.addr1}"  style="width: 300px;"/>, 
				 <input type="text" name="address2" id="sample6_detailAddress" value="${delivery9.addr2}"/>
				 우편번호 : <input type="text" name="postcode" id="sample6_postcode" value="${delivery9.postnum}"  style="width: 80px;" />
			</div>
			<hr />
		</div>
	
		<div class="d-grid gap-2 col-6 mx-auto">
			<h4 >주문상품 (총 ${quantity}건) </h4> 
			<div class="d-grid gap-2 d-md-flex justify-content-md-end"><button type="button" onclick="toggleTable()"> ▲</button></div>
				<div id="orderTable">
				<table>
					<thead>
						<tr>
							<th>이미지</th>
							<th>상품명</th>
							<th>구매수량</th>
							<th>구매가격</th>
						</tr>
					</thead>
					
					<c:set var="i" value="0"/>
						<c:forEach var="cart" items="${list }" >
							<c:if test="${nums.contains(cart.NUM.toString())}">
								<tr id="${cart.NUM }" >
									<td>
										<img src="${imgPaths[i]}" width="50"/>
									</td>
									<td>
										${cart.PRODUCT }
									</td>
									<td>
										<span id="${cart.NUM }_quantity" >${cart.QUANTITY }</span>
									</td>
									<td>
										<span id="${cart.NUM }_price" >${cart.PRICE*cart.QUANTITY }</span>
									</td>
								</tr>
							</c:if>
						<c:set var="i" value="${i+1 }"/>
						<input type="hidden" id="delivery" value="0"/>
					</c:forEach>
				</table>
			</div>
		</div>
		
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
		
		<div class="d-grid gap-2 col-6 mx-auto">
		<hr />
			<h4>할인적용</h4>
			<div class="col-6 col-md-4">
				<input type="text" name="useCoupon" id="useCoupon" value="쿠폰을 선택해주세요" readonly />
				<button type="button" onclick="toMyCoupon('${nums}')">내 쿠폰함 </button> <br />
				
				보유 적립금: ${mypoint }
				<button type="button" onclick="useAllPoint('${mypoint }')" >적립금 모두 사용하기</button>
			</div>
			<hr />
		</div>
		
		<div class="d-grid gap-2 col-6 mx-auto">
			<h4>결제금액</h4>
			<p>상품금액: ${amount } 원 </p>
			<p>배송비:      원</p>
			<div >
				<p>쿠폰할인금액:(-) <input type="text" name="coupon" id="coupon" value="0" oninput="totalAmount()" readonly/>   원 </p>
				<p>적립금 사용 : (-) <input type="text" pattern="[0-9]+" id="point" name="point" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); checkPoint('${mypoint }');" /> 원</p>
				<b>총 결제금액 <input type="text" id="totalAmount"  value="${amount }" readonly/> 원</b>
			</div>
		</div>
		
		<div class="d-grid gap-2 col-6 mx-auto">
		<hr />
		
			<h4>결제방식</h4>
			<form id="kakaoPayForm" class="payment-form" >
				<input type="radio" name="chk_info" value="kakaopay" onclick="selectPayment('kakaopay')"> 카카오페이
				<input type="hidden" name="nums" value="${nums }"/>
			    <input type="hidden" name="address1" id="dbaddress" value="${delivery9.addr1}"/> 
			    <input type="hidden" name="address2" id="dbaddress2" value="${delivery9.addr2}"/> 
				<input type="hidden" name="phone" id="dbphone" value="${delivery9.phone}"/> 
				<input type="hidden" name="nicaddr" id="dbnicaddr" value="${delivery9.nicaddr}"/> 
			    <input type="hidden" name="postcode" id="dbpostcode" value="${delivery9.postnum}" /> 
				<input type="hidden" name="receiver" id="dbreceiver" value="${delivery9.receiver}"/> 
		
				<input type="hidden" name="couponid" id="couponid" value="null" /> <!-- 사용한 쿠폰 ID -->
				<input type="hidden" name="coupondiscount" id="coupondiscount" value="0"/> <!-- 쿠폰으로 할인된 금액 -->
				<input type="hidden" name="usepoint" id="usepoint"  value="0"/> <!-- 사용한 적립금 -->
				<input type="hidden"  id="totaldiscount" value="0" /> <!-- 총 할인 금액 -->
		
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
			
			<form id="accountPaymentForm" class="payment-form">
			    <input type="radio" name="chk_info" value="easybank" onclick="selectPayment('easybank')"> 계좌 간편결제
			</form>
			
			<form id="normalPaymentForm" class="payment-form">
			    <input type="radio" name="chk_info" value="normal" onchange="showPaymentOptions()" onclick="selectPayment('normal')"> 일반 결제
			    <div id="paymentOptions"></div>
			</form>
			
			<br />
			<button type="button" onclick="submitForm()">결제하기</button>
		</div>
	</div>
</body>


</html>