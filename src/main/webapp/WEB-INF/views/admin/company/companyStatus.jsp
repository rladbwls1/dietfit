<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - company</title>
</head>
<body>
	<h4>등급변경</h4>
	<h5>현재등급 : 
		<c:if test="${companyBasic.status == 800}"> 승인대기 </c:if>
		<c:if test="${companyBasic.status == 888}"> 승인완료 </c:if>
	</h5>
	
	<form action="/admin/companyStatusChange" method="post">
    <select id="status" name="status">
        <c:if test="${companyBasic.status == 800}">
            <option value="888" selected>승인</option>
        </c:if>
        <c:if test="${companyBasic.status == 888}">
            <option value="800" selected>승인대기</option>
        </c:if>
    </select>
    <input type="hidden" name="id" value="${companyBasic.id}"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button type="submit">등급 변경 신청</button>
</form>
<div id="result"></div>
</body>

<script>
$(document).ready(function(){
	$("#companyid").on("click", function(){
		$.ajax({
			url:"/admin/generateCompanyid"
			success:function(a){
				$("result").html(a);
			}
		})
	})
})
</script>
    
</html>