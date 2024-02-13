function asd(){
	if(!$('#nicaddr').val()){
		alert("배송지 별명을 입력하세요.");
		return false;
	}
	if(!$('#receiver').val()){
		alert("받는 분 성함을 입력하세요.");
		return false;
	}
	if(!$('#phone').val()){
		alert("전화번호를 입력하세요.");
		return false;
	}
	if(!$('#sample6_postcode').val()){
		alert("우편번호를 입력하세요.");
		return false;
	}
	if(!$('#sample6_address').val()){
		alert("주소를 입력하세요.");
		return false;
	}
	if(!$('#sample6_detailAddress').val()){
		alert("상세주소를 입력하세요.");
		return false;
	}
}

function deleteDelivery(nicaddr){
	$.ajax({
		url:'deleteDelivery',
		type:'post',
		async:false,
		data:{nicaddr:nicaddr},
		success:function(a){
			window.location.reload();
		}
	});
}
function checkNicaddr(){
	if(!$('#nicaddr:checked').val()){
		alert('배송지를 선택해주세요.');
		return false;
	}
}