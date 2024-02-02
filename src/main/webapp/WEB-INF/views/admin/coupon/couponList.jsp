<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${couponcount == 0 }">
		<h5> 다운로드 가능 한 쿠폰이 없습니다.</h5>
	</c:if>
	<c:if test="${couponcount > 0 }">
		<table>
			<thead>
				<tr>
					<th>쿠폰명</th>
					<th>쿠폰 기간</th>
					<th>최소 사용 금액</th>
					<th>업체</th>
					<th>다운로드 가능</th>
					<th>발급 인원수</th>
					<th>적용 가능 제품</th>
					<th>사용등급</th>
					<th>다운로드 </th>
				</tr>
				
				<c:forEach var="coupon" items="${couponList}">
					<td>${coupon.coupon}</td>
					<td><fmt:formatDate value="${coupon.createdate}" pattern="yyyy-MM-dd"/> ~ 
						<fmt:formatDate value="${coupon.deletedate}" pattern="yyyy-MM-dd"/></td>
					<td>${coupon.minprice}</td>
					<td>${coupon.companyid}</td>
					<td>${coupon.download}</td>
					<td>${coupon.discount}</td>
					<td>${coupon.boardnums}</td>
					<td>${coupon.onstatus}</td>
					<td>
						<form>
							<button type="submit">다운로드</button>
						</form>
					</td>
				</c:forEach>
			</thead>
		</table>
	</c:if>
</body>
</html>