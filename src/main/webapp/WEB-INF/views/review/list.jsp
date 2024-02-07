<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
</head>
<body>
    <table>
        <c:forEach var="reviewImage" items="${reviewImages}"> 
<tr>
    <td>${reviewImage.num}</td>
    <td>${reviewImage.id}</td>
    <td>상품</td>
    <td>${reviewImage.content}</td>
    <td>${reviewImage.starscore}</td>
    <td>
        <c:choose>
            <c:when test="${not empty reviewImage.attatch}">
                <img src="/resources/review/${reviewImage.attatch}"/>
            </c:when>
            <c:otherwise>
                <!-- 이미지가 없을 경우 보여줄 내용, 예: 기본 이미지 또는 텍스트 -->
                No Image Available
            </c:otherwise>
        </c:choose>
    </td>
</tr>
</c:forEach>

    </table>
</body>
</html>
