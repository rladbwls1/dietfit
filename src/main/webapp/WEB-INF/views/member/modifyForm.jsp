<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/findIdPw.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>



<h1>정보수정</h1>

<form action="modifyPro" method="post" onsubmit="modifySuccessAlert()">
<input type="hidden" name="id" id="id" value="${id }"/>
<table>
<tr><td>아이디</td><td>
${id }</td></tr>
<tr><td>비밀번호</td><td>
<button type="button" onclick="toChangePw()">비밀번호 변경</button></td></tr>
<tr><td>이름</td><td>
<input type="text" name="name" id="name" value="${member.get('NAME')}"/></td></tr>
<tr><td>별명</td><td>
<input type="text" name="nic" id="nic" value="${member.get('NIC')}" /></td></tr>
<tr><td>생년월일</td><td>
<input type="date" name="birth" value=${member.get('BIRTH') } /></td></tr>
<tr><td>성별</td><td>
<input type="radio" name="gender" value="0" <c:if test="${member.get('GENDER')=='0' }">checked</c:if>/> 선택안함
<input type="radio" name="gender" value="1" <c:if test="${member.get('GENDER')=='1' }">checked</c:if>/>남성
<input type="radio" name="gender" value="2" <c:if test="${member.get('GENDER')=='2' }">checked</c:if>/>여성
</td></tr>
<tr><td>휴대폰</td><td>
<input type="text" name="phone" value="${member.get('PHONE')}" /></td></tr>
<tr><td>이메일</td><td>
<input type="text" name="email" id="email" value="${email}" />
<button type="button" onclick="toChangeEmail()">이메일 변경</button></td></tr>

<tr><td colspan="2">아래 우편번호,주소,상세주소는 지울 예정</td></tr>

<tr><td>우편번호</td><td>
<input type="text" id="sample6_postcode" name="postnum" placeholder="우편번호" value="${member.get('POSTNUM')}" >
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td></tr>
<tr><td>주소</td><td>
<input type="text" id="sample6_address" name="addr1" placeholder="주소" value="${member.get('ADDR1')}" ></td></tr>
<tr><td>상세주소</td><td>
<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" value="${member.get('ADDR2')}" ></td></tr>
<tr><td>배송지</td><td>
<button type="button" onclick="toUserDelivery()">배송지 설정하기</button></td></tr>

</table>

<br/>
<button type="submit" >수정하기</button> <button type="button" onclick="deleteUserself()">회원 탈퇴하기</button>
<button type="button" onclick="window.location.href='all'">취소</button>
</form>


<body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
  integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
<script>
  Kakao.init('c78f138fd0cf2db45923ee47d3fb2baf'); 
</script>
<script>
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
    })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
        deleteCookie();
      })
      .catch(function(err) {
        alert('fail: ' + JSON.stringify(err));
      });
  }
</script>

</body>
</html>