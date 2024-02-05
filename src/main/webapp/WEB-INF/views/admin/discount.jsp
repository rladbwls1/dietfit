<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>discount</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<h2>오늘의 특가</h2>
    <c:if test="${not empty discount}">
	<div class="container">
	    <ul class="list-unstyled row">
	        <c:forEach var="discount" items="${discount}">
	            <li class="col-md-3">
	                <div><img style="width:200px; height:200px;" src="${discount.imagePath}"/></div>
	                <div>${discount.companyid}</div>
	                <div>${discount.boardname}</div>
	                <div style="text-decoration: line-through;">
	                	<fmt:formatNumber value="${discount.price}" type="number" pattern="#,###원"/>
	                </div>
	                <div>
	                	<fmt:formatNumber value="${discount.price - (discount.price * (discount.sale / 100))}" type="number" pattern="#,###원"/>
	                </div>	
	            </li>
	        </c:forEach>
	    </ul>
	</div>
    </c:if>
	    <c:if test="${empty discount}">
	    	<h2>오늘의 특가 상품이 존재하지 않습니다!</h2>
	    </c:if>    
  <label id="countdown"></label>

  <script>
  $(document).ready(function() {
	    var currentTime = new Date();
	    var countdownEndTime = new Date(currentTime);
	    countdownEndTime.setHours(24, 0, 0, 0);

	    function updateCountdown() {
	      currentTime = new Date();
	      var remainingTime = countdownEndTime - currentTime;

	      var hours = Math.floor(remainingTime / (60 * 60 * 1000));
	      var minutes = Math.floor((remainingTime % (60 * 60 * 1000)) / (60 * 1000));
	      var seconds = Math.floor((remainingTime % (60 * 1000)) / 1000);
			console.log(hours);
	      $("label").html(hours+":" +minutes+":"+ seconds);
	    }

	    setInterval(updateCountdown, 1000);
	  });
  </script>
</body>
</html>