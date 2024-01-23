<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>채팅 신고 폼</title>
</head>
<body>
<h2>채팅 신고 폼</h2>

<form id="reportForm" action="/seller/chatreportpro" method="post">
    <input type="hidden" name="roomnum" id="roomnum" value="${roomnum}" />
    
    <label for="id">사용자 아이디:</label>
    <input type="text" id="id" name="id" value ="${id}" readonly><br>

    <label for="text">신고 사유:</label>
    <textarea id="text" name="text" rows="4" cols="50" required></textarea><br>

    <input type="submit" value="신고하기" >
</form>
</body>
</html>
