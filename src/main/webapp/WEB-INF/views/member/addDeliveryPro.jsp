<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<input type="hidden" id="result" value="${result }"/>
<body>
<script>
$(document).ready(function(){
    if($('#result').val()!=1){
    	if(confirm("배송지가 추가되었습니다.")){
    		window.location.href="userDelivery";
    	}else{
    		window.location.href="userDelivery";
    	}
    }else{
    	if(confirm("다른 별명을 적어주세요.")){
    		window.history.go(-1);
    	}else{
    		window.history.go(-1);
    	}
    }
 });
</script>

</body>
</html>