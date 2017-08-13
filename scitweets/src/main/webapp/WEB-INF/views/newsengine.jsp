<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Raleway" />
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
	@
	-webkit-keyframes rainbow { 
		20%{
			color: red;
		}
		
		40%{
			color: yellow;
		}
		60%{
			color: green;
		}
		80%{
			color: blue;
		}
		100%{
			color: orange;
		}
	}
	/* Internet Explorer */
	@
	-ms-keyframes rainbow { 	
		20%{
			color: red;
		}
		
		40%{
			color: yellow;
		}
		60%{
			color: green;
		}
		80%{
			color: blue;
		}
		100%{
			color: orange;
		}
	}
	
	/* Standar Syntax */
	@
	keyframes rainbow { 	
		20%{
			color: red;
		}
		
		40%{
			color: yellow;
		}
		60%{
			color: green;
		}
		80%{
			color: blue;
		}
		100%{
			color: orange;
		}
	}
	.buttonstyle {
		text-transform: uppercase;
		font-size: 13px;
		font-weight: 400;
		font-family: avant garde;
		letter-spacing: 2px;
	}
	
	.styleInstructions {
		font-size: 15px;
		font-weight: 400;
		font-family: raleway;
		color: #add8e6;
		padding-top: 80px
	}
	
	.description {
		font-size: 15px;
		font-weight: 300;
		font-family: Avant Garde;
		color: white;
	}
	
	.url {
		font-size: 10px;
		font-weight: 200;
		font-family: Raleway;
		color: #add8e6
	}
	
	.break {
		width: 400px;
		border-top: 1px solid #f8f8f8;
		border-bottom: 1px solid white;
	}
	
	h4 {
		position: absolute;
		top: 3px;
		left: 3px;
	}
</style>
</head>
<body style="background-color: #000000"
	onload="showElement('${method}')">
	<div class="container-fluid">
		<h4>
			<a href="mailto:scitweets.filter@gmail.com">
				<button class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-envelope"> </span> <span
						class="buttonstyle"> Contact</span>

				</button>
			</a>
		</h4>
		<center>
			<h1 class="rainbow;"
				style="font-family: Raleway; font-weight: 400; font-size: 50px; color: #FFFFFF">SciTweets
				News Engine</h1>
			<ul class="list-inline buttons ">
				<li style="display: none;"><a href="/blogs"
					class="btn btn-default btn-sm"> <!-- change the button type? and uppercase, coloring? -->
						<span class="buttonstyle">Blog</span></a></li>
				<li><a href="/home" class="btn btn-default btn-sm"> <span
						class="buttonstyle">Home</span></a></li>
				<li><a href="/about" class="btn btn-default btn-sm"> <span
						class="buttonstyle">About Us</span></a></li>
				<li><a href="/customsearch" class="btn btn-default btn-sm">
						<span class="buttonstyle">Custom Tweet Search</span>
				</a></li>
			</ul>
		</center>
		<center>
			<div id="showOnPost">
				<h5
					style="font-family: Avant Garde; font-size: 20px; color: #add8e6">${name}&nbsp;|&nbsp;${numOfArticles}
					articles from the past ${months} month(s)</h5>
			</div>
		</center>
		<div class="row">
			<div class="col-sm-3" id="left" style="background-color: #000000;">
				<ul class="nav nav-pills nav-stacked" data-spy="affix"
					data-offset-top="50">
					<c:forEach items="${categories}" var="category">
						<li style="padding-bottom: 10px">
							<div class="dropdown">
								<button class="btn btn-default btn-md dropdown-toggle"
									type="button" data-toggle="dropdown">
									<span class="buttonstyle">${category.categoryName} </span><span
										class="caret"></span>
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
				<div id="showOnGet" style="display: none;">
					<p class="styleInstructions">
						1) Click on one of the buttons on the left side of the screen <br>
						<br> 2) On the dropdown menu, select an organization <br>
						<br> 3) For each article, a hyperlink and a short summary
						(underneath the link) is provided
					</p>
				</div>
				<c:forEach items="${tweets}" var="tweet">
					<h3 class="description">
						<strong>Summary:</strong> ${tweet.description}
					</h3>
					<h2 class="url">
						<a href="${tweet.url}" target="_blank" ${tweet.url}> Link To
							Full Article</a>
					</h2>
					<hr class="break">
				</c:forEach>
			</div>
		</div>
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
			document.getElementById('loading').innerHTML = 'Please wait. There is a lot to process so it might take up to 2 minutes...';
			document.getElementById('loading').setAttribute("class",
					"alert alert-info");
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
</html>