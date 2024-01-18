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
		<h2>아이디 찾기</h2>
			<div class="input-group">
            	<i class='bx bxs-user'></i>
                <input type="text" name="email" id="email" placeholder="Email" />
				<button type="button" onclick="findSendEmail()">인증번호 받기</button> <br/>
            	<p id="email_check"></p>
            </div>
            <div class="input-group">
                <i class='bx bxs-user'></i>
                <input type="text" name="emailkey" id="emailkey" placeholder="인증번호를 입력하세요">
                <span id="verifiedCode" style="display:hidden;">
                    <button type="button" onclick="findPwVerify()">인증하기</button>
                </span>
            </div>
	
		<button value="로그인 하러 가기" onclick="javascript:window.location='/member/customLogin'"> <b>로그인 하러 가기</b> </button>
</body>
</html>
