<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - company</title>
</head>
<body>
	<c:if test="${companycount == 0}">
		<h5> 판매자가 없습니다. </h5>
	</c:if>
	<c:if test="${companycount > 0}">
	<h3>총 ${companycount}개 업체입니다</h3>
	<div>
		<button type="button" onclick="location.href='/admin/allProduct?pageNum=1'">전체상품보기</button>
	</div>
		<table>
			<tr>      
				<td><b>아이디</b></td>
				<td><b>이름</b></td>
				<td><b>닉네임</b></td>
				<td><b>이메일</b></td>
				<td><b>가입일</b></td>
				<td><b>상태 </b></td>
				<td> - </td>
			</tr>      
			<c:forEach var="companyList" items="${companyList}">
				<tr>
					<td>${companyList.id}</td>
					<td>${companyList.name}</td>
					<td>${companyList.nic}</td>
					<td>${companyList.email}</td>
					<td>
						<fmt:formatDate value="${companyList.reg}" type="date" dateStyle="short" />
					</td>
					<td>
						<c:if test="${companyList.status == 800}"> 승인대기 
							 <button onclick="openPopup('/admin/companyStatus?id=${companyList.id}')">변경</button>
						</c:if>
						<c:if test="${companyList.status == 888}"> 승인 
							 <button onclick="openPopup('/admin/companyStatus?id=${companyList.id}')">변경</button>
						</c:if>
					</td>
					<td>
						<button type="button" onclick="location.href='/admin/companyDetail?id=${companyList.id}'">상세보기</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

		
</body>
<script>
    function openPopup(url) {
        // Specify the properties of the popup window
        var popupWidth = 600;
        var popupHeight = 400;

        // Calculate the position to center the popup window on the screen
        var left = (screen.width - popupWidth) / 2;
        var top = (screen.height - popupHeight) / 2;

        // Open the popup window
        window.open(url, 'CompanyStatusPopup', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
    }
</script>
 
</html>