<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			<div class="col-sm-4 columnscroll" id="left"
				style="background-color: #b3d1ff; height: 90vh">
				<form method="POST" action="/home" style="padding-bottom:15px;">
					<input type="hidden" name="user" value="@SU2C" /> 
					<input type="submit" value="Stand Up To Cancer (@SU2C)" class="btn btn-primary" />
				</form>
			</div>
			<div class="col-sm-8 columnscroll" id="right" style="background-color: #ffb3b3; height: 90vh">
				${tweets}
			</div>
		</div>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>