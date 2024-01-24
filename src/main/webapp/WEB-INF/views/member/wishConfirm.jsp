<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심목록</title>
</head>
<body>
관심목록에 추가되었습니다. <br/>
장바구니로 가겠습니까? <br/>
<button type="button" onclick="toWishList()">찜으로 가기</button>
<button type="button" onclick="closeOpen()">쇼핑계속 하기</button>

</body>
</html>
<script>
function toWishList(){
	window.opener.location.href="wishList";
	window.close();
}
function closeOpen(){
	window.close();
}
</script>