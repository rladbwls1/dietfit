<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>판매자 관리페이지</title>
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <style>
		    .form-container {
		        max-width: 600px;
		        margin: 0 auto;
		        padding: 20px;
		        background-color: #f9f9f9;
		        border: 1px solid #ddd;
		        border-radius: 5px;
		    }
		
		    .form-container form {
		        display: flex;
		        flex-direction: column;
		    }
		
		    .form-container .row {
		        display: flex;
		        margin-bottom: 10px;
		    }
		
		    .form-container .column {
		        flex: 1;
		        margin-right: 10px;
		    }
		
		    .form-container label {
		        font-weight: bold;
		        margin-bottom: 5px;
		        display: block;
		    }
		
		    .form-container input[type="text"],
		    .form-container input[type="number"],
		    .form-container textarea,
		    .form-container input[type="date"],
		    .form-container select {
		        padding: 8px;
		        border: 1px solid #ccc;
		        border-radius: 5px;
		        width: 100%;
		    }
		
		    .form-container input[type="file"] {
		        margin-top: 5px;
		    }
		
		    .form-container input[type="submit"] {
		        padding: 10px;
		        background-color: #355FAD;
		        color: white;
		        border: none;
		        border-radius: 5px;
		        cursor: pointer;
		        width: 100%;
		        align-self: flex-end;
		    }
		
		    /* Prevent horizontal overflow */
		    body {
		        overflow-x: hidden;
		    }
		    .preview-image {
		        width: 100px;
		        height: auto;
		    }
		    #thumimgbutton{
		    	padding: 8px;
		        background-color: #355FAD;
		        color: white;
		        border: none;
		        border-radius: 5px;
		        cursor: pointer;
		        width: 47%;
		    }
		    #detailimgbutton{
		    	padding: 8px;
		        background-color: #355FAD;
		        color: white;
		        border: none;
		        border-radius: 5px;
		        cursor: pointer;
		        width: 47%;
		        align-self: flex-end;
		        margin-top : -40px;	
		    }
		</style>



    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/seller/home">판매자 관리 페이지</a>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/dietfit/main">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리메뉴</div>
                            <a class="nav-link" href="/seller/modify">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                정보수정
                            </a>
                            <a class="nav-link" href="/seller/productdiscount">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                상품 할인 조정
                            </a>
                            <a class="nav-link" href="/seller/coupon/request">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                쿠폰 요청
                            </a>
                            <a class="nav-link" href="/seller/sellerchatlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품 문의 목록
                            </a>
                            <a class="nav-link" href="/seller/order">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품 주문 목록
                            </a>
                            <a class="nav-link" href="/seller/store">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품목록
                            </a>
                            <a class="nav-link" href="/seller/sales">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                정산
                            </a>
                            <a class="nav-link" href="/seller/commercailhome">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                광고 신청
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품 등록</h1>
					    <div class="form-container">
					        <form action="/seller/UpdatePro" method="post" enctype="multipart/form-data">
					        	<input type="hidden" name="num" value="${product.num}">
						    	<input type="hidden" name="companyid" value="${product.companyid}">
							    	<div class="row">
								    	<div class="column">
							                <label for="bigCategory">큰 카테고리</label>
							                <select id="bigCategory" onchange="showSmallCategory()">
									            <option value="====="   >=====</option>
									            <option value="식사" <c:if test="${product.category.substring(0,1)=='1' }"> selected </c:if>     >식사</option>
									            <option value="식사대용" <c:if test="${product.category.substring(0,1)=='2' }"> selected </c:if>   >식사대용</option>
									            <option value="간식" <c:if test="${product.category.substring(0,1)=='3' }"> selected </c:if>   >간식</option>
									            <option value="음료" <c:if test="${product.category.substring(0,1)=='4' }"> selected </c:if>  >음료</option>
									        </select>	
							            </div>
								        <div class="column"> 
									        <div id="smallCategory">
									        	<label for="category">작은 카테고리</label>
								            	<select name="category" id="category">
								                        <option value="11" ${product.category == '11' ? 'selected' : ''}>도시락</option>
								                        <option value="12" ${product.category == '12' ? 'selected' : ''}>밥</option>
								                        <option value="13" ${product.category == '13' ? 'selected' : ''}>죽</option>
								                        <option value="14" ${product.category == '14' ? 'selected' : ''}>면</option>
								                        <option value="15" ${product.category == '15' ? 'selected' : ''}>밀</option>
								                        <option value="21" ${product.category == '21' ? 'selected' : ''}>샐러드</option>
													    <option value="22" ${product.category == '22' ? 'selected' : ''}>닭가슴살</option>
													    <option value="23" ${product.category == '23' ? 'selected' : ''}>가공품(핫바/소시지/핫도그)</option>
													    <option value="24" ${product.category == '24' ? 'selected' : ''}>분식,만두</option>
													    <option value="25" ${product.category == '25' ? 'selected' : ''}>식재료</option>
													    <option value="26" ${product.category == '26' ? 'selected' : ''}>계란</option>
													    <option value="29" ${product.category == '29' ? 'selected' : ''}>기타</option>
								                        <option value="31" ${product.category == '31' ? 'selected' : ''}>쿠키</option>
													    <option value="32" ${product.category == '32' ? 'selected' : ''}>초콜릿</option>
													    <option value="33" ${product.category == '33' ? 'selected' : ''}>떡</option>
													    <option value="34" ${product.category == '34' ? 'selected' : ''}>빵</option>
													    <option value="35" ${product.category == '35' ? 'selected' : ''}>구황작물</option>
													    <option value="36" ${product.category == '36' ? 'selected' : ''}>프로틴바,견과류</option>
													    <option value="39" ${product.category == '39' ? 'selected' : ''}>기타</option>
								                        <option value="41" ${product.category == '41' ? 'selected' : ''}>쉐이크</option>
													    <option value="42" ${product.category == '42' ? 'selected' : ''}>주스</option>
													    <option value="43" ${product.category == '43' ? 'selected' : ''}>티종류</option>
													    <option value="44" ${product.category == '44' ? 'selected' : ''}>탄산수</option>
													    <option value="49" ${product.category == '49' ? 'selected' : ''}>기타</option>
							                    </select>
									       	</div>
							            </div>
									</div>		
								
									<div class="row">
							            <div class="column">
							                <label for="boardname">게시글명</label>
							                <input type="text" name="boardname" value = "${product.boardname}" required>
							            </div>
							        </div>
							        <div class="row">
							        	<div class="column">
							                <label for="product">상품명</label>
							                <input type="text" name="product" value = "${product.product}" required>
							            </div>
							        </div>
								 
							        <div class="row">
							            <div class="column">
							                <label for="price">가격</label>
							                <input type="number" name="price" value = "${product.price}" required>
							            </div>
							            <div class="column">
							                <label for="stock">재고</label>
							                <input type="number" name="stock" value = "${product.stock}" required>
							            </div>
							        </div>
						        
							        <div class="row">
							            <div class="column">
							                <label for="category2">임의 번호</label>
							                <input type="number" name="category2" value = "${product.category2}" required>
							            </div>
							            <div class="column">
							                <label for="flavor">맛</label>
							                <select name="flavor" id="flavor">
											    <option value="00" ${product.flavor == '00' ? 'selected' : ''}>선택없음</option>
											    <option value="10" ${product.flavor == '10' ? 'selected' : ''}>매콤한 맛 (청양고추,불닭)</option>
											    <option value="11" ${product.flavor == '11' ? 'selected' : ''}>짜장맛</option>
											    <option value="12" ${product.flavor == '12' ? 'selected' : ''}>닭고기맛</option>
											    <option value="13" ${product.flavor == '13' ? 'selected' : ''}>소고기맛</option>
											    <option value="14" ${product.flavor == '14' ? 'selected' : ''}>김치</option>
											    <option value="15" ${product.flavor == '15' ? 'selected' : ''}>어니언(양파)</option>
											    <option value="16" ${product.flavor == '16' ? 'selected' : ''}>오트</option>
											    <option value="17" ${product.flavor == '17' ? 'selected' : ''}>초코</option>
											    <option value="18" ${product.flavor == '18' ? 'selected' : ''}>바나나</option>
											    <option value="19" ${product.flavor == '19' ? 'selected' : ''}>견과</option>
											    <option value="20" ${product.flavor == '20' ? 'selected' : ''}>녹차/말차</option>
											    <option value="21" ${product.flavor == '21' ? 'selected' : ''}>카레맛</option>
											    <option value="22" ${product.flavor == '22' ? 'selected' : ''}>깻잎</option>
											    <option value="23" ${product.flavor == '23' ? 'selected' : ''}>바베큐</option>
											    <option value="24" ${product.flavor == '24' ? 'selected' : ''}>후추</option>
											    <option value="25" ${product.flavor == '25' ? 'selected' : ''}>데리야끼</option>
											    <option value="26" ${product.flavor == '26' ? 'selected' : ''}>갈비</option>
											    <option value="27" ${product.flavor == '27' ? 'selected' : ''}>훈제</option>
											    <option value="28" ${product.flavor == '28' ? 'selected' : ''}>칠리</option>
											    <option value="29" ${product.flavor == '29' ? 'selected' : ''}>탄두리</option>
											    <option value="30" ${product.flavor == '30' ? 'selected' : ''}>마늘</option>
											    <option value="31" ${product.flavor == '31' ? 'selected' : ''}>단호박</option>
											    <option value="32" ${product.flavor == '32' ? 'selected' : ''}>마요</option>
											    <option value="33" ${product.flavor == '33' ? 'selected' : ''}>그외 빨간양념</option>
											    <option value="34" ${product.flavor == '34' ? 'selected' : ''}>그외 갈색양념</option>
											    <option value="35" ${product.flavor == '35' ? 'selected' : ''}>그외 기타양념</option>
											    <option value="36" ${product.flavor == '36' ? 'selected' : ''}>기타</option>
											  </select> 
							            </div>
						        	</div>
						
							        <div class="row">
							            <div class="column">
										    <label for="detail">설명</label>
										    <textarea name="detail" required>${product.companyid}${product.category}${product.category2}${product.flavor}${product.detail}</textarea>
										</div>
							        </div>
						        
							        <div class="row">
							            <div class="column">
							                <label for="expiry">유통기한</label>
							                <input type="date" name="expiry" required 
							                value="<fmt:formatDate value='${product.expiry}' pattern='yyyy-MM-dd' />">
							            </div>
							            
							            <div class="column">
							                <label for="delivery">배송정보</label>
							                <select name="delivery" id="delivery">
							                    <option value="0" ${product.delivery == '0' ? 'selected' : ''}>일반배송, 정기배송</option>
								                <option value="1" ${product.delivery == '1' ? 'selected' : ''}>일반배송</option>
							                </select>
							            </div>
							        </div>		
						        
							        <div class="row">
								        <div class="column">
								        	<div id="thumbnailSection">
											    <c:forEach items="${thumimages}" var="thumbImg">
												    <div class="image-wrapper" id="thumbnailWrapper${thumbImg.num}">
												        <input type="hidden" name="thumfileName" value="${thumbImg.fileName}">
												        <input type="hidden" name="thumnum" value="${thumbImg.num}">
												    </div>
												</c:forEach>
											</div>
										</div>	
							        	
							        	<div class="column">
							        		<div id="attachmentsSection">
											    <c:forEach items="${images}" var="img">
												    <div class="image-wrapper" id="imageWrapper${img.num}">
												        <input type="hidden" name="imgfileName" value="${img.fileName}">
												        <input type="hidden" name="imgnum" value="${img.num}">
												    </div>
												</c:forEach>
											</div>
							        	</div>	
						        	</div>
						        <input type="submit" value="수정">
					    	</form>
					    	<br>
					    	<form method="post">
							    <input type="hidden" name="companyid" value="${product.companyid}">
							    <input type="hidden" name="num" value="${product.num}">
							    <input type="hidden" name="isfile" value="${product.isfile}">
							    <input type="hidden" name="category" value="${product.category}">
						        <input type="hidden" name="category2" value="${product.category2}">
						        <input type="hidden" name="flavor" value="${product.flavor}">
						    	<button type="button" id="thumimgbutton" onclick="openthumFormPopup('${product.num}',
						    	'${product.companyid}','${product.isfile}','${product.category}','${product.category2}',
						    	'${product.flavor}');">썸네일 수정</button>
							</form>
							<form method="post">
							    <input type="hidden" name="companyid" value="${product.companyid}">
							    <input type="hidden" name="num" value="${product.num}">
							    <input type="hidden" name="isfile" value="${product.isfile}">
							    <input type="hidden" name="category" value="${product.category}">
						        <input type="hidden" name="category2" value="${product.category2}">
						        <input type="hidden" name="flavor" value="${product.flavor}">
						    	<button type="button" id="detailimgbutton" onclick="opendetailFormPopup('${product.num}',
						    	'${product.companyid}','${product.isfile}','${product.category}','${product.category2}',
						    	'${product.flavor}');">이미지 수정</button>
							</form>
                    	</div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        
        <script>
		    $(document).ready(function() {
		        // 이미지 삭제 버튼 클릭 이벤트
		        $('.delete-img').click(function() {
		            var wrapperId = $(this).data('wrapper');
		            $('#' + wrapperId).remove(); // 이미지 래퍼 요소를 제거합니다.
		        });
		
		        // 폼 제출 전 처리
		        $('form').submit(function(e) {
		            // 삭제된 이미지에 대해 서버에 알리기 위해 input 필드를 추가합니다.
		            $('.image-wrapper').each(function() {
		                if ($(this).css('display') === 'none') {
		                    var deletedImageName = $(this).find('input[name="imgfileName"]').val();
		                    var input = $('<input>')
		                        .attr('type', 'hidden')
		                        .attr('name', 'deletedImages')
		                        .val(deletedImageName);
		                    $('form').append(input);
		                }
		            });
		        });
		    });
		    
		</script>
	     <script>
	        function showSmallCategory() {
	            var bigCategory = document.getElementById("bigCategory");
	            var smallCategory = document.getElementById("smallCategory");
	            var selectedBigCategory = bigCategory.value;
	            var smallCategoryOptions = "";

	            if (selectedBigCategory === "식사") {
	                smallCategoryOptions = `
	                    <select name="category">
	                        <option value="11" ${product.category == '11' ? 'selected' : ''}>도시락</option>
	                        <option value="12" ${product.category == '12' ? 'selected' : ''}>밥</option>
	                        <option value="13" ${product.category == '13' ? 'selected' : ''}>죽</option>
	                        <option value="14" ${product.category == '14' ? 'selected' : ''}>면</option>
	                        <option value="15" ${product.category == '15' ? 'selected' : ''}>밀</option>
	                    </select>`;
	            } else if (selectedBigCategory === "식사대용") {
	            	smallCategoryOptions = `
	                    <select name="category">
		            		<option value="21" ${product.category == '21' ? 'selected' : ''}>샐러드</option>
						    <option value="22" ${product.category == '22' ? 'selected' : ''}>닭가슴살</option>
						    <option value="23" ${product.category == '23' ? 'selected' : ''}>가공품(핫바/소시지/핫도그)</option>
						    <option value="24" ${product.category == '24' ? 'selected' : ''}>분식,만두</option>
						    <option value="25" ${product.category == '25' ? 'selected' : ''}>식재료</option>
						    <option value="26" ${product.category == '26' ? 'selected' : ''}>계란</option>
						    <option value="29" ${product.category == '29' ? 'selected' : ''}>기타</option>
	                    </select>`;
	            } else if (selectedBigCategory === "간식") {
	            	smallCategoryOptions = `
	                    <select name="category">
		            		<option value="31" ${product.category == '31' ? 'selected' : ''}>쿠키</option>
						    <option value="32" ${product.category == '32' ? 'selected' : ''}>초콜릿</option>
						    <option value="33" ${product.category == '33' ? 'selected' : ''}>떡</option>
						    <option value="34" ${product.category == '34' ? 'selected' : ''}>빵</option>
						    <option value="35" ${product.category == '35' ? 'selected' : ''}>고구마</option>
						    <option value="36" ${product.category == '36' ? 'selected' : ''}>프로틴바,견과류</option>
						    <option value="39" ${product.category == '39' ? 'selected' : ''}>기타</option>
					  </select> `;
	            } else if (selectedBigCategory === "음료") {
	            	smallCategoryOptions = `
	                    <select name="category">
		            		<option value="41" ${product.category == '41' ? 'selected' : ''}>쉐이크</option>
						    <option value="42" ${product.category == '42' ? 'selected' : ''}>주스</option>
						    <option value="43" ${product.category == '43' ? 'selected' : ''}>티종류</option>
						    <option value="44" ${product.category == '44' ? 'selected' : ''}>탄산수</option>
						    <option value="49" ${product.category == '49' ? 'selected' : ''}>기타</option>
					  </select> `;
	            }

	            smallCategory.innerHTML = "작은 카테고리: " + smallCategoryOptions;
	        }
	        function openthumFormPopup(num, companyid, isfile, category, category2, flavor) {
	            var popupUrl = '/seller/thumbnailUpdate?num='+ num + '&companyid=' + companyid 
											                + '&isfile=' + isfile 
											                + '&category=' + category 
											                + '&category2=' + category2 
											                + '&flavor=' + flavor;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=500, height=400, scrollbars=yes');
	
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
	        
	        function opendetailFormPopup(num, companyid, isfile, category, category2, flavor) {
	            var popupUrl = '/seller/productImageUpdate?num='+ num + '&companyid=' + companyid 
												                + '&isfile=' + isfile 
												                + '&category=' + category 
												                + '&category2=' + category2 
												                + '&flavor=' + flavor;
	            var popupWindow = window.open(popupUrl, '_blank', 'width=500, height=500, scrollbars=yes');
	
	            if (popupWindow) {
	                popupWindow.focus();
	            }
	        }
	    </script>
    </body>
</html>