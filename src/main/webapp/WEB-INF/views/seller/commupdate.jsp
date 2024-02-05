<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<script>
        function setMinDate() {
            var today = new Date();
            today.setDate(today.getDate() + 7);
            var minDate = today.toISOString().split('T')[0];
            document.getElementsByName("startdate")[0].setAttribute('min', minDate);
            document.getElementsByName("enddate")[0].setAttribute('min', minDate);
        }
        function removeImage() {
            document.getElementById('imagePath').style.display = 'none';
            document.getElementById('delecte').style.display = 'none';
            document.getElementById('imageUpload').style.display = 'block';
            document.getElementById('imageDeleted').value = "true";
        }
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('imagePreview');
                output.src = reader.result;
                output.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
	</head>
	<body onload="setMinDate()">
		<h1>광고신청</h1>
		<form action="/seller/commupdatepro" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="companyid" value="${cdto.companyid}">
			<input type="hidden" name="num" value="${cdto.num}">
		<table>
			<tr>
				<td>광고명</td>
				<td><input type="text" name="comname" value = "${cdto.comname }" required></td>
			</tr>
			<tr>
				<td>광고 이미지</td>
				<td>
					<img id="imagePath" src="${imagePath}" alt="${cdto.comfile}"/>
                    <button type="button" id = "delecte" onclick="removeImage()">삭제</button>
                    <div id="imageUpload" style="display:none;">
				        <input type="file" name="comfile" onchange="previewImage(event)"/>
				        <img id="imagePreview" style="display:none;"/>
				    </div>
				</td>
			</tr>
			<tr>	
				<td>기간</td>
				<td>
                    시작: 
                    <input type="date" name="startdate" required
                           value="<fmt:formatDate value='${cdto.startdate}' pattern='yyyy-MM-dd' />">
                    종료: 
                    <input type="date" name="enddate" required
                           value="<fmt:formatDate value='${cdto.enddate}' pattern='yyyy-MM-dd' />">
                </td>
			</tr>
		</table>
		<input type="submit" value="등록">
		</form>
	</body>
</html>