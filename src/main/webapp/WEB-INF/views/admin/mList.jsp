<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberList</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/resources/css/adminx.css" media="screen" />
    <style>
    	#memList{
    		width: 100%;
    		border-radius: 5px;
    		background-color: white;
    		border-collapse: collapse;
    		border: 1px solid lightgray;
    		border-right: none;
    		border-left: none;
    	}
    	#memList td, #memList th{
    		border-left: none;
    		border-right: none;
    		padding: 5px 12px;
    	}
    	#memList th{
    		background-color: 
    	}
    </style>
</head>
<body>
   <div class="adminx-container">
      <!-- nav 자리 -->
      <jsp:include page="top_bar.jsp"/>
      <!-- expand-hover push -->
      <!-- Sidebar -->
      <jsp:include page="sidebar.jsp"/>
      <!-- Sidebar End -->

      <!-- adminx-content-aside -->
      <div class="adminx-content">
        <!-- <div class="adminx-aside">

        </div> -->

        <div class="adminx-main-content">
          <div class="container-fluid">
            <!-- BreadCrumb -->
            <nav aria-label="breadcrumb" role="navigation">
              <ol class="breadcrumb adminx-page-breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">사용자</li>
              </ol>
            </nav>

            <div class="pb-3">
              <h1>사용자 관리</h1>
              				<h5>총 ${count}명</h5>
				<table id="memList" border="1">
					<tr>
						<th>번호</th>
						<th>아이디</th>
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
              
            </div>

            <div class="row">
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="/resources/js/vendor.js"></script>
<script src="/resources/js/adminx.js"></script>
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