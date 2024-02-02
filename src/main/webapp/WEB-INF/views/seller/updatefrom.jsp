<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title>상품 수정</title>
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <style>
		    .preview-image {
		        width: 100px;
		        height: auto;
		    }
		</style>
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
	
	        function fileAdd(type, sectionIdSelector) {
	            var fileInputDiv = $('<div class="file-input-wrapper"></div>');
	            var fileInput = $('<input type="file" name="' + type + '" multiple>');
	            var deleteButton = $('<button type="button">삭제</button>');
	            var previewDiv = $('<div class="file-preview"></div>');

	            fileInput.on('change', function(event) {
	                var files = event.target.files;
	                for (var i = 0; i < files.length; i++) {
	                    var file = files[i];
	                    var reader = new FileReader();

	                    reader.onload = function(e) {
	                        var img = $('<img>').attr('src', e.target.result);
	                        img.css('width', '100px');
	                        img.css('height', 'auto');
	                        previewDiv.append(img);
	                    };

	                    reader.readAsDataURL(file);
	                }
	            });

	            deleteButton.click(function() {
	                $(this).parent().remove();
	            });

	            fileInputDiv.append(fileInput).append(deleteButton).append(previewDiv);
	            $(sectionIdSelector).append(fileInputDiv);
	        }
	        function removeImage(wrapperId) {
	            // 해당 ID를 가진 요소를 찾아서 제거
	            var element = document.getElementById(wrapperId);
	            if (element) {
	                element.style.display = 'none'; // 요소를 숨김 처리
	                element.remove(); // 요소를 완전히 제거하려면 이 코드 사용
	            }
	        }
	    </script>
	</head>
	<body>
	    <h2>상품 수정</h2>
	    <form action="/seller/UpdatePro" method="post" enctype="multipart/form-data">
	    	<input type="hidden" name="num" value="${product.num}">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    	<input type="hidden" name="companyid" value="${product.companyid}">
	    	큰 카테고리:
		        <select id="bigCategory" onchange="showSmallCategory()">
		            <option value="====="   >=====</option>
		            <option value="식사" <c:if test="${product.category.substring(0,1)=='1' }"> selected </c:if>     >식사</option>
		            <option value="식사대용" <c:if test="${product.category.substring(0,1)=='2' }"> selected </c:if>   >식사대용</option>
		            <option value="간식" <c:if test="${product.category.substring(0,1)=='3' }"> selected </c:if>   >간식</option>
		            <option value="음료" <c:if test="${product.category.substring(0,1)=='4' }"> selected </c:if>  >음료</option>
		        </select>
		
		        <div id="smallCategory">
		            작은 카테고리:
		            <select name="category">
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
					 
	        게시글명: <input type="text" name="boardname" value = "${product.boardname}" required><br>
	        
	        상품명: <input type="text" name="product" value = "${product.product}" required><br>
	        
	        가격: <input type="number" name="price" value = "${product.price}" required><br>
	        
	        설명: <textarea name="detail" required>${product.detail}</textarea><br>
	        
	       	임의 번호: <input type ="number" name="category2" value = "${product.category2}" required><br>
	       	
	       	맛 : 	<select name="flavor" id="flavor">
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
					  </select> <br>
			재고수 : <input type ="number" name="stock" value = "${product.stock}" required><br>
	        
	        유통기한 : <input type="date" name="expiry" required
                          value="<fmt:formatDate value='${product.expiry}' pattern='yyyy-MM-dd' />"> <br>
	        
	        배송정보 : <select name="delivery" id="delivery">
		                <option value="0" ${product.delivery == '0' ? 'selected' : ''}>일반배송, 정기배송</option>
		                <option value="1" ${product.delivery == '1' ? 'selected' : ''}>일반배송</option>
		              </select> <br>
	        <div id="thumbnailSection">
			    <label>썸네일:</label>
			    <c:forEach items="${thumimages}" var="thumbImg">
				    <div class="image-wrapper" id="thumbnailWrapper${thumbImg.num}">
				        <img src="/resources/p_img/${thumbImg.fileName}" alt="Thumbnail" class="preview-image"/>
				        <button type="button" onclick="removeImage('thumbnailWrapper${thumbImg.num}')">삭제</button>
				        <input type="hidden" name="thumfileName" value="${thumbImg.fileName}">
				        <input type="hidden" name="thumnum" value="${thumbImg.num}">
				    </div>
				</c:forEach>
			    <input type="button" class="fileAdd" value="+" onclick="fileAdd('thumbnail', '#thumbnailSection')">
			</div>
			<br>
			<div id="attachmentsSection">
			    <label>파일 첨부:</label>
			    <c:forEach items="${images}" var="img">
				    <div class="image-wrapper" id="imageWrapper${img.num}">
				        <img src="/resources/p_img/${img.fileName}" alt="Image" class="preview-image"/>
				        <button type="button" onclick="removeImage('imageWrapper${img.num}')">삭제</button>
				        <input type="hidden" name="imgfileName" value="${img.fileName}">
				        <input type="hidden" name="imgnum" value="${img.num}">
				    </div>
				</c:forEach>
			    <input type="button" class="fileAdd" value="+" onclick="fileAdd('attachments', '#attachmentsSection')">
			</div>
			<br>
	        <input type="submit" value="수정">
	    </form>
	</body>
	</html>