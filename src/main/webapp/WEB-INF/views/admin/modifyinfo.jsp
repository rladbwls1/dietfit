<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify_info</title>
<script src="/resources/js/jquery-3.7.1.min.js"></script> 
</head>
<script>
	$(function(){
		var infoNic = "${info.nic}"; // Java에서 가져온 값을 JavaScript 변수에 할당
        $("#btn").click(function(){
            if(infoNic === $("#nic").val()){
			$("#nic_check").text('동일한 닉네임입니다');
		}else{
			
		$.ajax({
			url: "/admin/NicCheck",
			data: {nic: $("#nic").val(),
					id: $("#id").val()},
			success: function(e){
				if(e == '0'){
					$("#nic_check").text('사용 가능한 닉네임입니다');
					$("#subBtn").prop("disabled", false);
				}else{
					$("#nic_check").text('사용 불가능한 닉네임입니다');
					$("#subBtn").prop("disabled", true);
				}
			}
		});		
		}
	});
});
</script>
<body>
		<h2>회원 기본 정보</h2>
		<form method="post" action="/admin/modify">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="id" name="id" value="${info.id}">
		<table border="1" style="border-collapse:collapse;">
			<tr> 
				<th>아이디</th>
				<td>${info.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" value="${info.name}" name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" value="${info.email}" name="email"></td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<select name="status">
					    <option value="1" ${info.status == 1 ? 'selected' : ''}>new</option>
					    <option value="2" ${info.status == 2 ? 'selected' : ''}>bronze</option>
					    <option value="3" ${info.status == 3 ? 'selected' : ''}>silver</option>
					    <option value="4" ${info.status == 4 ? 'selected' : ''}>gold</option>
					    <option value="0" ${info.status == 0 ? 'selected' : ''}>정지회원</option>
					    <option value="99" ${info.status == 99 ? 'selected' : ''}>탈퇴회원</option>
					    <option value="888" ${info.status == 888 ? 'selected' : ''}>판매자</option>
					    <option value="999" ${info.status == 999 ? 'selected' : ''}>관리자</option>
					</select>
				</td>
			</tr>
		</table>
	<h2>사이트 가입 정보</h2>
		<table border="1" style="border-collapse:collapse;">
			<tr>
				<th rowspan="2">주소</th>
				<td>기본<input type="text" name="addr1" id="sample5_address" placeholder="주소" value="${mem_info.addr1}">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				</td>
			</tr>
			<tr>
				<td>상세<input type="text" name="addr2" value="${mem_info.addr2}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" value="${mem_info.phone}" name="phone"></td>
			</tr> 
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" value="${info.nic}" id="nic" name="nic"><button type="button" id="btn">중복확인</button>
					<div id="nic_check"></div>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" value="<fmt:formatDate value="${mem_info.birth}" pattern="yyyy-MM-dd"/>" name="birth"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="1" ${mem_info.gender == 1 ? 'checked="checked"' : ''}>남자
					<input type="radio" name="gender" value="2" ${mem_info.gender == 2 ? 'checked="checked"' : ''}>여자
					<input type="radio" name="gender" value="0" ${mem_info.gender == 0 ? 'checked="checked"' : ''}>선택 안함
				</td>
			</tr>
		</table>
		<button id="subBtn" type="submit">등록</button>
		<button type="button" onclick="his();">취소</button>
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f913e82f349391b4ad71c6606ffa693&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<script>
	function his(){
		history.go(-1);
	}
</script>
</html>