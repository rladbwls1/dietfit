<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-1.10.2.min.js"></script>
<script src="/resources/js/socket.io.js"></script>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

         h2 {
            text-align: center;
            color: #007bff; /* 더 강조적인 파란색으로 변경 */
            margin-top: 30px; /* 상단 마진 추가 */
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h2>Seller Chat List</h2>

    <table>
        <thead>
            <tr>
                <th>방번호</th>
                <th>질문자</th>
                <th>문의상품</th>
                <th>신고</th>
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
                    <td>
	                    <button type="button" onclick="openDiscountFormPopup('${chat.roomnum}');">신고</button>
	                </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
    function closewindow2(){
    	window.location.href="/seller/sellerchatlist";
    }
    </script>
    <script>
    function openDiscountFormPopup(roomnum) {

        var popupUrl = '/seller/chatreport?roomnum=' + roomnum;
        var popupWindow = window.open(popupUrl, '_blank', 'width=600, height=400, scrollbars=yes');
        
        if (popupWindow) {
            popupWindow.focus();
        }
    }
   
    </script>
</body>
</html>
