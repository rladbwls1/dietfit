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
    
    
    

//아이디 중복 확인
function checkId(){
	var id=$('#id').val();
	$.ajax({
		url:'/member/idCheck',
		type:'post',
		data:{id:id},
		success:function(check){
			if(check){
				$('#id_check').text("사용 가능한 아이디입니다.").css("color","green");
				$('#idd').val("true");
			}else{
				$('#id_check').text("이미 가입된 아이디입니다. 다른 아이디를 사용하세요.").css("color","red");
				$('#idd').val("false");
			}
		}
	});
}
//이메일 중복 확인
function checkEmail(){
	var email=$('#email').val();
	$.ajax({
		url:'/member/emailCheck',
		type:'post',
		data:{email:email},
		success:function(check){
			if(check){
				$('#email_check').text("사용 가능한 이메일입니다. 이메일 인증을 해주세요").css("color","green");
				$('#emaill').val("check");
			}else{
				$('#email_check').text("이미 가입된 이메일입니다. 다른 이메일을 사용하세요.").css("color","red");
				$('#emaill').val("false");
				
			}
		}
	});
}
//메일 전송
function sendEmail(){
	var email=$('#email').val();
	if($('#emaill').val()=="check"){
		$('#email_check').text("인증 번호를 발송하였습니다. 인증을 완료해주세요.").css("color","red");
		$.ajax({
			url:'/member/sendMail',
			data:{email:email},
			type:'post',
			success:function(check){
				$('#verifiedEmail').show();
			}
		});
	}else if($('#emaill').val()=="false"){
		$('#email_check').text("이미 가입된 이메일입니다. 다른 이메일을 사용하세요.").css("color","red");
	}else{
		$('#email_check').text("인증 번호를 재발송하였습니다. 인증을 완료해주세요.").css("color","red");
		$.ajax({
			url:'/member/sendMail',
			data:{email:email},
			type:'post',
			success:function(check){
				$('#verifiedEmail').show();
			}
		});
		
	}
	
	
}
//인증 번호 입력시 비교 
function verifiedEmail(){
	var email=$('#email').val();
	var emailkey=$('#emailkey').val();
	$.ajax({
		url:'/member/verifiedEmail',
		type:'post',
		data:{email:email, emailkey:emailkey},
		success:function(check){
			if(check==0){
				$('#email_check').text("인증번호가 틀렸습니다.").css("color","red");
				$('#emaill').val("check");
			}else{
				$('#email_check').text("인증이 완료되었습니다").css("color","green");
				$.ajax({
					url:'/member/emailAuth',
					type:'post',
					data:{email:email},
					success:function(check){}
				});
				$('#emaill').val("true");
			}
		}
	});
	
}

function register(){
	//회원가입 전, 아이디/이메일 중복확인, 이름/비밀번호 공란 확인
	var result=true;
	if($('#idd').val()=="false"){
		result=false;
	}
	if($('#pw').val()==""){
		$('#pw_check').text("비밀번호를 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#pw').val()!=""){
		$('#pw_check').text("");
	}
	if($('#pw2').val()==""||$('#pw2').val()!=$('#pw').val()){
		$('#pw2_check').text("비밀번호와 동일하게 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#pw2').val()==$('#pw').val()){
		$('#pw2_check').text("");
	}
	if($('#emaill').val()!="true"){
		$('#email_check').text("이메일 인증을 해주세요.").css("color","red");
		result=false;
	}
	if($('#name').val()==""){
		$('#name_check').text("이름을 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#name').val()!=""){
		$('#name_check').text("");
	}
	
	
	return result;
	
}
