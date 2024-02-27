<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>Dietfit_Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/resources/css/adminx.css" media="screen" />
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
                <li class="breadcrumb-item"><a href="/dietfit/main" style="text-decoration: none; color: black;">다이어트핏(사용자)</a></li>
                <li class="breadcrumb-item active" aria-current="page" style="color:blue;">다이어트핏(관리자)</li>
              </ol>
            </nav>

            <div class="pb-3">
              <h1>DIETFIT 다이어트 핏</h1>
              <p id="currentDate"></p>
            </div>

            <div class="row">

			<div class="col-md-6 col-lg-3 d-flex">
                <div class="card mb-grid w-100">
                  <div class="card-body d-flex flex-column">
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                         광고 요청
                      </h5>

                      <div class="card-title-sub">
                        ${commCount}
                      </div>
                    </div>

					<a href="/admin/companyList" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">확인</a>
                  </div>
                </div>
              </div>
                            
				<div class="col-md-6 col-lg-3 d-flex">
                <div class="card mb-grid w-100">
                  <div class="card-body d-flex flex-column">
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                         대기중인 판매업체
                      </h5>

                      <div class="card-title-sub">
                        ${companycount800}
                      </div>
                    </div>

					<a href="/admin/companyList" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">확인</a>
                  </div>
                </div>
              </div>
              
              <div class="col-md-6 col-lg-3 d-flex">
                <div class="card border-0 bg-primary text-white text-center mb-grid w-100">
                  <div class="d-flex flex-row align-items-center h-100">
                    <div class="card-icon d-flex align-items-center h-100 justify-content-center">
                      <i data-feather="users"></i>
                    </div>
                    <div class="card-body">
                      <div class="card-info-title">판매업체</div>
                      <h3 class="card-title mb-0">
                        ${companycount888}
                      </h3>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 col-lg-3 d-flex">
                <div class="card border-0 bg-success text-white text-center mb-grid w-100">
                  <div class="d-flex flex-row align-items-center h-100">
                    <div class="card-icon d-flex align-items-center h-100 justify-content-center">
                      <i data-feather="users"></i>
                    </div>
                    <div class="card-body">
                      <div class="card-info-title">회원</div>
                      <h3 class="card-title mb-0">
                        ${membercount}
                      </h3>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
             <div class="col-lg-4">
                <div class="card">
                  <div class="card-header">
                    오늘 총 매출액
                  </div>
                  <div class="card-body">
                    <h4 class="card-title"><fmt:formatNumber value="${price}" type="number" pattern="#,###원"/></h4>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/vendor.js"></script>
    <script src="/resources/js/adminx.js"></script>
    <script>
	    // 현재 날짜를 가져오는 JavaScript 코드
	    var currentDate = new Date();
	    var formattedDate = currentDate.getFullYear() + '-' + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' + ('0' + currentDate.getDate()).slice(-2);
	    document.getElementById('currentDate').innerHTML = formattedDate;
	</script>
  </body>
</html>