<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify_info</title>
</head>
<body>
		<h2>회원 기본 정보</h2>
		<form method="post" action="/admin/modify">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="id" value="${info.id}">
		<table border="1" style="border-collapse:collapse;">
			<tr> 
				<th>아이디</th>
				<td>${info.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" value="${info.name}" name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" value="${info.email}" name="email"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="status">
					    <option value="1" ${info.status == 1 ? 'selected' : ''}>new</option>
					    <option value="2" ${info.status == 2 ? 'selected' : ''}>bronze</option>
					    <option value="3" ${info.status == 3 ? 'selected' : ''}>silver</option>
					    <option value="4" ${info.status == 4 ? 'selected' : ''}>gold</option>
					    <option value="0" ${info.status == 0 ? 'selected' : ''}>정지회원</option>
					    <option value="99" ${info.status == 99 ? 'selected' : ''}>탈퇴회원</option>
					    <option value="888" ${info.status == 888 ? 'selected' : ''}>판매자</option>
					    <option value="999" ${info.status == 999 ? 'selected' : ''}>관리자</option>
					</select>
				</td>
			</tr>
		</table>
	<h2>사이트 가입 정보</h2>
		<table border="1" style="border-collapse:collapse;">
			<tr>
				<th rowspan="2">주소</th>
				<td>기본<input type="text" name="addr1" value="${mem_info.addr1}"></td>
			</tr>
			<tr>
				<td>상세<input type="text" name="addr2" value="${mem_info.addr2}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" value="${mem_info.phone}" name="phone"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" value="${info.nic}" name="nic"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" value="<fmt:formatDate value="${mem_info.birth}" pattern="yyyy-MM-dd"/>" name="birth"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="1" ${mem_info.gender == 1 ? 'checked="checked"' : ''}>남자
					<input type="radio" name="gender" value="2" ${mem_info.gender == 2 ? 'checked="checked"' : ''}>여자
					<input type="radio" name="gender" value="0" ${mem_info.gender == 0 ? 'checked="checked"' : ''}>선택 안함
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="button" onclick="his();">취소</button>
	</form>
</body>
<script>
	function his(){
		history.go(-1);
	}
</script>
</html>