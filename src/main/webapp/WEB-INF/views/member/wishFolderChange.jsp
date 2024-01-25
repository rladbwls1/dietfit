<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/member2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<c:forEach var="folder" items="${folderNames }">
	<c:if test="${folder!='분류없음'&&!folder.contains(',') }">
	<tr>
		<td>${folder }</td>
		<td>
		<c:choose>
		<c:when test="${folder==checkedFolder }">
			<input type="checkbox" name="folder2" checked value="${folder}">
		</c:when>
		<c:otherwise>
			<input type="checkbox" name="folder2" value="${folder}">
		</c:otherwise>
		</c:choose>
		</td>
	</tr>
	</c:if>
</c:forEach>

</table>

<table>
	<tr><td><button type="button" onclick="changeFolder('${products}')">폴더 변경하기</button></td>
	<td><button type="button" onclick="showNewFolder()">새 폴더로 옮기기</button></td></tr>
	<tr id="newFolderTr" style="visibility:hidden;"><td>
		<input type="text" id="newFolder" name="newFolder"/>
	</td><td>
		<button type="button" onclick="retrun changeNewFolder('${products}')">완료</button>
	</td></tr>
</table>
</body>
</html>