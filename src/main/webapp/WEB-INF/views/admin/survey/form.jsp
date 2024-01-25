<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - Survey</title>
<link href="/resources/css/survey.css" rel="stylesheet">
</head>

<body>
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
</body>
</html>