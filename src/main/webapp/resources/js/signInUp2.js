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
	if(email==null||email==""||email.indexOf('@') == -1){ 
		$('#email_check').text("이메일을 입력해주세요.").css("color","red");
		return false;
	}
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
function register2(){
	//회원가입 전, 아이디/이메일 중복확인, 이름/비밀번호 공란 확인
	var result=true;
	if($('#idd').val()=="false"){
		result=false;
	}
	if($('#id').val()==""){
		$('#id_check').text("아이디를 입력해주세요.").css("color","red");
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
	
	if($('#phone').val()==""){
		$('#phone_check').text("전화번호를 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#businessnum').val()==""){
		$('#businessnum_check').text("사업자번호를 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#company').val()==""){
		$('#company_check').text("회사명을 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#sample6_postcode').val()==""||$('#sample6_address').val()==""||$('#sample6_detailAddress').val()==""){
		$('#post_check').text("주소를 입력해주세요.").css("color","red");
		result=false;
	}
	if($('#phone').val()!=""){
		$('#phone_check').text("");
	}
	if($('#businessnum').val()!=""){
		$('#businessnum_check').text("");
	}
	if($('#company').val()!=""){
		$('#company_check').text("");
	}
	if($('#sample6_postcode').val()!=""||$('#sample6_address').val()!=""||$('#sample6_detailAddress').val()!=""){
		$('#post_check').text("");
	}
	console.log(result);
	return result;
}

