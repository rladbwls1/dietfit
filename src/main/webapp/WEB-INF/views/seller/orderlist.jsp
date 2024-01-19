<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<html>
	<head>
	<style>
            table {
              border-collapse: collapse; 
              width: 100%;
            }
            td, th {
                border: 1px solid #ddd;
                padding: 8px; 
            }
            th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
        </style>
        <script>
        function openInvoiceInputPopup(orderid, productid) {
            var cid = $('#companyid').val().substr(0, 2);
            var popupUrl = '/seller/insertpurchase?orderid=' + orderid + '&companyid=' + cid;
            var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=400, scrollbars=yes');

            var checkPopupClosed = setInterval(function() {
                if (popupWindow.closed) {
                    clearInterval(checkPopupClosed);
                    window.location.reload(); 
                }
            }, 500); // 500ms 마다 확인

            if (popupWindow) {
                popupWindow.focus();
            }
        }

        function windowclose2(){
        	window.location.href="/seller/orderlist";
        }
        </script>
        <script>
        function openTracking(courier, tracking) {
            var form = document.createElement("form");
            form.setAttribute("method", "post");
            form.setAttribute("action", "http://info.sweettracker.co.kr/tracking/4");
            form.setAttribute("target", "popupWindow");

            var tKeyField = document.createElement("input");
            tKeyField.setAttribute("type", "hidden");
            tKeyField.setAttribute("name", "t_key");
            tKeyField.setAttribute("value", "O67C0pIqRFuCtfaclrXlxg"); 

            var tCodeField = document.createElement("input");
            tCodeField.setAttribute("type", "hidden");
            tCodeField.setAttribute("name", "t_code");
            tCodeField.setAttribute("value", courier);

            var tInvoiceField = document.createElement("input");
            tInvoiceField.setAttribute("type", "hidden");
            tInvoiceField.setAttribute("name", "t_invoice");
            tInvoiceField.setAttribute("value", tracking);

            form.appendChild(tKeyField);
            form.appendChild(tCodeField);
            form.appendChild(tInvoiceField);

            document.body.appendChild(form);

            window.open('', 'popupWindow', 'width=450, height=930, scrollbars=yes');
            form.submit();
        }

		</script>
	</head>
	
	<body>
		<table>
			<tr>
				<input type="hidden" name="companyid" id="companyid" value=${companyid} />
				<td></td>
				<td>결제 날짜</td>
				<td>주문번호</td>
				<td>상품 이름</td>
				<td>상품 가격</td>
				<td>상품 수량</td>
				<td>할인률</td>
				<td>결제 방법</td>
				<td>택배사</td>
				<td>배송</td>
				<td>구매 확정여부</td>
			</tr>
		<c:forEach var="order" items="${order}"  varStatus="status">
			<tr>
				<td>${order.courier},${order.tracking} </td>
				<td><fmt:formatDate value="${order.purdate}" pattern="yyyy-MM-dd"/></td>
				<td>${order.orderid }</td>
				<td>${order.product}</td>
				<td>${order.price }  원</td>
				<td>${order.quantity }</td>
				<td>${order.discount } 원</td>
				<td>${order.pay }</td>
				<td>
					<c:choose>
					    <c:when test="${order.courier == null}">
					        송장번호를 먼저 입력해주세요
					    </c:when>
					    <c:otherwise>
						    <c:choose>
						        <c:when test="${order.courier == '04'}">CJ대한통운</c:when>
						        <c:when test="${order.courier == '05'}">한진택배</c:when>
						        <c:when test="${order.courier == '08'}">롯데택배</c:when>
						        <c:when test="${order.courier == '01'}">우체국택배</c:when>
						        <c:when test="${order.courier == '46'}">CU 편의점택배</c:when>
						        <c:when test="${order.courier == '24'}">GS Postbox 택배</c:when>
						        <c:when test="${order.courier == '53'}">농협택배</c:when>
						        <c:when test="${order.courier == '69'}">대림통운</c:when>
						        <c:when test="${order.courier == '94'}">카카오 T 당일배송</c:when>
						    </c:choose>
					    </c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
					    <c:when test="${order.tracking == null}">
					        <button onclick="openInvoiceInputPopup('${order.orderid}')">송장번호 입력</button>
					    </c:when>
					    <c:otherwise>
					        <button onclick="openTracking('${order.courier}', '${order.tracking}')">배송조회</button>
					    </c:otherwise>
					</c:choose>
				</td>
				<td>
				<c:choose>
                     <c:when test="${order.purchase == 0}">
                         확정 X
                     </c:when>
                     <c:when test="${order.purchase == 9}">
                         확정 O
                     </c:when>
                </c:choose>
                </td>
			</tr>
		</c:forEach>
		</table>	
		<br>
	</body>
</html>