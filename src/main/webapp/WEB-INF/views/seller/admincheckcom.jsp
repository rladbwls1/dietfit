<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<body>
<div class="container py-5">
    <h1 class="mb-0">⭐Discover New Flavors⭐<h1>
    <div class="owl-carousel vegetable-carousel justify-content-center">
        <c:forEach items="${cdto}" var="cdto">
            <div class="border border-primary rounded position-relative vesitable-item">
                <div class="vesitable-img">
                    <img src="/resources/comimg/${cdto.comfile}" class="img-fluid w-100 rounded-top" sytle="width : ">
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
