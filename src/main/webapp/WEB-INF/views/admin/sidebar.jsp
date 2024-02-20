<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="adminx-sidebar expand-hover push">
        <ul class="sidebar-nav">
          <li class="sidebar-nav-item">
            <a href="/admin/main" class="sidebar-nav-link active">
              <span class="sidebar-nav-icon">
                <i data-feather="home"></i>
              </span>
              <span class="sidebar-nav-name">
                Dietfit-Admin
              </span>
              <span class="sidebar-nav-end">

              </span>
            </a>
          </li>

          <li class="sidebar-nav-item">
            <a href="/admin/commList" class="sidebar-nav-link">
              <span class="sidebar-nav-icon">
                <i data-feather="layout"></i>
              </span>
              <span class="sidebar-nav-name">
                광고 요청
              </span>
              <span class="sidebar-nav-end">
                <span class="badge badge-info">4</span>
              </span>
            </a>
          </li>
          <li class="sidebar-nav-item">
            <a href="/admin/allcoupon" class="sidebar-nav-link">
              <span class="sidebar-nav-icon">
                <i data-feather="layout"></i>
              </span>
              <span class="sidebar-nav-name">
                쿠폰 요청
              </span>
              <span class="sidebar-nav-end">
                <span class="badge badge-info">${alram}</span>
              </span>
            </a>
          </li>

			<!-- 
          <li class="sidebar-nav-item">
            <a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#example" aria-expanded="false" aria-controls="example">
              <span class="sidebar-nav-icon">
                <i data-feather="pie-chart"></i>
              </span>
              <span class="sidebar-nav-name">
                Charts
              </span>
              <span class="sidebar-nav-end">
                <i data-feather="chevron-right" class="nav-collapse-icon"></i>
              </span>
            </a>

            <ul class="sidebar-sub-nav collapse" id="example">
              <li class="sidebar-nav-item">
                <a href="./layouts/charts_chartjs.html" class="sidebar-nav-link">
                  <span class="sidebar-nav-abbr">
                    Ch
                  </span>
                  <span class="sidebar-nav-name">
                    ChartJS
                  </span>
                </a>
              </li>

              <li class="sidebar-nav-item">
                <a href="./layouts/charts_morris.html" class="sidebar-nav-link">
                  <span class="sidebar-nav-abbr">
                    Mo
                  </span>
                  <span class="sidebar-nav-name">
                    Morris
                  </span>
                </a>
              </li>
            </ul>
          </li>
			 -->

          <li class="sidebar-nav-item">
            <a class="sidebar-nav-link collapsed" data-toggle="collapse" href="#navTables" aria-expanded="false" aria-controls="navTables">
              <span class="sidebar-nav-icon">
                <i data-feather="align-justify"></i>
              </span>
              <span class="sidebar-nav-name">
                회원관리
              </span>
              <span class="sidebar-nav-end">
                <i data-feather="chevron-right" class="nav-collapse-icon"></i>
              </span>
            </a>

            <ul class="sidebar-sub-nav collapse" id="navTables">
              <li class="sidebar-nav-item">
                <a href="../admin/mList" class="sidebar-nav-link">
                  <span class="sidebar-nav-abbr">
                    Re
                  </span>
                  <span class="sidebar-nav-name">
                    전체 회원
                  </span>
                </a>
              </li>

              <li class="sidebar-nav-item">
                <a href="../admin/companylist" class="sidebar-nav-link">
                  <span class="sidebar-nav-abbr">
                    Da
                  </span>
                  <span class="sidebar-nav-name">
                    판매자
                  </span>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
</body>
</html>