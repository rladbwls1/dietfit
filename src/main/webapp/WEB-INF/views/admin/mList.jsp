<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
</head>
<body>
<<<<<<< HEAD
	<h2>회원 리스트</h2>
=======
	<h2>회원 리스트99</h2>
>>>>>>> branch 'main' of https://github.com/rladbwls1/dietfit.git
	<h5>총 ${count}명</h5>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>사용자 이름</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>가입일자</th>
			<th>등급</th>
		</tr>
		<c:forEach var="member" items="${memberlist}">
			<tr>
				<td>${member.num}</td>
				<td>${member.id}</td>
				<td>${member.pw}</td>
				<td>${member.name}</td>
				<td>${member.nic}</td>
				<td>${member.email}</td>
				<td><fmt:formatDate value="${member.reg}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${member.status==1}">일반회원(new)</c:if>
					<c:if test="${member.status==2}">일반회원(bronze)</c:if>
					<c:if test="${member.status==3}">일반회원(silver)</c:if>
					<c:if test="${member.status==4}">일반회원(gold)</c:if>
					<c:if test="${member.status==0}">정지회원</c:if>
					<c:if test="${member.status==99}">탈퇴회원</c:if>
					<c:if test="${member.status==888}">판매자</c:if>
					<c:if test="${member.status==999}">관리자</c:if>
					<button type="button" onclick="management('${member.id}');">관리</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${count > 0}">
		<c:if test="${startPage > 10}">
		<a href="/admin/mList?pageNum=${startPage-10}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="/admin/mList?pageNum=${i}">[${i}]</a>			
		</c:forEach>
		<c:if test="${endPage > pageCount}">
		<a href="/admin/mList?pageNum=${startPage+10}">[다음]</a>
		</c:if>
	</c:if>
</body>
<script>
function management(id){
	var width = 650;
    var height = 650;

    var screenWidth = window.innerWidth;
    var screenHeight = window.innerHeight;

    var left = (screenWidth - width) / 2;
    var top = (screenHeight - height) / 2;

    var popOption = "width=" + width + "px, height=" + height + "px, top=" + top + "px, left=" + left + "px, scrollbars=yes";
    var openUrl = '/admin/management?id='+id;

    window.open(openUrl, 'pop', popOption);
}
</script>
</html>