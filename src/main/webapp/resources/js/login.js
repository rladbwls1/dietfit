let container = document.getElementById('container')

toggle = () => {
  container.classList.toggle('sign-in')
  container.classList.toggle('sign-up')
}

setTimeout(() => {
  container.classList.add('sign-in')
}, 200)


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