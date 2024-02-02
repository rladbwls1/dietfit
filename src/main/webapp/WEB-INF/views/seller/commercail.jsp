<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		<form action="/seller/commercailpro" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="companyid" value="${companyid}">
		회사 아이디 : ${companyid}
		<table>
			<tr>
				<td>광고명</td>
				<td><input type="text" name="comname" required></td>
			</tr>
			<tr>
				<td>광고 이미지</td>
				<td>
					<input type="file" name="comfile" multiple onchange="previewImage(event)">
					<img id="imagePreview" style="display:none;"/>
				</td>
			</tr>
			<tr>
				<td>기간</td>
				<td>
                    시작: <input type="date" name="startdate" required>
                    종료: <input type="date" name="enddate" required>
                </td>
			</tr>
		</table>
		<input type="submit" value="등록">
		</form>
	</body>
</html>