<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Admin Controls</h1>
	<h3>Add Handle:</h3>
	<form action="/addhandle" method="POST">
		Name: <br> <input type="text" name="name"
			placeholder="IE: Stand Up To Cancer"> <br> Username: <br>
		<input type="text" name="username" placeholder="IE: @SU2C"> <br>
		Category: <br> <input list="categories" name="category">
		<datalist id="categories">
			<c:forEach items="${categories}" var="category">
				<option value="${category.categoryName}">
			</c:forEach>
		</datalist> <br>
		<br> <input type="submit" value="Add" onclick="warningMessage();">
		<p style="color: red">${errorAddingHandle}</p>
	</form>
	<h3>Remove Handle:</h3>
	<form action="/removehandle" method="POST">
		Username: <br> <input type="text" name="username"
			placeholder="IE: @SU2C"> <br> <br> <input
			type="submit" value="Remove">
	</form>
	<br>
	<form action="/adminlogout" method="POST">
		<input type="submit" value="Logout">
	</form>
	<script>
		function warningMessage(){
			confirm("Are you sure you want to add this handle? Check to make sure the category is spelled right as well!");
		}
	</script>
</body>
</html>