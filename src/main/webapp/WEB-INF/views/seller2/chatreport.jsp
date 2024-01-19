<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>채팅 신고 폼</title>
</head>
<body>
<h2>채팅 신고 폼</h2>

<form id="reportForm" action="/seller/chatreportpro" method="post"  >
    <input type="hidden" name="roomnum" id="roomnum" value="${roomnum }" />
    
    <label for="id">사용자 아이디:</label>
    <input type="text" id="id" name="id" value ="${id}" readonly><br>

    <label for="text">신고 사유:</label>
    <textarea id="text" name="text" rows="4" cols="50" required></textarea><br>

    <button type="submit" onclick="return submitReport()">신고하기</button>
</form>

<script>
    function submitReport() {
    	var reportText = document.getElementById('text').value;
        if (reportText.trim() == "") {
            alert("신고 사유를 입력하세요.");
            return false; // 폼 제출을 막음
        }else{
	        alert("채팅이 신고되었습니다.");
	        window.close();
			closewindow2();
        }
    }
    function closewindow3(){
    	window.close();
		closewindow2();
    }
</script>

</body>
</html>
