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
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Raleway" />
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

	.rainbow {
		/* Chrome, Safari, Opera */
		-webkit-animation: rainbow 20s;
		-webkit-animation-iteration-count: 2;
		/* Internet Explorer */
		-ms-animation: rainbow 20s;
		-ms-animation-iteration-count: 2;
		/* Standar Syntax */
		animation: rainbow 20s;
		animation-iteration-count: 2;
		font-family: Raleway;
		font-size: 100px;
	}

	/* Chrome, Safari, Opera */
	@-webkit-keyframes rainbow{
		20%{color: red;}
		40%{color: yellow;}
		60%{color: green;}
		80%{color: blue;}
		100%{color: orange;}	
	}
	/* Internet Explorer */
	@-ms-keyframes rainbow{
		20%{color: red;}
		40%{color: yellow;}
		60%{color: green;}
		80%{color: blue;}
		100%{color: orange;}	
	}

	/* Standar Syntax */
	@keyframes rainbow{
		20%{color: red;}
		40%{color: yellow;}
		60%{color: green;}
		80%{color: blue;}
		100%{color: orange;}	
	}
	.buttonstyle {
		text-transform: uppercase;
		font-size: 13px;
		font-weight: 400;
		font-family: avant garde;
		letter-spacing: 2px;
	}
	.description {
		font-size: 17px;
		font-weight: 300;
		font-family: Avant Garde;
		color: white;
		text-align: left;
	}
	
	.url {
		font-size: 13px;
		font-weight: 200;
		font-family: Raleway;
		color: #add8e6
	}
	
	.break {
		width: 400px;
		border-top: 1px solid #f8f8f8;
		border-bottom: 1px solid white;
	}
	h10 {
		position: absolute;
		top: 3px;
		left: 3px;
	}
	
	.Opener {
		height: 100%;
		width: 100%;
		color: white;
		text-align: center;
		background-color: black;
		position: fixed;
		overflow: auto;
	}
	
	.spacer {
		margin: 0;
		padding-top: 10%;
	}
	
	.styleFORM {
		margin: 0;
		padding-top: 5%
	}
</style>
</head>
<body onload="showHtml('${error}')">
	<div class="Opener">
		<div class="container">
			<h10> <a href="mailto:scitweets.filter@gmail.com">
				<button class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-envelope"> </span> <span
						class="buttonstyle"> Contact</span>
				</button>
			</a> </h10>
			<div class="spacer">
				<h1 class="rainbow">SciTweets</h1>
				<center>
					<ul class="list-inline buttons ">
						<li style="display: none;"><a href="/blogs"
							class="btn btn-default btn-sm"> <span class="buttonstyle">Blog</span></a></li>
						<li><a href="/home" class="btn btn-default btn-sm"> <span
								class="buttonstyle">Home</span></a></li>
						<li><a href="/newsengine" class="btn btn-default btn-sm">
								<span class="buttonstyle">News Engine</span>
						</a></li>
						<li><a href="/about" class="btn btn-default btn-sm"> <span
								class="buttonstyle">About Us</span>
						</a></li>
					</ul>
				</center>
				<div class="styleFORM;"
					style="color: black; font-family: Raleway; font-weight: bold; font-size: 10px">
					<h6 style="font-family: Avant Garde; font-size: 15px">
						<form onsubmit="loadingMessage();">
							<input type="text" name="handlerequest"
								placeholder="Enter Twitter Username and Press Enter for Latest News" action="/customsearch">
						</form>
					</h6>
					<div id="loading">
						<h2 id="resultHTML"
							style="display: none; font-family: Avant Garde; font-size: 15px; color: white;">Results:</h2>
						<h3 class="alert alert-warning"
							style="display: none; font-family: Avant Garde; font-size: 15px"
							id="noTweetAlert">There are no valid tweets from this user.
							Please try again.</h3>
						<h4 class="alert alert-danger"
							style="display: none; font-family: Avant Garde; font-size: 15px"
							id="noUserFoundAlert">No user with this name was found.
							Please try again.</h4>
						<c:forEach items="${tweets}" var="tweet">
							<h3 class="description">${tweet.tweet}</h3>
							<h2 class="url">
								<a href="${tweet.url}" target="_blank" ${tweet.url}> Link To
									Full Article</a>
							</h2>
							<hr class="break">
							<br>
						</c:forEach>
						<script>
							function loadingMessage() {
								document.getElementById('loading').innerHTML = 'Please wait. There is a lot to process so it might take up to 2 minutes...';
								document.getElementById('loading')
										.setAttribute("class",
												"alert alert-info");
							}
						</script>
						<script>
							function showHtml(errorMessage) {
								if (errorMessage == "none") {
									document.getElementById('resultHTML')
											.setAttribute("style",
													"display: show;");
								} else if (errorMessage == "noValidTweets") {
									document.getElementById('noTweetAlert')
											.setAttribute("style",
													"display: show;")
								} else if (errorMessage == "handleNotFound") {
									document.getElementById('noUserFoundAlert')
											.setAttribute("style",
													"display: show;")
								}
							}
						</script>
						<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
						<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>