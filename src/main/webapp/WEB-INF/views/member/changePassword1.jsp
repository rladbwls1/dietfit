<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>



<h1>비밀번호 변경</h1>
<form action="/member/changePwPro" method="post" onsubmit="CPAlert()">
<input type="hidden" name="id" value="${id }"/>
${id}님의 비밀번호를 변경합니다. <br/>
pw: <input type="password" name="pw" id="pw"/> <br/>
<p id="pw_check"></p>
pw확인: <input type="password" name="pw2" id="pw2"/> <br/>
<p id="pw2_check"></p>
<button type="submit" onclick="return checkPwChange()">변경하기</button>
</form>
