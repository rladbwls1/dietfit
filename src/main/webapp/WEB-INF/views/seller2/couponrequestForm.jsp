<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>쿠폰요청</title>
</head>
<body>
    <h2>쿠폰요청</h2>
    <form action="/seller/coupon/requestPro" method="post">
    
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <label for="coupon">쿠폰이름</label>
        <input type="text" id="coupon" name="coupon" required>
        <br>
        <label for="createdate">사용시작일:</label>
        <input type="date" id="createdate" name="createdate" required>
        <br>
        <label for="deletedate">만료일:</label>
        <input type="date" id="deletedate" name="deletedate" required>
        <br>
        <label for="companyid">회사id:</label>
        <input type="text" id="companyid" name="companyid" required>
        <br>
        <label for="download">총다운로드횟수:</label>
        <input type="number" id="download" name="download" required>
        <br>
        <label for="minprice">최소주문금액:</label>
        <input type="number" id="minprice" name="minprice" required>
        <br>
        <label for="discount">할인율:</label>
        <input type="number" id="discount" name="discount" required>
        <br>
        <label for="boardnums">적용가능상품:</label>
        <select id="boardnums" name="boardnums" required>
        	<optgroup label="전체 상품">
		        <option value="all">전체 상품</option>
		    </optgroup>
            <optgroup label="식사">
                <option value="11">도시락</option>
                <option value="12">밥</option>
                <option value="13">죽</option>
                <option value="14">면</option>
                <option value="15">밀키트</option>
            </optgroup>
            <optgroup label="식사대용">
	            <option value="21">샐러드</option>
	            <option value="22">닭가슴살</option>
	            <option value="23">가공품(핫바/소시지/핫도그)</option>
	            <option value="24">분식,만두</option>
	            <option value="25">식재료</option>
	            <option value="26">계란</option>
	            <option value="29">기타</option>
            </optgroup>
            <optgroup label="간식">
	            <option value="31">쿠키,칩등</option>
	            <option value="32">초콜릿</option>
	            <option value="33">떡</option>
	            <option value="34">빵</option>
	            <option value="35">고구마</option>
	            <option value="36">프로틴바 등 견과류(오트밀)</option>
	            <option value="39">기타</option>
            </optgroup>
            <optgroup label="음료">
	            <option value="41">쉐이크</option>
	            <option value="42">주스</option>
	            <option value="43">티종류</option>
	            <option value="44">탄산수</option>
	            <option value="49">기타</option>
            </optgroup>
        </select>
        <br>
        <label for="content">상세설명</label>
        <textarea id="content" name="content" required></textarea>
        <br>
        <input type='submit' value='신청하기'> 
    </form>
</body>
</html>
