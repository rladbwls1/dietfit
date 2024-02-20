<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            </div>

            <div class="row">

              <div class="col-md-6 col-lg-3 d-flex">
                <div class="card mb-grid w-100">
                  <div class="card-body d-flex flex-column">
                    <div class="d-flex justify-content-between mb-3">
                      <h5 class="card-title mb-0">
                        오늘의 특가
                      </h5>

                      <div class="card-title-sub">
                        
                        <p id="currentDate"></p>
                      </div>
                    </div>
                    	<a href="/member/discount" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">today discount</a>
                    	<!-- 
                    <div class="progress mt-auto">
                      <div class="progress-bar" role="progressbar" style="width: 60%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    	 -->
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

					<a href="/admin/companyList" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">today discount</a>
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
              <div class="col-lg-8">
                <div class="card">
                  <div class="card-header d-flex justify-content-between align-items-center">
                    <div class="card-header-title">Featured</div>

                    <nav class="card-header-actions">
                      <a class="card-header-action" data-toggle="collapse" href="#card1" aria-expanded="false" aria-controls="card1">
                        <i data-feather="minus-circle"></i>
                      </a>
                      
                      <div class="dropdown">
                        <a class="card-header-action" href="#" role="button" id="card1Settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i data-feather="settings"></i>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="card1Settings">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </div>

                      <a href="#" class="card-header-action">
                        <i data-feather="x-circle"></i>
                      </a>
                    </nav>
                  </div>
                  <div class="card-body collapse show" id="card1">
                    <h4 class="card-title">Special title treatment</h4>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="card">
                  <div class="card-header">
                    Featured
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Special title treatment</h4>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
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