<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
//가입된 이메일인지 판단
function checkEmail(){
	var email=$('#email').val();
	$.ajax({
		url:'/member/emailCheck',
		type:'post',
		data:{email:email},
		success:function(check){
			if(check){
				$('#emaill').val("check");
			}else{
				$('#emaill').val("false");
			}
		}
	});
}

function findSendEmail(){
	var email=$('#email').val();
	$.ajax({
		url:'/member/emailCheck',
		type:'post',
		data:{email:email},
		success:function(check){
			if(check){
				$('#email_check').text("가입된 이메일이 없습니다").css("color","red");
				$('#verifiedCode').hide();
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
function findPwVerify(){
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
				$('#email_check').text("인증이 완료되었습니다.").css("color","green");
				$('#emaill').val("true");	
			}
		}
	});
}
function toChangePw(){
	console.log("==========tochangePw()===========")
	console.log($('emaill').val());
	
	if($('#emaill').val()=="true"){
		return true;	
	}
	$('#email_check').text("이메일 인증을 해주세요.").css("color","red");
	return false;
}

</script>

<h1>비밀번호 찾기</h1>
<form action="/member/changePassword" method="post" onsubmit="return toChangePw() ">
<input type="hidden" name="emaill" id="emaill" value="false"/>
이메일:<input type="text" name="email" id="email" oninput="checkEmail()"/> 
<button type="button" onclick="findSendEmail()">인증번호 받기</button> <br/>
<input type="text" name="emailkey" id="emailkey"/>
<span id="verifiedCode" style="display:none;">
<button type="button" onclick="findPwVerify()">인증하기</button>
</span>
<p id="email_check"></p>
<button type="submit">다음</button>
</form>
