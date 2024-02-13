<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
    function submit() {
	        alert("저장되었습니다.");
	        window.opener.location.reload();
            window.close(); // 팝업 창 닫기
    }
 	// 페이지 로드 시 자동으로 실행되는 함수
    window.onload = function() {
        submit();
    };
	</script>
</body>
</html>