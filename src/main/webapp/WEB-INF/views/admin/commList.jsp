<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/adminx.css" media="screen" />
<script src="/resources/js/jquery-3.7.1.min.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style>
	.btn1{
		padding: 5px 15px;
   		border: 1px solid #007bff;
   		border-radius: 5px;
   		background-color: #007bff;
   		color: white;
	}
	.btn2{
		padding: 5px 15px;
   		border: 1px solid gray;
   		border-radius: 5px;
   		background-color: white;
   		color: gray;
	}
	#datatablesSimple{
		text-align: center;
	}
</style>
</head>
<script>
	function adminCheck(num, check){
		$.ajax({
			url: "/admin/adminChk",
			data: {num: num,
					admin: check},
			success: function(chk){
				$("#" + num + "1").hide();
                $("#" + num + "2").hide();
                if(check == 1){
	                $("#"+num).text("승인 완료");
                }else{
	                $("#"+num).text("승인 거부");
                }
			}
		});
	}
</script>
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
  			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">광고 요청<i id="alram">(${alram})</i></h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <h2>광고 요청<i id="alram">(${alram})</i></h2>	
							<h4>총 ${count} 쿠폰</h4>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>no</th>
											<th>광고명</th>
											<th>회사 아이디</th>
											<th>광고 이미지</th>
											<th>광고 시작날짜</th>
											<th>광고 종료날짜</th>
											<th>승인 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="comm" items="${commlist}">
										<tr>
											<td>${comm.num}</td>
											<td>${comm.comname}</td>
											<td>${comm.companyid}</td>
											<td><img src="/resources/comimg/${comm.comfile}"/></td>
											<td><fmt:formatDate value="${comm.startdate}" pattern="yyyy-MM-dd"/></td> 
											<td><fmt:formatDate value="${comm.enddate}" pattern="yyyy-MM-dd"/></td>
											<td>
												<div id="${comm.num}">
													<c:if test="${comm.admincheck==1}">승인 완료</c:if>
													<c:if test="${comm.admincheck==2}">승인 거부</c:if>
												</div>
												<c:if test="${comm.admincheck==0}">
												<button type="button" class="btn1" id="${comm.num}1" onclick="adminCheck('${comm.num}',1);">승인</button>
												<button type="button" class="btn2" id="${comm.num}2" onclick="adminCheck('${comm.num}',2);">거부</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>	
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/vendor.js"></script>
    <script src="/resources/js/adminx.js"></script>        
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/resources/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="/resources/js/datatables-simple-demo.js"></script>
</body>
</html>