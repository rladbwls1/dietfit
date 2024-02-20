<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dietfit(Admin) - AllProduct</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>

<body>
	    <h3 class="mt-4">${companyDetail.id}님 상세보기</h3>
          		<button type="button" class="btn btn-warning" onclick="location.href='/admin/companyProduct?companyid=${companyDetail.companyid}'">판매목록 보기</button>
        
			<table class="table">
                <thead>
                   <tr>
		               <th scope="col">번호</th>
		               <th scope="col">회사주소</th>
		               <th scope="col">회사ID</th>
		               <th scope="col">회사명</th>
		               <th scope="col">사업자번호</th>
                     </tr>
                 </thead>
                 <tbody class="table-group-divider">
				   <tr>
				   	<td>${companyDetail.phone}</td>
					<td>${companyDetail.addr1}, ${companyDetail.addr2}</td>
					<td>${companyDetail.companyid}</td>
					<td>${companyDetail.company}</td>
					<td>${companyDetail.businessnum}</td>
				   </tr>
                </tbody>
            </table>
</body>
</html>