<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<script type="text/javascript">
		    window.onload = function() {
		        var message = "${successMessage}";
		        if(message) {
		            alert(message);
		        }
		    }
		</script>
		<style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        img {
            width: 100px;
            height: auto;
        }
    </style>
	</head>
	
	<body>
		<h1>광고 신청내역</h1>
		 <a href="seller/commercail?companyid=${companyid}"><button>광고 신청하기</button></a>
		<table>
			<tr>
				<td>숫자</td>
				<td>광고명</td>
				<td>광고 시작일</td>
				<td>광고 종료일</td>
				<td>광고 이미지</td>
				<td>관리자 승인</td>
			</tr>
			<c:forEach var="commercail" items="${commercail}">
			<tr>
				<td>${commercail.num}</td>
				<td>${commercail.comname}</td>
				<td><fmt:formatDate value="${commercail.startdate}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${commercail.enddate}" pattern="yyyy-MM-dd"/></td>
				<td>
					<img src="/resources/comimg/${commercail.comfile}"/>
				</td>
				<td>
					<c:choose>
	                     <c:when test="${commercail.admincheck == 0}">
	                         접수 완료
	                         <form action="commdelect" method="post">
	                         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                         	<input type="hidden" name="companyid" value="${companyid}">
								<input type="hidden" name="num" value="${commercail.num}">
								<input type="hidden" name="comfile" value="${commercail.comfile}">
					            <button type="submit" name="action">취소하기</button>
					        </form>
					        <form action="commupdate" method="post">
					        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					        	<input type="hidden" name="companyid" value="${companyid}">
								<input type="hidden" name="num" value="${commercail.num}">
								<input type="hidden" name="comfile" value="${commercail.comfile}">
					            <button type="submit" name="action">수정하기</button>
					        </form>
	                     </c:when>
	                     <c:when test="${commercail.admincheck == 1}">
	                         승인 완료
	                     </c:when>
	                     <c:when test="${commercail.admincheck == 2}">
	                         승인 거부 
	                     </c:when>
	                     <c:when test="${commercail.admincheck == 3}">
	                         취소 접수
	                     </c:when>
	                     <c:when test="${commercail.admincheck == 4}">
	                         취소 완료 
	                     </c:when>
                	</c:choose>
				</td>	
			</tr>
			</c:forEach>
		</table>
	</body>
</html>