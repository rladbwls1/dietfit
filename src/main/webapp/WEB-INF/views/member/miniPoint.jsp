<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
<form>
보유 적립금: ${mypoint } <br/>
적림금 사용: <input type="text" pattern="[0-9]+" id="point" name="point" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); checkPoint('${mypoint }');"/> <br/>
<button type="button" onclick="useAllPoint('${mypoint }')" >적립금 모두 사용하기</button>
<button type="submit">결제하기</button>
</form>

</body>

<script>
function useAllPoint(mypoint){
	$('#point').val(mypoint);
}
function checkPoint(mypoint){
	if(parseInt($('#point').val())<0){
		$('#point').val(0);
	}
	if(parseInt($('#point').val())>parseInt(mypoint)){
		$('#point').val(mypoint);
	}
}
</script>

</html>
