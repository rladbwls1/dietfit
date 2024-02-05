<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>    
<script>
	function fileAdd(type, sectionIdSelector) {
	    var fileInputDiv = $('<div class="file-input-wrapper"></div>');
	    var fileInput = $('<input type="file" name="' + type + '" multiple>');
	    var deleteButton = $('<button type="button">삭제</button>');
	    var previewDiv = $('<div class="file-preview"></div>');
	
	    fileInput.on('change', function(event) {
	        var files = event.target.files;
	        for (var i = 0; i < files.length; i++) {
	            var file = files[i];
	            var reader = new FileReader();
	
	            reader.onload = function(e) {
	                var img = $('<img>').attr('src', e.target.result);
	                img.css('width', '100px');
	                img.css('height', 'auto');
	                previewDiv.append(img);
	            };
	
	            reader.readAsDataURL(file);
	        }
	    });
	
	    deleteButton.click(function() {
	        $(this).parent().remove();
	    });
	
	    fileInputDiv.append(fileInput).append(deleteButton).append(previewDiv);
	    $(sectionIdSelector).append(fileInputDiv);
	}
	function removeImage(wrapperId,productNum,fileName) {
		var c = confirm("썸네일을 삭제하시겠습니까?");
		if(c == true){
			
			$.ajax({
				url : '/seller/thumbnailDelete',
				data : {imgNum:wrapperId,num:productNum,fileName:fileName },
				success:function(){
					alert("삭제 되었습니다.");	
				}
			});
			
			var element = document.getElementById('thumbnailWrapper'+wrapperId);
	        if (element) {
	            element.style.display = 'none'; // 요소를 숨김 처리
	            element.remove(); // 요소를 완전히 제거하려면 이 코드 사용
	        }	
		}
    }
</script>
<form action="/seller/thumbnailUpdatePro" method="post" enctype="multipart/form-data">
   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
   	<input type="hidden" name="companyid" value="${companyid}">
    <input type="hidden" name="num" value="${num}">
    <input type="hidden" name="isfile" value="${isfile}">
    <input type="hidden" name="category" value="${category}">
    <input type="hidden" name="category2" value="${category2}">
    <input type="hidden" name="flavor" value="${flavor}">
	<div id="thumbnailSection">
	    <label>썸네일:</label>
	    <c:forEach items="${thumimages}" var="thumbImg">
		    <div class="image-wrapper" id="thumbnailWrapper${thumbImg.num}">
		        <img src="/resources/p_img/${thumbImg.fileName}" alt="Thumbnail" class="preview-image" width="100"/>
		        <button type="button" onclick="removeImage('${thumbImg.num}','${num}','${thumbImg.fileName}')">삭제</button>
		        <input type="hidden" name="thumfileName" value="${thumbImg.fileName}">
		        <input type="hidden" name="thumnum" value="${thumbImg.num}">
		    </div>
		</c:forEach>
	</div>
	<input type="button" class="fileAdd" value="썸네일 추가" onclick="fileAdd('thumbnails', '#thumbnailSection')">
	<br />
	<input type="submit" value="수정" />
</form>





