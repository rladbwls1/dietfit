<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
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
</script>


<h1>비밀번호 변경</h1>
<form action="/member/changePwPro" method="post" onsubmit="CPAlert()">
<input type="hidden" name="id" value="${id }"/>
${id}님의 비밀번호를 변경합니다. <br/>
pw: <input type="password" name="pw" id="pw"/> <br/>
<p id="pw_check"></p>
pw확인: <input type="password" name="pw2" id="pw2"/> <br/>
<p id="pw2_check"></p>
<button type="submit" onclick="return checkPwChange()">변경하기</button>
</form>
