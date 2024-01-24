<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="/resources/js/member2.js"></script>
<meta charset="UTF-8">
<title>관심상품</title>
</head>
<body>
<h1>찜</h1>
<c:if test="${empty wishList }">
	관심상품이 없습니다.	
</c:if>
<c:if test="${!empty wishList }">
	<c:choose>
		<c:when test="${checkedFolder=='전체' }">
			<button type="button">전체</button>
		</c:when>
		<c:otherwise>
			<button type="button" onclick="chooseFolder('전체')" style="color:gray">전체</button>
		</c:otherwise>
	</c:choose>
	<c:forEach var="folder" items="${folder }">
		<c:choose>
			<c:when test="${checkedFolder==folder }">
				<button type="button" >${folder}</button>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="chooseFolder('${folder}')" style="color:gray">${folder}</button>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<table border="1">
	<tr>
		<td><input type="checkbox" name="chk_all" id="chk_all" onclick="checkAll()" value="all"/></td>
		<td>상품명</td><td>이미지</td>
	</tr>

<c:set var="i" value="0"/>
<c:forEach var="wish" items="${wishList }">
	<c:if test="${checkedFolder=='전체' }">
		<tr>
		<td><input type="checkbox" name="num" onclick="updateCheckAll()" value="${wish.num }"></td>
		<td><a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
		onclick="getProductCodeANDtoDetail('${wish.product}')">${wish.product }</a></td>
		<td><a href="javascript:void(0)" onclick="getProductCodeANDtoDetail('${wish.product}')"><img src="${imgPaths.get(i) }" width="100"/></a></td>
	</tr>
	</c:if>
	<c:if test="${checkedFolder!='전체'&&wish.folder.contains(checkedFolder) }">
	<tr>
		<td><input type="checkbox" name="num" onclick="updateCheckAll()" value="${wish.num }"></td>
		<td><a href="javascript:void(0)" style="text-decoration-line : none; color:black;" 
		onclick="getProductCodeANDtoDetail('${wish.product}')">${wish.product }</a></td>
		<td><a href="javascript:void(0)" onclick="getProductCodeANDtoDetail('${wish.product}')"><img src="${imgPaths.get(i) }" width="100"/></a></td>
	</tr>
	</c:if>
<c:set var="i" value="${i+1}" />
</c:forEach>
</table>
<table>
<tr><td>
<button type="button" onclick="deleteSelectedItems()">선택 상품 삭제</button>
<c:if test="${checkedFolder!='전체' }">
<button type="button" onclick="moveSelectedItems('${checkedFolder}')">폴더 변경하기</button>
</c:if>
</td></tr>
</table>
</c:if>	
</body>
</html>

