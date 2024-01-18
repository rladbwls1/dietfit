<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-1.10.2.min.js"></script>
<script src="/resources/js/socket.io.js"></script>
<head>

</head>
<body>
    <h2>Seller Chat List</h2>

    <table>
        <thead>
            <tr>
                <th>방번호</th>
                <th>인간</th>
                <th>상품</th>
                <th>읽음?</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="chat" items="${chatlist}">
                <tr>
                    <td>${chat.roomnum}</td>
                    <td>
					    <a href="/seller/SELLERCHAT?roomnum=${chat.roomnum}">${chat.id}</a>
					</td>

                    <td>${chat.product}</td>
                    <td>${chat.readcheck}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
