<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<h1>회원가입하기</h1>

<script>
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
			}
		}
	});
}
function checkEmail(){
	var email=$('#email').val();
	$.ajax({
		url:'/member/emailCheck',
		type:'post',
		data:{email:email},
		success:function(check){
			if(check){
				$('#email_check').text("사용 가능한 이메일입니다.").css("color","green");
				$('#emaill').val("true");
			}else{
				$('#email_check').text("이미 가입된 이메일입니다. 다른 이메일을 사용하세요.").css("color","red");
			}
		}
	});
}
function register(){
	console.log('====================register========');
	console.log(''+$('#idd').val().equals("false"));
	
	if ($('#idd').val().equals("false")){
		return false;
	}
	if ($('#emaill').val().equals("false")){
		return false;
	}
	return false;
	
}

</script>
<form action="/member/registerPro" method="post" onsubmit="return register()">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="idd" id="idd" value="false"/>
	<input type="hidden" name="emaill" id="emaill" value="false"/>
	id: <input type="text" name="id" id="id" oninput="checkId()"/> 
	<p id="id_check"></p><br/>
	pw: <input type="password" name="pw"/> <br/>
	name: <input type="text" name="name"/> <br/>
	nic: <input type="text" name="nic"/> <br/>
	email: <input type="text" name="email" id="email" oninput="checkEmail()"/> 
	<p id="email_check"></p><br/>
	<input type="submit" value="가입하기"/>
</form>
    
    