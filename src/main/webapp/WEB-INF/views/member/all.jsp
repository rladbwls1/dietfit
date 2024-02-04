<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
  integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>
     
<h1>사용자외 모두 </h1>



<sec:authorize access="isAnonymous()">
<input type="button" value="로그인" onclick="javascript:window.location='/member/customLogin'">



</sec:authorize>


<sec:authorize access="isAuthenticated()">
<form action="/logout" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" value="로그아웃"/>
</form>
<br/><button type="button" onclick="javascript:window.location='/member/modifyForm'">정보수정</button>
<br/><button type="button" onclick="javascript:window.location='/member/productList'">상품목록</button>
<br/><button type="button" onclick="javascript:window.location='/member/wishList'">관심상품</button>
<br/><button type="button" onclick="javascript:window.location='/member/cartList'">장바구니</button>
<hr/>

	로그인된 유저 정보 : <sec:authentication property="principal"/> <br/>
	MemberDTO : <sec:authentication property="principal.dto"/> <br/>
	id : <sec:authentication property="principal.dto.id"/> <br/>
	name : <sec:authentication property="principal.dto.name"/> <br/>
	가입날짜 : <sec:authentication property="principal.dto.reg"/> <br/>
	등급: <sec:authentication property="principal.dto.status"/><br/>
</sec:authorize>

