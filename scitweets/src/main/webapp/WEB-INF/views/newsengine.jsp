<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scitweets - Analyzing twitter feeds to display the latest
	research in science</title>
<meta name="description"
	content="Scitweets gives you access to the latest advancements in the scientific research community by analyzing 
	twitter feeds from hundreds of organizations and researchers. Each article is summarized and links for further 
	investigation are provided in an easy to use interface. " />
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');
	ga('create', 'UA-103553508-1', 'auto');
	ga('send', 'pageview');
</script>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.columnscroll {
	overflow-y: scroll;
	padding: 20px;
}

.affix {
	top: 20px
}
</style>
</head>
<body style="background-color: #000000"
	onload="showElement('${method}')">
	<div class="container-fluid">
		<center>
			<h1 style="font: monaco; font-size: 30pt; color: #FFFFFF">SciTweets
				News Engine</h1>
		</center>
		<center>
<<<<<<< HEAD:scitweets/src/main/webapp/WEB-INF/views/home.jsp
			<h5 style="font: monaco; font-size: 13pt; color: #add8e6">Click
				on a Category to Read the Latest Science News Curated From Many
				Cutting-Edge Sources</h5>
		</center>
		<center>
			<h5 style="font: monaco; font-size: 13pt; color: #add8e6">Current
				Twitter Account Displayed: ${name} (${username})</h5>
=======
			<div id="showOnPost">
				<h5 style="font: monaco; font-size: 13pt; color: #add8e6">Current
					Handle: ${name} (${username})</h5>
			</div>
>>>>>>> 3879e18d7e7711a32f658c9c1c71c174326837ae:scitweets/src/main/webapp/WEB-INF/views/newsengine.jsp
		</center>
		<div class="row">
			<div class="col-sm-3" id="left" style="background-color: #000000;">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="50">
					<c:forEach items="${categories}" var="category">
						<li style="padding-bottom: 10px">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button"
									data-toggle="dropdown">
									${category.categoryName} <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<c:forEach items="${category.accounts}" var="account">
										<li
											onclick="post('/newsengine', {user: '${account.username}', name: '${account.name}'}); loadingMessage();
											instantHideInstructions();"
											style="padding-left: 3px; padding-right: 4px">${account.name}</li>
									</c:forEach>
								</ul>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-sm-9" id="right" style="background-color: #000000;">
				<p id="loading"></p>
<<<<<<< HEAD:scitweets/src/main/webapp/WEB-INF/views/home.jsp
				<p onload="showInstructions(${instruction})" id="instructions"></p>
=======
				<div id="showOnGet" style="display: none;">
					<p
						style="font: monaco; font-size: 15pt; color: #add8e6; padding-top: 100px;">
						1) Click on one of the buttons of your choice on the left side of
						the screen <br> 2) On the dropdown menu, select an
						organization of your choice <br> <strong>3) For each
							article, a hyperlink is provided and a short summary of that
							article is provided underneath (so you can decide if you want to
							read more)</strong>
					</p>
				</div>
>>>>>>> 3879e18d7e7711a32f658c9c1c71c174326837ae:scitweets/src/main/webapp/WEB-INF/views/newsengine.jsp
				<c:forEach items="${tweets}" var="tweet">
					<h2 style="font: monaco; font-size: 15pt; color: #add8e6">
						<a href="${tweet.url}" target="_blank"> ${tweet.url}</a>
					</h2>
					<h3 style="font: monaco; font-size: 12pt; color: #FFFFFF">${tweet.description}</h3>
				</c:forEach>
			</div>
		</div>
		<h4
<<<<<<< HEAD:scitweets/src/main/webapp/WEB-INF/views/home.jsp
			style="font-size: 11.5pt; font: monaco; bottom: 0; width: 100%; text-align: center; color: #FFFFFF">
			<a href="mailto:scitweets.filter@gmail.com"> Contact Us</a> 
			<a href = "/about" > About Us</a>
=======
			style="font-size: 11.5pt; font: monaco; bottom: 0; width: 100%; text-align: center; color: #000000">
			<a href="mailto:scitweets.filter@gmail.com"> Contact Us</a>&nbsp;&nbsp;
			<a href="/newsengine">News Engine</a> &nbsp;&nbsp;<a href="/blogs">Blogs</a>
>>>>>>> 3879e18d7e7711a32f658c9c1c71c174326837ae:scitweets/src/main/webapp/WEB-INF/views/newsengine.jsp
		</h4>
	</div>
	<script>
		function post(path, params) {
			var form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", path);
			for ( var key in params) {
				if (params.hasOwnProperty(key)) {
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", key);
					hiddenField.setAttribute("value", params[key]);
					form.appendChild(hiddenField);
				}
			}
			document.body.appendChild(form);
			form.submit();
		}
	</script> 
	<script>
		function loadingMessage() {
			document.getElementById('loading').innerHTML = 'Please wait while the page loads. It might take a few seconds... Please contact scitweets.filter@gmail.com with any comments, suggesstions, or questions';
			document.getElementById('loading').setAttribute("class",
					"alert alert-info");
			document.getElementById('loading').setAttribute("style",
					"font-weight: bold;")
		}
	</script>
	<script>
		function showElement(method) {
			if (method == "get") {
				document.getElementById('showOnGet').setAttribute("style",
						"display: show");
				document.getElementById('showOnPost').setAttribute("style",
						"display: none");
			} else if (method == "post") {
				document.getElementsById('showOnPost').setAttribute("style",
						"display: show");
				document.getElementById('showOnGet').setAttribute("style",
						"display: none");
			}
		}
	</script>
	<script>
		function instantHideInstructions() {
			document.getElementById('showOnGet').setAttribute("style",
					"display: none");
		}
	</script>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>