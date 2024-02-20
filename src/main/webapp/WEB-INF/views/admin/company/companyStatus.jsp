<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - company</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title"><b>등급 변경</b></h4>
                <p>현재 등급:
                    <c:choose>
                        <c:when test="${companyBasic.status == 800}"><mark>승인대기</mark></c:when>
                        <c:when test="${companyBasic.status == 888}"><mark>승인완료</mark></c:when>
                    </c:choose>
                </p>

                <form action="/admin/companyStatusChange" method="post" class="form-inline justify-content-center mt-3">
                    <div class="form-group mx-sm-3 mb-2">
                        <select id="status" name="status" class="form-control">
                            <c:if test="${companyBasic.status == 800}">
                                <option value="888">승인</option>
                            </c:if>
                            <c:if test="${companyBasic.status == 888}">
                                <option value="800">승인대기</option>
                            </c:if>
                        </select>
                    </div>
                    <input type="hidden" name="id" value="${companyBasic.id}" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="col text-center">
				        <button type="submit" class="btn btn-sm btn-danger ">등급 변경 신청</button>
			        </div>
                </form>
            </div>
        </div>
    </div>
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