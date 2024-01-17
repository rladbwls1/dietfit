<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
function findSendEmail(){
	var email=$('#email').val();
	$.ajax({
		url:'/member/emailCheck',
		type:'post',
		data:{email:email},
		success:function(check){
			if(check){
				$('#email_check').text("가입된 이메일이 없습니다").css("color","red");
			}else{
				$('#email_check').text("인증 메일을 발송했습니다. 인증 번호를 입력해주세요.").css("color","black");
				$('#verifiedCode').show();
				$.ajax({
					url:'/member/sendMail',
					data:{email:email},
					type:'post',
					success:function(check){}
				});
			}
		}
	});
}
function findIdVerify(){
	var email=$('#email').val();
	var emailkey=$('#emailkey').val();
	$.ajax({
		url:'/member/verifiedEmail',
		type:'post',
		data:{email:email, emailkey:emailkey},
		success:function(check){
			if(check==0){
				$('#email_check').text("인증번호가 틀렸습니다.").css("color","red");
			}else{
				$.ajax({
					url:'/member/findIdByEmail',
					type:'post',
					data:{email:email},
					success:function(id){
						$('#email_check').text("고객님의 이메일과 일치하는 아이디는 "+id+" 입니다.").css("color","black");
					}
				});
			}
		}
	});
}

</script>
<h1>아이디 찾기</h1>
이메일: <input type="text" name="email" id="email"/>
<button type="button" onclick="findSendEmail()">인증번호 받기</button> <br/>
<span id="verifiedCode" style="display:none;">
<input type="text" name="emailkey" id="emailkey"/>
<button type="button" onclick="findIdVerify()">인증하기</button>
</span>
<p id="email_check"></p>

<input type="button" value="로그인 하러 가기" onclick="javascript:window.location='/member/customLogin'">
