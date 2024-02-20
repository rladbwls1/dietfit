<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/js/review.js"></script>


	<style>
	    /* 기본 별 스타일 */
	    .rating {
	        direction: rtl; /* 별을 오른쪽에서 왼쪽으로 표시 */
	    }
	    .rating > .star {
	        font-size: 30px; /* 별의 크기 */
	        color: #ccc; /* 기본 별 색상 */
	        cursor: pointer;
	    }
	    .rating > .star:hover,
	    .rating > .star:hover ~ .star {
	        color: #f0ad4e; /* 호버 시 별 색상 */
	    }
	    .rating > input:checked ~ .star {
	        color: #f0ad4e; /* 선택된 별 색상 */
	    }
	    .rating > input {
        display: none; /* 라디오 버튼 숨기기 */
    	}
	</style>
	<script>
	
	</script>
	</head>
	<body>
		${review.boardname}<br>
		<img src="/resources/p_img/${review.filename }" width="150" >
		<form action="writepro" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="companyid" value="${rdto.companyid}">
			<input type="hidden" name="category" value="${rdto.category}">
			<input type="hidden" name="category2" value="${rdto.category2}">
			<input type="hidden" name="flavor" value="${rdto.flavor }">
			<input type="hidden" name="orderid" value="${rdto.orderid }">
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
				            <input id="star5" name="starscore" type="radio" value="5" class="star" checked/>
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
			<input type="submit" value="리뷰 등록" onclick="return check()">
		</form>
	</body>
</html>