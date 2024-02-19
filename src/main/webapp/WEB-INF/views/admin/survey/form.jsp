<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - Survey</title>
	<link href="/resources/css/survey.css" rel="stylesheet">
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
   
</head>

<body>
	<jsp:include page="/WEB-INF/views/navbar.jsp"/>
	
	<div class="container-fluid py-5 mb-5 hero-header">
	<h2> 설문조사 </h2>
	<form action="surveyResult" method="post">
		<label for="gender">성별</label>
	        <select id="gender" name="gender" required>
	            <option value="male">남성</option>
	            <option value="female">여성</option>
	        </select> 
        <br />

        <label for="height">키 (cm)</label>
        <input type="number" id="height" name="height" required>
        <br />

        <label for="weight">몸무게 (kg)</label>
        <input type="number" id="weight" name="weight" required>
        <br />

        <label for="age">나이(만)</label>
        <input type="number" id="age" name="age" required>
		<br />
		
		 <label for="activity">활동량/운동횟수</label>
		    <select id="activity" name="activity" required>
		        <option value="1.2">적은 활동 (아예안함)</option>
		        <option value="1.375">가벼운 활동 (주 1~2회 운동)</option>
		        <option value="1.55">보통 활동 (주 3~4회 운동)</option>
		        <option value="1.725">많은 활동 (매일 운동)</option>
		        <option value="1.9">매우 많은 활동 (매일 고강도 운동 )</option>
		    </select>
	    <br />
    
        <button type="submit">제출</button>
	</form>
	
	</div>
</body>
</html>