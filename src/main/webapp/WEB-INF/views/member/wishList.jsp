<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="/resources/js/member2.js"></script>
<meta charset="UTF-8">
<title>관심상품</title>
<!-- template -->
<!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/resources/css/style.css" rel="stylesheet">
        
        <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
      		integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>

<!-- table -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/navbar.jsp"/>
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="d-grid gap-2 col-6 mx-auto">
			<h1>관심상품</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			</div>
		</div>
	</div>
	<div class="container-fluid fruite py-5">
	<c:if test="${empty wishList }">
		관심상품이 없습니다.	
	</c:if>
	
	<c:if test="${!empty wishList }">
		<div class="d-grid gap-2 col-6 mx-auto">
			<div class="card text-center">
				<div class="card-header">
				    <ul class="nav nav-tabs card-header-tabs">
				      <li class="nav-item">
				        <a class="nav-link" href="/member/cartList">일반배송</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="/member/Rdelivery">정기배송</a>
				      </li>
				      <li class="nav-item">
				      	<a class="nav-link active" aria-current="true" href="#">관심상품</a>
				      </li>
				    </ul>
				  </div>
				  <div class="card-body">
					<c:choose>
						<c:when test="${checkedFolder=='전체' }">
							<button type="button" class="btn btn-outline-primary" >전체</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-primary" onclick="chooseFolder('전체')" style="color:gray">전체</button>
						</c:otherwise>
					</c:choose>
					<c:forEach var="folder" items="${folder }">
						<c:if test="${!folder.contains(',') }">
						<c:choose>
							<c:when test="${checkedFolder==folder }">
								<button type="button" class="btn btn-outline-primary" >${folder}</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-outline-primary" onclick="chooseFolder('${folder}')" style="color:gray">${folder}</button>
							</c:otherwise>
						</c:choose>
						</c:if>
					</c:forEach>
					<hr />
				</div>
				
				  <table>
				  	<thead>
						<tr>
							<th><input type="checkbox" name="chk_all" id="chk_all" onclick="checkAll()" value="all"/></th>
							<th>상품명</th>
							<th>이미지</th>
						</tr>
					</thead>
					
					<tbody>
						<c:set var="i" value="0"/>
						<c:forEach var="wish" items="${wishList }">
							<c:if test="${checkedFolder=='전체' }">
								<tr>
									<td>
										<input type="checkbox" name="num" onclick="updateCheckAll()" value="${wish.num }">
									</td>
									<td>
										<a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
										onclick="getProductCodeANDtoDetail('${wish.product}')">${wish.product }</a>
									</td>
									<td>
										<a href="javascript:void(0)" onclick="getProductCodeANDtoDetail('${wish.product}')"><img src="${imgPaths[i] }" width="100"/></a>
									</td>
								</tr>
							</c:if>
							<c:if test="${checkedFolder!='전체'&&wish.folder.contains(checkedFolder) }">
								<tr>
									<td>
										<input type="checkbox" name="num" onclick="updateCheckAll()" value="${wish.num }">
									</td>
									<td>
										<a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
										onclick="getProductCodeANDtoDetail('${wish.product}')">${wish.product }</a>
									</td>
									<td>
										<a href="javascript:void(0)" onclick="getProductCodeANDtoDetail('${wish.product}')"><img src="${imgPaths[i] }" width="100"/></a>
									</td>
								</tr>
							</c:if>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</tbody>
				</table>
					<!-- 페이지 -->
			    <table>
			    <c:if test="${count>0 }">
					<c:if test="${endPage > pageCount }">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
					<tr><td>
			       	<c:if test="${startPage > 10 }">
			                   <a href="javascript:window.location='/member/wishList?pageNum=${i-pageSize}&checkedFolder=${checkedFolder}'" style="text-decoration-line : none; color:black;" >이전</a>
			       	</c:if>
			       
			       	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			       		<c:choose>
			       			<c:when test="${i==currentPage }">
			                        <a href="javascript:window.location='/member/wishList?pageNum=${i}&checkedFolder=${checkedFolder}'" style="text-decoration-line : none; color:red;">${i}</a>
			       			</c:when>
			       			<c:otherwise>
			                        <a href="javascript:window.location='/member/wishList?pageNum=${i}&checkedFolder=${checkedFolder}'" style="text-decoration-line : none; color:black;">${i}</a>
			       			</c:otherwise>
			       		</c:choose>
			       	</c:forEach>
			      		<c:if test="${endPage < pageCount }">
			                   <a href="javascript:window.location='/member/wishList?pageNum=${i+pageSize}&checkedFolder=${checkedFolder}'" style="text-decoration-line : none; color:black;" >다음</a>
			      		</c:if>
			      	</td></tr>	
			    </c:if>
			    </table>
					<!-- 페이지 -->
				
				<div class = "card-body">
					<hr />
					<button type="button" class="btn btn-outline-danger" onclick="deleteSelectedItems('${checkedFolder}')">선택 상품 삭제</button>
					<button type="button" class="btn btn-outline-danger" onclick="cartSelectedItems()">선택 상품 장바구니담기</button>
					<c:if test="${checkedFolder!='전체' }">
						<button type="button" class="btn btn-outline-danger" onclick="moveSelectedItems('${checkedFolder}')">폴더 변경하기</button>
					</c:if>
				</div>
			</div>
		</div>		
	</c:if>
	</div>
</body>

</html>

