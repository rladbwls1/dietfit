<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KakaoPay Form</title>
    <script src="/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <form id="kakaoPayForm">
        가맹점 주문번호 : <input type="text" name="partner_order_id" value="${orderid }"><br>
        가맹점 회원 id : <input type="text" name="partner_user_id" value="${userid }"><br>
        상품명 : <input type="text" name="item_name" value="${초코파이 }외"><br>
        상품 수량 : <input type="text" name="quantity" value="${quantity }"><br>
        상품 총액 : <input type="text" name="total_amount" value="${amount }"><br>
        상품 비과세 금액 : <input type="text" name="tax_free_amount" value="${taxfree }"><br>
        <input type="hidden" name="command" value="ready">
        <input type="hidden" value="TC0ONETIME" name="cid" readonly="readonly">
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/success.jsp" name="approval_url" readonly="readonly">
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/cancel.jsp" name="cancel_url" readonly="readonly">
        <input type="hidden" value="http://localhost:8080/dietfit/kakaoPay/fail.jsp" name="fail_url" readonly="readonly">
        <button type="button" id="kakaoPayBtn">결제 준비</button>
    </form>

    <script>
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
</body>
</html>
