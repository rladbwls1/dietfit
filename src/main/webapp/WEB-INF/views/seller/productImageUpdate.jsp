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
		var c = confirm("이미지를 삭제하시겠습니까?");
		if(c == true){
			$.ajax({
				url : '/seller/productImageDelete',
				data : {imgNum:wrapperId,num:productNum,fileName:fileName },
				success:function(){
					alert("삭제 되었습니다.");	
				}
			});
			
	        var element = document.getElementById('imageWrapper'+wrapperId);
	        if (element) {
	            element.style.display = 'none'; 
	            element.remove();
	        }
		}
    }
</script>
<head>
	<style>
	    .image-wrapper {
	        margin-bottom: 10px;
	        border: 1px solid #ccc;
	        padding: 5px;
	        display: inline-block;
	    }
	
	    .preview-image {
	        max-width: 100px;
	        height: auto;
	        display: block;
	        margin-bottom: 5px;
	    }
	
	    button {
	        background-color: #fff;
	        color: #fff;
	        border: none;
	        padding: 5px 10px;
	        cursor: pointer;
	    }
	
	    button:hover {
	        background-color: #FAB8B5;
	    }
	
	    .fileAdd {
	        background-color: #fff;
	        color: #fff;
	        border: none;
	        padding: 8px 16px;
	        cursor: pointer;
	    }
	
	    .fileAdd:hover {
	        background-color: #C3E0FA;
	    }
	
	    input[type="submit"] {
	        background-color: #355FAD;
	        color: #fff;
	        border: none;
	        padding: 8px 16px;
	        cursor: pointer;
	    }
	
	    input[type="submit"]:hover {
	        background-color: #2B4C8A;
	    }
	</style>
</head>
<form action="/seller/productImageUpdatePro" method="post" enctype="multipart/form-data">
   	<input type="hidden" name="companyid" value="${companyid}">
    <input type="hidden" name="num" value="${num}">
    <input type="hidden" name="isfile" value="${isfile}">
    <input type="hidden" name="category" value="${category}">
    <input type="hidden" name="category2" value="${category2}">
    <input type="hidden" name="flavor" value="${flavor}">
	<div id="attachmentsSection">
		    <c:forEach items="${images}" var="img">
			    <div class="image-wrapper" id="imageWrapper${img.num}">
			        <img src="/resources/p_img/${img.fileName}" alt="Image" class="preview-image" width="100"/>
			        <button type="button" onclick="removeImage('${img.num}','${num}','${img.fileName}')">❌</button>
			        <input type="hidden" name="imgfileName" value="${img.fileName}">
			        <input type="hidden" name="imgnum" value="${img.num}">
			    </div>
			</c:forEach>
		</div>	
<input type="button" class="fileAdd" value="➕" onclick="fileAdd('attachments', '#attachmentsSection')">
<br>
<input type="submit" value="수정" />

</form>