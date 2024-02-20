<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dietfit - 설문 결과</title>
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
    <h2>설문 결과</h2>
    <div class="result-container">
    	 <b>👀회원님의 결과👀</b>
         <p>BMI(체질량지수): ${String.format("%.1f", bmi)}</p>
         <p>BMR(기초대사량): ${String.format("%.1f", bmr)}</p>
         <p>TDEE(일일 에너지 총 소비량): ${tdeeAsInt}</p>
         <br />
         <p>== 현재 몸무게에 따른 ==</p>
         <p>권장 칼로리 : ${diettdee }</p>
         <p>필요 단백질량(g) : ${protein }</p>
         <p>필요 지방량(g) : ${fat }</p>
         <p>필요 탄수화물량(g) : ${rice }</p>
         

         
    </div>
    </div>
    <div class="container-fluid featurs py-5">
    <table class="center-table">
        <thead>
            <tr>
                <th>분류</th>
                <th>BMI 지수</th>
                <th>해당</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>저체중</td>
                <td>18.5 이하</td>
                <td>${bmi <= 18.5 ? '✔': ''}</td>
            </tr>
            <tr>
                <td>정상</td>
                <td>18.5 ~ 23</td>
                <td>${bmi > 18.5 && bmi <= 23 ? '✔' : ''}</td>
            </tr>
            <tr>
                <td>과체중</td>
                <td>23 ~ 25</td>
                <td>${bmi > 23 && bmi <= 25 ? '✔' : ''}</td>
            </tr>
            <tr>
                <td>비만</td>
                <td>25 ~ 30</td>
                <td>${bmi > 25 && bmi <= 30 ? '✔' : ''}</td>
            </tr>
            <tr>
                <td>고도비만</td>
                <td>30 이상</td>
                <td>${bmi >= 30 ? '✔' : ''}</td>
            </tr>
        </tbody>
    </table>
    
    <br />
    <form action="/dietfit/eat" method="post">
		<input type="hidden" name="kcal"  value="${diettdee }"/>
		<button type="submit">식단보기</button>
	</form>
	
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
