<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> login page </h1>

<form action="/login" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="text" name="username"/> <br/>
	<input type="password" name="password"/> <br/>
	자동 로그인 : <input type="checkbox" name="remember-me"/> <br/>
	<input type="submit" value="로그인"/>
</form>