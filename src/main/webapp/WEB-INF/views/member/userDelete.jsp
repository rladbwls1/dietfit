<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Dietfit - 회원탈퇴</title>
<link href="/resources/css/findIdPw.css" rel="stylesheet">
<script src="/resources/js/findIdPw.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<div class="card">
		<h2>회원 탈퇴</h2>
        <form action="/logout" method="post" onsubmit="return deletePro()">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="id" id="id" value="${id}"/>

            <div class="input-group">
            	<p> 정말 탈퇴합니까?</p>
            	<p> 탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
            	<i class='bx bxs-lock-alt'></i>
                <input type="password" name="pw" id="pw"/>
            	<p id="pw_check"></p>
            </div>
			<button type="submit" > <b> 탈퇴 </b> </button>
			<br/>
            <br/>
            <button type="button" onclick="window.location.href='modifyForm'"> <b> 취소 </b> </button>
        
        </form>
    </div>
    
</body>
</html>