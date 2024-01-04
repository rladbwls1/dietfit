<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_management</title>
</head>
<body>
<div>${info.id}(${info.name}) 님의 회원정보입니다.</div>
<h2>회원 기본 정보</h2>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>아이디</th>
			<td>${info.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${info.name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${info.email}</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				<c:if test="${info.status==1}">new</c:if>
				<c:if test="${info.status==2}">bronze</c:if>
				<c:if test="${info.status==3}">silver</c:if>
				<c:if test="${info.status==4}">gold</c:if>
				<c:if test="${info.status==0}">정지회원</c:if>
				<c:if test="${info.status==99}">탈퇴회원</c:if>
				<c:if test="${info.status==888}">판매자</c:if>
				<c:if test="${info.status==999}">관리자</c:if>
			</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td><fmt:formatDate value="${info.reg}" pattern="yyyy-MM-dd HH:ss"/></td>
		</tr>
	</table>
	<button type="button" onclick="modify_info('${info.id}')">정보 수정</button>
	
<h2>사이트 가입 정보</h2>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>주소</th>
			<td>${mem_info.addr1} ${mem_info.addr2}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${mem_info.phone}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${info.nic}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><fmt:formatDate value="${mem_info.birth}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<c:if test="${mem_info.gender == 0}">선택 안함</c:if>
				<c:if test="${mem_info.gender == 1}">남자</c:if>
				<c:if test="${mem_info.gender == 2}">여자</c:if>
			</td>
		</tr>
	</table>	
</body>
<script>
function modify_info(id){
	var width = 650;
    var height = 650;

    var screenWidth = window.innerWidth;
    var screenHeight = window.innerHeight;

    var left = (screenWidth - width) / 2;
    var top = (screenHeight - height) / 2;

    var popOption = "width=" + width + "px, height=" + height + "px, top=" + top + "px, left=" + left + "px, scrollbars=yes";
    var openUrl = '/admin/modifyinfo?id='+id;

    window.open(openUrl, 'pop', popOption);
}
</script>
</html>