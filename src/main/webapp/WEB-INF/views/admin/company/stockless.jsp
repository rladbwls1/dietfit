<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
  <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  
</head>
<body>
	<c:if test="${stocklesscount == 0}">
		<h5> 재고수가 20개 미만인 상품이 없습니다. </h5>
	</c:if>
	<c:if test="${stocklesscount > 0}">
		<button type="button" class="btn btn-outline-primary btn-lg" onclick="window.location.href='/admin/allProduct'"> 
			⬅
		</button>

	<button type="button" class="btn btn-outline-success" id="checkStock" onclick="checkstock()">✔상품재고✔</button>
		<table class="table">
	        <thead>
	            <tr>
	            	<th><input type="checkbox" name="allchk" id="allchk" onclick="allCheck()"/></th>
	            	<th>상품아이디</th>
	                <th>상품이름</th>
	                <th>가격</th>
	                <th>조회수</th>
	                <th>재고수</th>
	                <th>유통기한</th>
	                <th>전송유무</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="stockless" items="${stockless}">
	                <tr>
	                	<td><input type="checkbox" name="chk" id="chk" value="${stockless.product}" onclick="updateCheck()" /></td>
	                	<td>${stockless.companyid}${stockless.category}${stockless.category2}${stockless.flavor}</td>
	                    <td>${stockless.product}</td>
	                    <td>${stockless.price}</td>
	                    <td>${stockless.count}</td>
	                    <td>${stockless.stock}</td>
	                    <td>
	                    	<fmt:formatDate value= "${stockless.expiry}" pattern="yyyy-MM-dd"/>
	                    </td>
	                    <td></td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
    </c:if>
</body>

<script>
function allCheck() {
    const allChk = document.getElementById("allchk");
    const checkboxes = document.getElementsByName("chk");

    checkboxes.forEach((checkbox) => {
        checkbox.checked = allchk.checked;
    });
}

function updateCheck() {
    const allChk = document.getElementById("allchk");
    const checkboxes = document.getElementsByName("chk");
    let allChecked = true;

    checkboxes.forEach((checkbox) => {
        if (!checkbox.checked) {
            allChecked = false;
        }else{
        	
        }
    });
    allChk.checked = allChecked;
}

function checkstock(){
	const checkboxes = document.getElementsByName("chk");
	const selectedItems = [];
	checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
        	selectedItems.push(checkbox.value);
        }
    });
	
	$.ajax({
		url:'/admin/checkStock',
		type:'post',
		data:{product: selectedItems.join(',')},
		async:false,
		success:function(a){
			alert(a);
		}
	});
	
}
</script>
</html>