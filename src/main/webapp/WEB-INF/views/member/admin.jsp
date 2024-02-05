<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>관리자</h1>
<form action="/logout" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" value="로그아웃"/>
</form>
	<button onclick="javascript:window.location='/admin/companylist'">판매자리스트</button>
	<button onclick="javascript:window.location='/admin/adminChat'">채팅</button>
