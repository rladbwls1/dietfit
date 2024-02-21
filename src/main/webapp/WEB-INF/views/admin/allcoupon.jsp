<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all_coupon</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	//setInterval(alram, 10000);
	function adminCheck(couponId) {
		$.ajax({
			url: "/admin/adminCheck",
			data: {couponId: couponId},
			success: function(chk){
				console.log(chk);
				if(chk.result == '1'){
					$("#"+couponId).text('승인 완료');
					$("#alram").text(chk.msg);
					$("#" + couponId + "1").hide();
	                $("#" + couponId + "2").hide();
				}
			}
		});
		}
	function adminChk(couponId){
		$.ajax({
			url: "/admin/adminCheck2",
			data: {couponId: couponId},
			success: function(e){
				if(e.result == '1'){
					$("#"+couponId).text('승인 거부');
					$("#alram").text(e.msg);
					$("#" + couponId + "1").hide();
	                $("#" + couponId + "2").hide();
				}
			}
		});
       	$("#"+couponId+"1").prop("disabled", true);
       	$("#"+couponId).text('승인 거부');
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
                <li class="breadcrumb-item active" aria-current="page">쿠폰리스트</li>
              </ol>
            </nav>

            <div class="pb-3">
  			<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">쿠폰 요청(<q id="alram">${alram}</q>)</h1>
                        <ol class="breadcrumb mb-4">
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>쿠폰명</th>
											<th>쿠폰 아이디</th>
											<th>쿠폰 기간</th>
											<th>최소 사용 금액</th>
											<th>업체</th>
											<th>다운로드 가능</th>
											<th>발급 인원수</th>
											<th>적용 가능 제품</th>
											<th>승인 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="coupon" items="${couponlist}">
										<tr>
											<td>${coupon.coupon}</td>
											<td>${coupon.couponid}</td>
											<td><fmt:formatDate value="${coupon.createdate}" pattern="yyyy-MM-dd"/> ~ 
												<fmt:formatDate value="${coupon.deletedate}" pattern="yyyy-MM-dd"/></td>
											<td>${coupon.minprice}</td>
											<td>${coupon.companyid}</td>
											<td>${coupon.download}</td>
											<td>${coupon.discount}</td>
											<td>${coupon.boardnums}</td>
											<td>
												<div id="${coupon.couponid}">
													<c:if test="${coupon.admincheck==1}">승인 완료</c:if>		
													<c:if test="${coupon.admincheck==2}">승인 거부</c:if>		
												</div>
												<c:if test="${coupon.admincheck==0}">
													<button type="button" class="btn1" id="${coupon.couponid}1" onclick="adminCheck('${coupon.couponid}');">승인</button>
													<button type="button" class="btn2" id="${coupon.couponid}2" onclick="adminChk('${coupon.couponid}');">거부</button>
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