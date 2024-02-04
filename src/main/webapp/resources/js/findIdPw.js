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
//modifyForm@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function modifySuccessAlert(){
	
	alert("수정이 완료되었습니다.");
}

function toChangePw(){
	let f=document.createElement('form');
	let obj;
	obj=document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','email');
	obj.setAttribute('value',$('#email').val());
	f.appendChild(obj);
	f.setAttribute('method','post');
	f.setAttribute('action','/member/changePassword');
	document.body.appendChild(f);
	f.submit();
	
}
function toChangeEmail(){
	let ff=document.createElement('form');
	let obj2;
	obj2=document.createElement('input');
	obj2.setAttribute('type','hidden');
	obj2.setAttribute('name','id');
	obj2.setAttribute('value',$('#id').val());
	ff.appendChild(obj2);
	ff.setAttribute('method','post');
	ff.setAttribute('action','/member/changeEmail');
	document.body.appendChild(ff);
	ff.submit();
}

//주소 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } else {            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr+extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
function deleteUserself(){
	let fff=document.createElement('form');
	let obj21;
	obj21=document.createElement('input');
	obj21.setAttribute('type','hidden');
	obj21.setAttribute('name','id');
	obj21.setAttribute('value',$('#id').val());
	fff.appendChild(obj21);
	fff.setAttribute('method','post');
	fff.setAttribute('action','/member/userDelete');
	document.body.appendChild(fff);
	fff.submit();	
}

//changeEmail@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

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
		$('#email_check').text("인증 번호를 발송하였습니다. 인증을 완료해주세요.").css("color","green");
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
function changeEmailCheck(){
	if($('#emaill').val()=="true"){
		return true;
	}else{
		return false;
	}
}
// userDelete@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function deletePro(){
	var id=$('#id').val();
	var pw=$('#pw').val();
	var error=false;
	$.ajax({
		url:'/member/deletePro',
		async:false,
		type:'post',
		data:{pw:pw, id:id},
		success:function(check){
			if(check){
			}else{
				$('#pw_check').text("비밀번호가 틀렸습니다.").css("color","red");
				error=true;
			}
		}
	});
	if(error){
		return false;
	}
}
