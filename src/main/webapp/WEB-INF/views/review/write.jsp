<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
	    // 첨부 파일 추가 함수
	    function fileAdd() {
	        var fileCount = $('#file-section input[type="file"]').length; // 현재 파일 입력란의 개수
	        if(fileCount < 3) { // 최대 3개까지만 추가 가능
	            var fileInput = $('<input type="file" name="file" multiple>');
	            $('#file-section').append(fileInput);
	        }
	        if(fileCount >= 2) { // 파일 입력란이 3개 있을 경우 "+" 버튼 비활성화
	            $('.fileAdd').prop('disabled', true);
	        }
	    }
	
	    // 첨부 파일 제거 함수
	    function fileRemove() {
	        $('#file-section input[type="file"]:last').remove();
	        var fileCount = $('#file-section input[type="file"]').length;
	        if(fileCount < 3) { // 파일 입력란이 3개 미만일 경우 "+" 버튼 활성화
	            $('.fileAdd').prop('disabled', false);
	        }
	    }
	
	    // 파일 추가 버튼 클릭 이벤트 연결
	    $('.fileAdd').click(function() {
	        fileAdd();
	    });
	
	    // 파일 제거 버튼 클릭 이벤트 연결
	    $('.fileRemove').click(function() {
	        fileRemove();
	    });
	});
	</script>

	<style>
	    /* 기본 별 스타일 */
	    .rating {
	        direction: rtl;
	    }
	    .rating > .star {
	        font-size: 30px;/
	        color: #ccc; 
	        cursor: pointer;
	    }
	    .rating > .star:hover,
	    .rating > .star:hover ~ .star {
	        color: #f0ad4e; 
	    }
	    .rating > input:checked ~ .star {
	        color: #f0ad4e; 
	    }
	    .rating > input {
        display: none; 
    	}
	</style>
	</head>
	<body>
		${review.boardname}<br>
		<img src="/resources/p_img/${review.filename }">
		<form action="writepro" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="companyid" value="${rdto.companyid}">
			<input type="hidden" name="category" value="${rdto.category}">
			<input type="hidden" name="category2" value="${rdto.category2}">
			<input type="hidden" name="flavor" value="${rdto.flavor }">
			<table>
				<tr>
					<td>리뷰내용</td>
					<td><textarea name="content" required></textarea></td>
				</tr>
				<tr>
					<td>
					    첨부파일
					 </td>
					 <td id="file-section">
					    <input type="button" class="fileAdd" value="+">
					    <input type="button" class="fileRemove" value="-">
					</td>
				</tr>
				<tr>
					<td>별점</td>
					<td>
						<div class="rating">
				            <input id="star5" name="starscore" type="radio" value="5" class="star"/>
				            <label for="star5" class="star">&#9733;</label>
				            <input id="star4" name="starscore" type="radio" value="4" class="star"/>
				            <label for="star4" class="star">&#9733;</label>
				            <input id="star3" name="starscore" type="radio" value="3" class="star"/>
				            <label for="star3" class="star">&#9733;</label>
				            <input id="star2" name="starscore" type="radio" value="2" class="star"/>
				            <label for="star2" class="star">&#9733;</label>
				            <input id="star1" name="starscore" type="radio" value="1" class="star"/>
				            <label for="star1" class="star">&#9733;</label>
				        </div>
					</td>
				</tr>
				<tr>
				</tr>
			</table>
			<input type="submit" value="리뷰 등록">
		</form>
	</body>
</html>