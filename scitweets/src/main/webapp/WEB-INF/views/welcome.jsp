<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="Scitweets is a news engine that displays the latest news in the scientific world" />
<title>Scitweets: Keep Current With the Scientific World</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Raleway" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
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
		padding-top: 15%;
	}
	
	h1 {
		margin: 0;
	}
	
	h3 {
		font-family: Jazz LET, fantasy;
	}
	
	h5 {
		position: absolute;
		top: 3px;
		left: 3px;
	}
	
	.stylebutton {
		/* change some of this up*/
		text-transform: uppercase;
		font-size: 13px;
		font-weight: 400;
		font-family: avant garde;
		letter-spacing: 2px;
	}
	
	.missionrainbow {
		padding-top: 100px;
		font-family: Raleway;
		font-size: 40px;
		font-weight: 400;
	}
	
	.rainbow {
		/* Chrome, Safari, Opera */
		-webkit-animation: rainbow 35s infinite;
		/* Internet Explorer */
		-ms-animation: rainbow 25s infinite;
		/* Standar Syntax */
		animation: rainbow 25s infinite;
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
</style>
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
</head>
<body>
<body>
	<div class="Opener">
		<div class="container">
			<h5>
				<a href="mailto:scitweets.filter@gmail.com">
					<button class="btn btn-default btn-sm">
						<span class="glyphicon glyphicon-envelope"> </span> <span
							class="stylebutton"> Contact</span>

					</button>
				</a>
			</h5>
			<div class="spacer">
				<h1 class="rainbow">SciTweets</h1>
				<h3>Keep Current With the Latest Advancements In The Scientific
					World</h3>
				<ul class="list-inline buttons ">
					<li><a href="/blogs" class="btn btn-default btn-lg"
						style="display: none;"> <!-- change the button type? and uppercase, coloring? -->
							<span class="stylebutton">Blog</span></a></li>
					<li><a href="/newsengine" class="btn btn-default btn-lg">
							<span class="stylebutton">News Engine</span>
					</a></li>
					<li><a href="/about" class="btn btn-default btn-lg"> <span
							class="stylebutton">About Us</span></a></li>
					<li><a href="/customsearch" class="btn btn-default btn-lg"> <span
							class="stylebutton">Custom Tweet Search</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>