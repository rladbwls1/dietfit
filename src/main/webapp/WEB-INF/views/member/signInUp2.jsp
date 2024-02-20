<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELLER REGISTER</title>
<link href="/resources/css/signInUp.css" rel="stylesheet">
<script src="/resources/js/signInUp2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="/resources/js/findIdPw.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	body{
		margin-top:190px;
	}
    #form {
    	display: flex;
        justify-content: center;
        align-items: center;
        height: 63vh;
        margin: 0;
    }
    h2 {
        text-align: center;
    }

    form {
        max-width: 800px; /* increased width to accommodate two columns */
        padding: 20px;
        background: #f4f7f6;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-wrap: wrap; /* allow items to wrap to the next line */
        justify-content: space-between; /* evenly distribute items between the two columns */
    }

    .form-group {
        width: calc(50% - 10px); /* width of each column with a margin of 10px between them */
    }

    .form-group + .form-group {
        margin-left: 20px; /* margin between columns */
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="button"],
    input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    button[type="submit"],
    button[type="button"],
    input[type="button"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: none;
        border-radius: 4px;
        background-color: #355FAD;
        color: white;
        cursor: pointer;
    }

    button[type="submit"]:hover,
    button[type="button"]:hover,
    input[type="button"]:hovor {
        background-color: #2B4C8A;
    }

    h1 {
        text-align: center;
    }
    

    p {
        color: #777;
        margin: 5px 0;
    }

    #verifiedEmail {
        display: flex;
        align-items: center;
    }
</style>
</head>
<body>
<h2>판매자 회원가입</h2>
<div id="form">
	<form action="/member/registerPro2" method="post" onsubmit="return register2()">
	    <div class="form-group">
	        <input type="hidden" name="idd" id="idd" value="false"/>
	        <input type="hidden" name="emaill" id="emaill" value="false"/>
	
	        아이디: <input type="text" name="id" id="id" oninput="checkId()" placeholder="Id">
	        <p id="id_check"></p>
	
	        비밀번호:<input type="password" name="pw" id="pw" placeholder="Password">
	        <p id="pw_check"></p>
	
	        비밀번호 확인: <input type="password" name="pw2" id="pw2" placeholder="Password 확인">
	        <p id="pw2_check"></p>
	
	        이름: <input type="text" name="name" id="name" placeholder="Username">
	        <p id="name_check"></p>
	
	        별명: <input type="text" name="nic" placeholder="Nicname"> <br/>
	
	        이메일: <input type="email" name="email" id="email" oninput="checkEmail()" placeholder="Email">
	        <button type="button" onclick="return sendEmail()"> 인증번호 받기</button>
	        <span style="display:none;" id="verifiedEmail">
	            <input type="text" name="emailkey" id="emailkey" placeholder="인증번호">
	            <button type="button" onclick="verifiedEmail()">인증하기</button>
	        </span>
	        <p id="email_check"></p>
	    </div>
	
	    <div class="form-group">
	        전화번호:<input type="tel" name="phone" id="phone" />
	        <p id="phone_check"></p>
	
	        사업자 번호:<input type="text" name="businessnum" id="businessnum" />
	        <p id="businessnum_check"></p>
	
	        회사명:<input type="text" name="company" id="company" />
	        <p id="company_check"></p>
	
	        우편번호:
	        <input type="text" id="sample6_postcode" name="postnum" placeholder="우편번호"  >
	        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br/>
	
	        주소:
	        <input type="text" id="sample6_address" name="addr1" placeholder="주소"  ><br/>
	
	        상세주소:
	        <input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" ><br/>
	        <p id="post_check"></p>
	    </div>
	
	    <button type="submit">
	       <b> 가입하기 </b>
	    </button>
	</form>
</div>
</body>
</html>
