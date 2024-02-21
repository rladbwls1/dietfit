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