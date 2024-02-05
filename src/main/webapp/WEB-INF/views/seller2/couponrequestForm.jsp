<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>쿠폰요청</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* 폼의 넓이 조절 */
            text-align: center;
        }

        h2 {
		    color: #333;
		    margin-bottom: 15px; /* 원하는 마진 설정 */
		}


        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input, select, textarea {
            width: calc(100% - 16px);
            box-sizing: border-box;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            height: 100px; /* textarea 높이 조절 */
            resize: vertical;
        }

        input[type='submit'] {
            background-color: #286FAE;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type='submit']:hover {
            background-color: #20588A;
        }
        .myPageButton {
            background-color: #286FAE;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
            margin-bottom: 3px;
        }

        .myPageButton:hover {
            background-color: #20588A;
        }
    </style>
</head>
<body>
	<button class="myPageButton" onclick="goToMyPage()">MYPAGE</button>
    <h2>쿠폰요청</h2>
    <form action="/seller/coupon/requestPro" method="post">
    
        <label for="coupon">쿠폰이름</label>
        <input type="text" id="coupon" name="coupon" required>
        <br>
        <label for="createdate">사용시작일</label>
        <input type="date" id="createdate" name="createdate" required>
        <br>
        <label for="deletedate">만료일</label>
        <input type="date" id="deletedate" name="deletedate" required>
        <br>
        <label for="companyid">회사id</label>
        <input type="text" id="companyid" name="companyid" value="${companyId}" readonly>
        <br>
        <label for="download">총다운로드횟수</label>
        <input type="number" id="download" name="download" required>
        <br>
        <label for="minprice">최소주문금액</label>
        <input type="number" id="minprice" name="minprice" required>
        <br>
        <label for="discount">할인율(%)</label>
        <input type="number" id="discount" name="discount" required>
        <br>
        <label for="boardnums">적용가능상품</label>
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
	            <option value="35">구황작물</option>
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
	<script>
        // my페이지로 이동하는 함수
        function goToMyPage() {
            window.location.href = '/seller/mypage'; // 원하는 경로로 변경
        }
    </script>
</html>
