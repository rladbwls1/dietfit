<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/signInUp.css" rel="stylesheet">
<script src="/resources/js/signInUp2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="/resources/js/findIdPw.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>


<form action="/member/registerPro2" method="post" onsubmit="return register2()">
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
	전화번호:<input type="text" name="phone" id="phone" />
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
	 
 
 <button type="submit">
   <b> 가입하기 </b>
 </button>
</form>



</body>
</html>