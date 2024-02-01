<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/findIdPw.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>배송지 추가</title>
</head>
<body>
<table>
<tr><td>배송지 별명</td><td>
<input type="text" name="nicaddr" id="nicaddr" /></td></tr>
<tr><td>받는 분 성함</td><td>
<input type="text" name="receiver" id="receiver" /></td></tr>
<tr><td>전화 번호</td><td>
<input type="text" name="phone" id="phone" /></td></tr>
<tr><td>우편번호</td><td>
<input type="text" id="sample6_postcode" name="postnum" placeholder="우편번호" value="${member.get('POSTNUM')}" >
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td></tr>
<tr><td>주소</td><td>
<input type="text" id="sample6_address" name="addr1" placeholder="주소" value="${member.get('ADDR1')}" ></td></tr>
<tr><td>상세주소</td><td>
<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" value="${member.get('ADDR2')}" ></td></tr>
</table>

</body>
</html>