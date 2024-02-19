<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta charset="UTF-8">
    <title>Dietfit(Admin) - companyList</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="/resources/css/adminx.css" media="screen" />
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </head>
  <body>
  <body style="background-color: #f6f9fa !important;">
    <div class="adminx-container">
      <!-- Header -->
      <jsp:include page="/WEB-INF/views/admin/top_bar.jsp"/>
      <!-- // Header -->

      <!-- expand-hover push -->
	  <jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
      <!-- Main Content -->
      <div class="adminx-content">
        <div class="adminx-main-content">
          <div class="container-fluid">
            <!-- BreadCrumb -->
            <nav aria-label="breadcrumb" role="navigation">
              <ol class="breadcrumb adminx-page-breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/main">Home</a></li>
                <li class="breadcrumb-item"><a href="/admin/companylist">판매자</a></li>
              </ol>
            </nav>

            <div class="pb-3">
              <h1>판매자 관리</h1>
            </div>
            <c:if test="${companycount == 0}">
            	<div class="row">
              <div class="col">
                <div class="alert alert-warning" role="alert">
                  <strong>판매자가 없습니다.</strong><br />
                </div>
              </div>
            </div>
			</c:if>
			<c:if test="${companycount > 0}">
            <div class="row">
              <div class="col">
                <div class="alert alert-warning" role="alert">
                  <strong>총 ${companycount}개 업체입니다</strong> &nbsp; <button type="button" class="btn btn-light" onclick="window.open('/admin/allProduct', 'allProduct','width=1000,height=900,location=no,status=no,scrollbars=yes')">전체상품보기</button>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="card mb-grid">
                  <div class="table-responsive-md">
                    <table class="table table-actions table-striped table-hover mb-0" data-table>
                      <thead>
                        <tr>
                          <th scope="col">아이디</th>
                          <th scope="col">이름</th>
                          <th scope="col">닉네임</th>
                          <th scope="col">이메일</th>
                          <th scope="col">가입일</th>
                          <th scope="col">-</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="companyList" items="${companyList}">
                        <tr>
                          <td>${companyList.id}</td>
						  <td>${companyList.name}</td>
						  <td>${companyList.nic}</td>
                          <td>${companyList.email}</td>
                          <td>
							<fmt:formatDate value="${companyList.reg}" type="date" dateStyle="short" />
						  </td>
						  <td>
							<c:if test="${companyList.status == 800}"> 승인대기 
								 <button class="btn btn-sm btn-danger" onclick="openPopup('/admin/companyStatus?id=${companyList.id}')">변경</button>
								 <button class="btn btn-sm btn-primary" type="button" onclick="window.open('/admin/companyDetail?id=${companyList.id}', 'companydetail', 'width=700,height=400,location=no,status=no,scrollbars=yes') ">상세보기</button>
							</c:if>
							<c:if test="${companyList.status == 888}"> 승인 
								 <button class="btn btn-sm btn-danger" onclick="openPopup('/admin/companyStatus?id=${companyList.id}')">변경</button>
								 <button class="btn btn-sm btn-primary" type="button" onclick="window.open('/admin/companyDetail?id=${companyList.id}', 'companydetail', 'width=700,height=400,location=no,status=no,scrollbars=yes') ">상세보기</button>
							</c:if>
						  </td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </c:if>
          </div>
        </div>
      </div>
      <!-- // Main Content -->
    </div>
                      

    <!-- If you prefer jQuery these are the required scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script src="/resources/js/vendor.js"></script>
	<script src="/resources/js/adminx.js"></script>

   <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <script>
      $(document).ready(function() {
        var table = $('[data-table]').DataTable({
          "columns": [
            null,
            null,
            null,
            null,
            null,
            { "orderable": false }
          ]
        });

        /* $('.form-control-search').keyup(function(){
          table.search($(this).val()).draw() ;
        }); */
      });
      
      //승인변경 팝업
      function openPopup(url) {
        // Specify the properties of the popup window
        var popupWidth = 600;
        var popupHeight = 400;

        // Calculate the position to center the popup window on the screen
        var left = (screen.width - popupWidth) / 2;
        var top = (screen.height - popupHeight) / 2;

        // Open the popup window
        window.open(url, 'CompanyStatusPopup', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
    }
    </script>
  </body>
</html>