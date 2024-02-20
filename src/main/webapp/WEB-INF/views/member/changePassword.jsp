<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - 비밀번호 변경</title>
<link href="/resources/css/findIdPw.css" rel="stylesheet">
<script src="/resources/js/findIdPw.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<div class="card">
		<h2>비밀번호 변경</h2>
        <form action="/member/changePwPro" method="post" onsubmit="CPAlert()">
            <input type="hidden" name="id" value="${id}"/>

            <div class="input-group">
            	<p> ${id}님의 비밀번호를 변경합니다.</p>
            	<i class='bx bxs-lock-alt'></i>
                <input type="password" name="pw" id="pw" placeholder="New Password" />
            	<p id="pw_check"></p>
            </div>

            <div class="input-group">
                <i class='bx bxs-lock-alt'></i>
                <input type="password" name="pw2" id="pw2" placeholder="New Password 확인">
                <p id="pw2_check"></p>
            </div>

            <button type="submit" onclick="return checkPwChange()"> <b> 변경 </b> </button>
            <br/>
            <br/>
            <button type="button" onclick="window.location.href='modifyForm'"> <b> 취소 </b> </button>
        </form>
    </div>
</body>
</html>