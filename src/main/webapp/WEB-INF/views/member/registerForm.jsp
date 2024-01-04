<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원가입하기</h1>
<form action="/member/registerPro" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	id: <input type="text" name="id"/> <br/>
	pw: <input type="password" name="pw"/> <br/>
	name: <input type="text" name="name"/> <br/>
	nic: <input type="text" name="nic"/> <br/>
	email: <input type="text" name="email"/> <br/>
	<input type="submit" value="가입하기"/>
</form>
    
    