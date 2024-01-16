<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title>상품 등록</title>
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
						    <option value="35">고구마</option>
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
	            fileInput.insertBefore(sectionId);
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
	    
	</head>
	<body>
	    <h2>상품 등록</h2>
	    <form action="/seller/productaddPro" method="post" enctype="multipart/form-data">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    	<input type="hidden" name="companyid" value="${companyid}">
	    	
	    	큰 카테고리:
		        <select id="bigCategory" onchange="showSmallCategory()">
		            <option value="=====">=====</option>
		            <option value="식사">식사</option>
		            <option value="식사대용">식사대용</option>
		            <option value="간식">간식</option>
		            <option value="음료">음료</option>
		        </select>
		
		        <div id="smallCategory">
		            작은 카테고리:
		            <select name="category">
		            	
		            </select>
		        </div>
					 
	        게시글명: <input type="text" name="boardname" required><br>
	        
	        상품명: <input type="text" name="product" required><br>
	        
	        가격: <input type="number" name="price" required><br>
	        
	        설명: <textarea name="detail" required></textarea><br>
	        
	       	임의 번호 <input type ="number" name="category2" required><br>
	       	
	       	맛 : 	<select name="flavor" id="flavor">
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
					  </select> <br>
			재고수 : <input type ="number" name="stock" required><br>
	        
	        유통기한 : <input type="date" name="expiry"> <br>
	        
	        배송정보 : <select name="delivery" id ="delivery">
	        			<option value="0">일반배송, 정기배송</option>
	        			<option value="1">일반배송</option>
	        		</select> <br>
	        <div id="thumbnailSection">
			    <label>썸네일:</label>
			    <input type="file" name="thumbnail" multiple>
			    <input type="button" class="fileAdd" value="+" onclick="fileAdd('thumbnail', '#thumbnailSection')">
			    <input type="button" class="fileRemove" value="-" onclick="fileRemove('thumbnail')">
			</div>
			<br>
			
			<div id="attachmentsSection">
			    <label>파일 첨부:</label>
			    <input type="file" name="attachments" multiple>
			    <input type="button" class="fileAdd" value="+" onclick="fileAdd('attachments', '#attachmentsSection')">
			    <input type="button" class="fileRemove" value="-" onclick="fileRemove('attachments')">
			</div>
			<br>
	        <input type="submit" value="등록">
	    </form>
	</body>
	</html>