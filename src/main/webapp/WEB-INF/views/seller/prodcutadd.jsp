<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		    
		</style>



    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/seller/home">판매자 관리 페이지</a>
            
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
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                정산
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/seller/sales">순매출현황</a>
                                    <a class="nav-link" href="/seller/salesranking">판매량순위</a>
                                </nav>
                            </div>
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
					        <form action="/seller/productaddPro" method="post" enctype="multipart/form-data">
						    	<input type="hidden" name="companyid" value="${companyid}">
						    	<div class="row">
							    	<div class="column">
						                <label for="bigCategory">큰 카테고리</label>
						                <select id="bigCategory" onchange="showSmallCategory()">
						                    <option value="=====">=====</option>
						                    <option value="식사">식사</option>
						                    <option value="식사대용">식사대용</option>
						                    <option value="간식">간식</option>
						                    <option value="음료">음료</option>
						                </select>
						            </div>
							        <div class="column"> 
						            	<div id="smallCategory">
							                <label for="category">작은 카테고리</label>
							                <select name="category" id="category">
							                
							                </select>
							            </div>
						            </div>
								</div>		
								
								<div class="row">
						            <div class="column">
						                <label for="boardname">게시글명</label>
						                <input type="text" name="boardname" required>
						            </div>
						        </div>
						        <div class="row">
						        	<div class="column">
						                <label for="product">상품명</label>
						                <input type="text" name="product" required>
						            </div>
						        </div>
								 
						        <div class="row">
						            <div class="column">
						                <label for="price">가격</label>
						                <input type="number" name="price" required>
						            </div>
						            <div class="column">
						                <label for="stock">재고</label>
						                <input type="number" name="stock" required>
						            </div>
						        </div>
						        
						        <div class="row">
						            <div class="column">
						                <label for="category2">임의 번호</label>
						                <input type="number" name="category2" required>
						            </div>
						            <div class="column">
						                <label for="flavor">맛</label>
						                <select name="flavor" id="flavor">
						                	<option value="00">선택없음</option>
											    <option value="10">매콤한 맛 (청양고추,불닭)</option>
											    <option value="11">짜장맛</option>
											    <option value="12">닭고기맛</option>
											    <option value="13">소고기맛</option>
											    <option value="14">김치</option>
											    <option value="15">어니언(양파)</option>
											    <option value="16">오트</option>
											    <option value="17">초코</option>
											    <option value="18">바나나</option>
											    <option value="19">견과</option>
											    <option value="20">녹차/말차</option>
											    <option value="21">카레맛</option>
											    <option value="22">깻잎</option>
											    <option value="23">바베큐</option>
											    <option value="24">후추</option>
											    <option value="25">데리야끼</option>
											    <option value="26">갈비</option>
											    <option value="27">훈제</option>
											    <option value="28">칠리</option>
											    <option value="29">탄두리</option>
											    <option value="30">마늘</option>
											    <option value="31">단호박</option>
											    <option value="32">마요</option>
											    <option value="33">그외 빨간양념</option>
											    <option value="34">그외 갈색양념</option>
											    <option value="35">그외 기타양념</option>
											    <option value="36">기타</option>
						                </select>
						            </div>
					        	</div>
						
						        <div class="row">
						            <div class="column">
						                <label for="detail">설명</label>
						                <textarea name="detail" required></textarea>
						            </div>
						        </div>
						        <div class="row">
						            <div class="column">
						                <label for="expiry">유통기한</label>
						                <input type="date" name="expiry" pattern='yyyy-MM-dd'>
						            </div>
						            <div class="column">
						                <label for="delivery">배송정보</label>
						                <select name="delivery" id="delivery">
						                    <option value="0">일반배송, 정기배송</option>
						                    <option value="1">일반배송</option>
						                </select>
						            </div>
						        </div>		
						        
						        <div class="row">
							    	<div class="column">
						        		<div id="thumbnailSection">
										    <label>썸네일</label>
										    <input type="file" name="thumbnail" multiple>
										    <input type="button" class="fileAdd" value="➕" onclick="fileAdd('thumbnail', '#thumbnailSection')">
										    <input type="button" class="fileRemove" value="➖" onclick="fileRemove('thumbnail')">
										</div>
						        	</div>
						        	<div class="column">
						        		<div id="attachmentsSection"><br>
										    <label>파일 첨부</label>
										    <input type="file" name="attachments" multiple>
										    <input type="button" class="fileAdd" value="➕" onclick="fileAdd('attachments', '#attachmentsSection')">
										    <input type="button" class="fileRemove" value="➖" onclick="fileRemove('attachments')">
										</div>	
						        	</div>	
					        	</div>
								
						        <input type="submit" value="등록">
					    	</form>
                    	</div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script>
	        function showSmallCategory() {
	            var bigCategory = document.getElementById("bigCategory");
	            var smallCategory = document.getElementById("smallCategory");
	            var selectedBigCategory = bigCategory.value;
	            var smallCategoryOptions = "";

	            if (selectedBigCategory === "식사") {
	                smallCategoryOptions = `
	                    <select name="category">
	                        <option value="11">도시락</option>
	                        <option value="12">밥</option>
	                        <option value="13">죽</option>
	                        <option value="14">면</option>
	                        <option value="15">밀</option>
	                    </select>`;
	            } else if (selectedBigCategory === "식사대용") {
	            	smallCategoryOptions = `
	                    <select name="category">
		            		<option value="21">샐러드</option>
						    <option value="22">닭가슴살</option>
						    <option value="23">가공품(핫바/소시지/핫도그)</option>
						    <option value="24">분식,만두</option>
						    <option value="25">식재료</option>
						    <option value="26">계란</option>
						    <option value="29">기타</option>
	                    </select>`;
	            } else if (selectedBigCategory === "간식") {
	            	smallCategoryOptions = `
	                    <select name="category">
		            		<option value="31">쿠키</option>
						    <option value="32">초콜릿</option>
						    <option value="33">떡</option>
						    <option value="34">빵</option>
						    <option value="35">구황작물</option>
						    <option value="36">프로틴바,견과류</option>
						    <option value="39">기타</option>
					  </select> `;
	            } else if (selectedBigCategory === "음료") {
	            	smallCategoryOptions = `
	                    <select name="category">
		            		<option value="41">쉐이크</option>
						    <option value="42">주스</option>
						    <option value="43">티종류</option>
						    <option value="44">탄산수</option>
						    <option value="49">기타</option>
					  </select> `;
	            }

	            smallCategory.innerHTML = "작은 카테고리: " + smallCategoryOptions;
	        }
	
	        function fileAdd(type, sectionId) {
	            var fileInput = $('<input type="file" name="' + type + '" multiple>');
	            var label = $(sectionId).find('label');
	            $(fileInput).insertAfter(label);
	        }
	
	        function fileRemove(type) {
	            $('input[name="' + type + '"]:last').remove();
	            if (fileInputs.length > 1) {
	                fileInputs.last().remove();
	            } else {
	                alert('첨부파일은 1개 이상있어야합니다.');
	            }
	        }
	    </script>
    </body>
</html>