//findPassword!!
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
	if($('#emaill').val()=="true"){
		return true;	
	}
	$('#email_check').text("이메일 인증을 해주세요.").css("color","red");
	return false;
}


//changePassword!!

function checkPwChange(){
	var result=true;
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
	return result;
}
function CPAlert(){
	alert("비밀번호가 변경되었습니다.");
}

//findId !!
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