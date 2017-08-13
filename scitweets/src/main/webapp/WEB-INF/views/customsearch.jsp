<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Custom Search</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>
input[type=text] {
	width: 100%;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	padding: 12px 20px 12px 20px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}
</style>
</head>
<!-- Needs to be edited -->
<body onload="showHtml('${error}')">
	<center>Sci Tweets</center>
	<form onsubmit="loadingMessage();">
		<input type="text" name="handlerequest"
			placeholder="Enter handle here..." action="/customsearch">
	</form>
	<br>
	<p id="loading"></p>
	<center id="resultHTML" style="display: none;">Results:</center>
	<center class="alert alert-warning" style="display: none;"
		id="noTweetAlert">Sorry, there are no valid tweets from this
		user</center>
	<center class="alert alert-danger" style="display: none;"
		id="noUserFoundAlert">No user with this name was found</center>
	<c:forEach items="${tweets}" var="tweet">
		<p>${tweet.tweet}</p>
		<p>
			<a href="${tweet.url}">${tweet.url}</a>
		</p>
		<br>
	</c:forEach>
	<script>
		function loadingMessage() {
			document.getElementById('loading').innerHTML = 'Please wait. There is a lot to process so it might take up to 2 minutes...';
			document.getElementById('loading').setAttribute("class",
					"alert alert-info");
		}
	</script>
	<script>
		function showHtml(errorMessage) {
			if (errorMessage == "none") {
				document.getElementById('resultHTML').setAttribute("style",
						"display: show;");
			} else if (errorMessage == "noValidTweets") {
				document.getElementById('noTweetAlert').setAttribute("style",
						"display: show;")
			} else if (errorMessage == "handleNotFound") {
				document.getElementById('noUserFoundAlert').setAttribute(
						"style", "display: show;")
			}
		}
	</script>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>