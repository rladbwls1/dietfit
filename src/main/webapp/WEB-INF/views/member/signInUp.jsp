<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit - 로그인</title>
<link href="/resources/css/signInUp.css" rel="stylesheet">
</head>
<body>
	<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
      <!-- SIGN UP -->
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
          	<form action="/member/registerPro" method="post" onsubmit="return register()">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	            <input type="hidden" name="idd" id="idd" value="false"/>
				<input type="hidden" name="emaill" id="emaill" value="false"/>
	            
	            <div class="input-group">
	              <i class='bx bxs-lock-alt'></i>
	              <input type="text" name="id" id="id" oninput="checkId()" placeholder="Id">
	              <p id="id_check"></p>
	            </div>
	            
	            <div class="input-group">
	              <i class='bx bxs-lock-alt'></i>
	              <input type="password" name="pw" id="pw" placeholder="Password">
	              <p id="pw_check"></p>
	            </div>
	            
	            <div class="input-group">
	              <i class='bx bxs-user'></i>
	              <input type="password" name="pw2" id="pw2" placeholder="Password 확인">
	              <p id="pw2_check"></p>
	            </div>
	            
	            <div class="input-group">
	              <i class='bx bxs-user'></i>
	              <input type="text" name="name" id="name" placeholder="Username">
	           	  <p id="name_check"></p>
	            </div>
	            
	            <div class="input-group">
	              <i class='bx bxs-user'></i>
	              <input type="text" name="nic" placeholder="Nicname">
	            </div>
	            
	            <div class="input-group">
	              <i class='bx bx-mail-send'></i>
	              <input type="email" name="email" id="email" oninput="checkEmail()" placeholder="Email">
	              <button type="button" onclick="sendEmail()"> 인증번호 받기</button>
	              <span style="display:none;" id="verifiedEmail">
	              	<input type="text" name="emailkey" id="emailkey" placeholder="인증번호">
	              	<button type="button" onclick="verifiedEmail()">인증하기</button>
              	  </span>
              	 <p id="email_check"></p>
	            </div>
	            
	            <button type="submit">
	              <b> 가입하기 </b>
	            </button>
            </form>
            
            <p>
              <span>
                계정이 있으신가요?
              </span>
              <b onclick="toggle()" class="pointer">
                로그인
              </b>
            </p>
          </div>
        </div>
      
      </div>
      <!-- END SIGN UP -->
      <!-- SIGN IN -->
      <div class="col align-items-center flex-col sign-in">
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
	          <form action="/login" method="post" id="login" >
	          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	          	
				<div class="input-group">
	              <i class='bx bxs-user'></i>
	              <input type="text" name="username" id="username" placeholder="Id" />
	            </div>
	            <div class="input-group">
	              <i class='bx bxs-lock-alt'></i>
	              <input type="password" name="password" id="password" placeholder="Password"/>
	            </div>
	            
	            자동 로그인  <input type="checkbox" name="remember-me"/> <br/>
					${exception}
				<br/>
	
	            <button type=submit>
	              <b> 로그인 </b>
	            </button>
            	</form>
            
            
            <p>
              <b>
              <a href="javascript:window.location='/member/findId'" style="text-decoration-line : none; color:black;">아이디 찾기</a>
              /
              <a href="javascript:window.location='/member/findPassword'" style="text-decoration-line : none; color:black;">비밀번호 찾기</a>
              </b>
            </p>
            
            <br />
            <!-- 카카오 로그인  -->
            <a id="kakao-login-btn" href="javascript:loginWithKakao()">
			  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
			    alt="카카오 로그인 버튼" />
			</a>
			<p id="token-result"></p>
			
            <p>
              <span>
                계정이 없으신가요?
              </span>
              <b onclick="toggle()" class="pointer">
                회원가입
              </b>
              <!-- 
              <b>
              <a href="javascript:window.location='/member/registerForm'" style="text-decoration-line : none; color:black;">회원가입</a>
              </b>
               -->
            </p>
          </div>
        </div>
        <div class="form-wrapper">
    
        </div>
      </div>
      <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN IN CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="text sign-in">
          <h2>
            Welcome
          </h2>
  
        </div>
        <div class="img sign-in">
    
        </div>
      </div>
      <!-- END SIGN IN CONTENT -->
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            Join with us
          </h2>
  
        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>
   <script src="/resources/js/signInUp.js"></script>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>    
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	  Kakao.init('c78f138fd0cf2db45923ee47d3fb2baf'); 
	</script>
</body>
</html>