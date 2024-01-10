<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>    
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
  Kakao.init('c78f138fd0cf2db45923ee47d3fb2baf'); 
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>

<script>
  function loginWithKakao() {
	  Kakao.Auth.login({
    	success: function (authObj) {
            console.log(authObj); //access토큰 값
            Kakao.Auth.setAccessToken(authObj.access_token); //access 토큰 값 저장
            getInfo(authObj.access_token);
          },
          fail: function (err) {
            console.log(err);
          }
    });
  }
  function getInfo(tos) {  // 카카오 유저정보 확인 
      Kakao.API.request({
        url: "/v2/user/me",
        success: function (res) {
          $.ajax({
        	  type: "POST",
        	  url: "/member/check",
        	  data : {email:res.kakao_account.email},
        	  success : function(dto){
     				$("#username").val(dto.id);
     				$("#password").val(dto.id);
     				$("#login").submit();				
        	  }
          });
        },
        fail: function (error) {
          alert("카카오 로그인 실패" + JSON.stringify(error));
        },
      });
    }

  
  
</script>
<form action="/login" method="post" id="login" >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="text" name="username" id="username" /> <br/>
	<input type="password" name="password" id="password"/> <br/>
	자동 로그인 : <input type="checkbox" name="remember-me"/> <br/>
	<input type="submit" value="로그인"/>
</form>
<input type="button" value="회원가입" onclick="javascript:window.location='/member/registerForm'">











