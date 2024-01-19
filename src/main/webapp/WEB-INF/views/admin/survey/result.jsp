<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dietfit - 설문 결과</title>
<link href="/resources/css/survey.css" rel="stylesheet">  
</head>
<body>
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
         <p>필요 지방량(kcal) : ${fat }</p>
         <p>필요 탄수화물량(kcal) : ${rice }</p>
         

         
    </div>
    
    <br />
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
    
    <!-- protein ${protein}으로 고치기  -->
    <button onclick="location.href='/dietfit/surveymenu?protein=10'">식단보기</button>
</body>
</html>
