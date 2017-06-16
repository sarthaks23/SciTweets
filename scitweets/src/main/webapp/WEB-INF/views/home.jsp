<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SciTweets</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.columnscroll {
	overflow-y: scroll;
	padding: 15px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1>Home</h1>
		<div class="row">
			<div class="col-sm-4 columnscroll" id="left" style="background-color: #b3d1ff; height: 90vh">
				<c:forEach items="${accounts}" var="account">
					<form method="POST" action="/home" style="padding-bottom:15px;">
						<input type="hidden" name="user" value="${account.username}" /> 
						<input type="submit" value="${account.name} (${account.username})" class="btn btn-primary" />
					</form>
				</c:forEach>
			</div>
			<div class="col-sm-8 columnscroll" id="right" style="background-color: #ffb3b3; height: 90vh">
				<c:forEach items="${tweets}" var="tweet">
					<h2 class="text-primary" style="font:monaco; font-size:17pt">${tweet.username}:&nbsp;&nbsp;${tweet.tweet}</h2>
					<h3 class="text-success">${tweet.description}</h3>
				</c:forEach>
			</div>
		</div>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>