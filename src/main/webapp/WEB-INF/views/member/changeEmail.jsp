<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - 이메일 변경</title>
<link href="/resources/css/findIdPw.css" rel="stylesheet">
<script src="/resources/js/findIdPw.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<div class="card">
		<h2>이메일 변경</h2>
        <form action="/member/changeEmailPro" method="post" onsubmit="return changeEmailCheck()">
            <input type="hidden" name="id" id="id" value="${id}"/>
            <input type="hidden" name="emaill" id="emaill" value="false"/>

            <div class="input-group">
            	<p> ${id}님의 이메일을 변경합니다.</p>
            	<i class='bx bxs-lock-alt'></i>
                <input type="text" name="email" id="email" placeholder="New Email" oninput="checkEmail()"/>
            	<button type="button" onclick="sendEmail()"> 인증번호 받기</button>
            	<p id="email_check"></p>
            </div>

            <div class="input-group">
                <i class='bx bxs-lock-alt'></i>
                <input type="text" name="emailkey" id="emailkey" placeholder="인증번호">
                <span id="verifiedEmail" >
                <button type="button" onclick="verifiedEmail()">인증하기</button>
                </span>
            </div>

            <button type="submit"  > <b> 변경 </b> </button>
        </form>
    </div>
</body>
</html>