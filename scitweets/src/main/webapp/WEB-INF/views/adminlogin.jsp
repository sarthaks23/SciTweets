<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
</head>
<body>
	<h1>Admin Login</h1>
	<form action="/adminlogin" method="POST">
		Username: <br> <input type="text" name="username"> <br>
		Password: <br> <input type="password" name="password"> <br>
		<input type="submit" value="Login">
	</form>
	<p style="color: red">${errorMessage}</p>
</body>
</html>