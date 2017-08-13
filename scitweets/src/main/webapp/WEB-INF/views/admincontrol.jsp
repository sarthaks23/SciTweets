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
		</datalist>
		<br> <br> <input type="submit" value="Add"
			onclick="addWarningMessage();">
		<p style="color: red">${errorAddingHandle}</p>
	</form>
	<h3>Remove Handle/Category:</h3>
	<form action="/removehandle" method="POST">
		Username: <br> <input list="handles" name="handle" placeholder="IE: @SU2C" >
		<datalist id="handles">
			<c:forEach items="${accounts}" var="account">
				<option value="${account.username}">
			</c:forEach>
		</datalist> <br> <br> <input
			type="submit" value="Remove">
	</form>
	<br>
	<form action="/removecategory" method="POST">
		<br> Category: <br> <input
			list="categories" name="category">
		<datalist id="categories">
			<c:forEach items="${categories}" var="category">
				<option value="${category.categoryName}">
			</c:forEach>
		</datalist>
		<input type="submit" value="Remove" onclick="deleteCategoryWarning()">
	</form>
	<br>
	<form action="/adminlogout" method="POST">
		<input type="submit" value="Logout">
	</form>
	<script>
		function addWarningMessage() {
			confirm("Are you sure you want to add this handle? Check to make sure the category is spelled right as well!");
		}
	</script>
	<script>
		function deleteCategoryWarning() {
			confirm("Are you sure you want to delete this category? You cannot undo this action.");
		}
	</script>
</body>
</html>