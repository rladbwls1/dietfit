
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Discount</title>
</head>
<body>
    <h2>Add Discount</h2>
    <form action="/seller/addDiscount" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <label for="start">Start Date:</label>
        <input type="date" id="start" name="start" required>
        <br>

        <label for="end">End Date:</label>
        <input type="date" id="end" name="end" required>
        <br>

        <label for="sale">Discount Rate (%):</label>
        <input type="number" id="sale" name="sale" min="0" max="100" required>
        <br>

        <!-- 상품 번호를 전달하기 위한 hidden input -->
        <input type="hidden" id="num" name="num" value="${num}">

        <input type="submit" onclick="closewindow()" value="Add Discount">
    </form>
     <script>
    function closewindow() {

        window.close();
        closewindow2();
    }
</script>
</body>
</html>
