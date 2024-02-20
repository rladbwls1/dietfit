function good(reviewnum){
	var id=$('#id').val();
	if(id==""){
		alert("로그인 후 이용하세요.");
	}else{
		
		$.ajax({
			url:'/review/Good',
			type:'post',
			data:{reviewnum:reviewnum,id:id},
			async:false,
			success:function(a){
				$('#event_'+reviewnum).attr("onclick","bye('"+reviewnum+"')");
				$('#review_'+reviewnum).attr("src","/resources/img/free-icon-love-4397571.png");
				var a=parseInt($('#recommend_'+reviewnum).text())+1;
				$('#recommend_'+reviewnum).text(a);
			}
		});
	
	}
}
function bye(reviewnum){
	var id=$('#id').val();
	$.ajax({
		url:'/review/Bye',
		type:'post',
		data:{reviewnum:reviewnum,id:id},
		async:false,
		success:function(a){
			$('#event_'+reviewnum).attr("onclick","good('"+reviewnum+"')");
			$('#review_'+reviewnum).attr("src","/resources/img/free-icon-love-7476962.png");
			var a=parseInt($('#recommend_'+reviewnum).text())-1;
			$('#recommend_'+reviewnum).text(a);
		}
	});
}
function deleteReview(reviewnum){
	
	$.ajax({
		url:'/review/delete',
		type:'post',
		data:{reviewnum:reviewnum},
		async:false,
		success:function(a){
			$('#review_'+reviewnum).hide();
		}
	});

	
	
	
}
window.onload = function() {
    var writerFullNameElements = document.querySelectorAll(".writerFullName");
    writerFullNameElements.forEach(function(writerFullNameElement) {
        var writerFullName = writerFullNameElement.textContent;
        if (writerFullName.length > 3) {
            var maskedName = writerFullName.substring(0, 3) + '*'.repeat(writerFullName.length - 3);
            writerFullNameElement.textContent = maskedName;
        }
    });
};

$(document).ready(function() {
	    // 첨부 파일 추가 함수
	    function fileAdd() {
	        var fileCount = $('#file-section input[type="file"]').length; // 현재 파일 입력란의 개수
	        if(fileCount < 3) { // 최대 3개까지만 추가 가능
	            var fileInput = $('<br/><input type="file" name="file" multiple>');
	            $('#file-section').append(fileInput);
	        }
	        if(fileCount >= 2) { // 파일 입력란이 3개 있을 경우 "+" 버튼 비활성화
	            $('.fileAdd').prop('disabled', true);
	        }
	    }
	
	    // 첨부 파일 제거 함수
	    function fileRemove() {
	        $('#file-section input[type="file"]:last').remove();
	        $('#file-section br:last').remove();
	        var fileCount = $('#file-section input[type="file"]').length;
	        if(fileCount < 3) { // 파일 입력란이 3개 미만일 경우 "+" 버튼 활성화
	            $('.fileAdd').prop('disabled', false);
	        }
	    }
	
	    // 파일 추가 버튼 클릭 이벤트 연결
	    $('.fileAdd').click(function() {
	        fileAdd();
	    });
	
	    // 파일 제거 버튼 클릭 이벤트 연결
	    $('.fileRemove').click(function() {
	        fileRemove();
	    });

});
function check(){
	result=false;
	if(confirm("리뷰는 등록 후 수정이 불가합니다.")){
		result=true;
	}
	return result;
}