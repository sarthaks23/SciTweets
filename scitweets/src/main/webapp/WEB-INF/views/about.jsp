<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Raleway" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="At SciTweets, we aim to make the current events in science available to everyone for free." />
<title>About SciTweets: Learn about our mission to make current
	science research easily accessible to everyone</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.columnscroll {
	overflow-y: scroll;
	padding: 20px;
}

.rainbow {
	/* Chrome, Safari, Opera */
	-webkit-animation: rainbow 20s;
	-webkit-animation-iteration-count: 3;
	/* Internet Explorer */
	-ms-animation: rainbow 20s;
	-ms-animation-iteration-count: 3;
	/* Standar Syntax */
	animation: rainbow 20s;
	animation-iteration-count: 3;
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
	
	h10 {
		position: absolute;
		top: 3px;
		left: 3px;
	}
	
	.headers {
		font-family: Raleway;
		font-weight: 400;
		font-size: 34px;
		color: #add8e6;
		text-align: left;
	}
	
	.text {
		font-family: avant garde;
		font-weight: 200;
		font-size: 18px;
		color: white;
		text-align: left;
		padding-top: 6px;
		padding-bottom: 3px;
	}
	
	.people {
		font-family: Raleway;
		font-weight: 300;
		font-size: 25px;
		color: lightpink;
		text-align: left;
		padding-top: 3px
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
<body style="background-color: #000000">
	<div style="background-color: #000000" class="container-fluid">
		<h10> <a href="mailto:scitweets.filter@gmail.com">
			<button class="btn btn-default btn-sm">
				<span class="glyphicon glyphicon-envelope"> </span> <span
					class="buttonstyle"> Contact</span>

			</button>
		</a> </h10>
		<center>
			<h1 class="rainbow"
				; style="font-family: Raleway; font-weight: 400; font-size: 50px; color: #FFFFFF">About
				SciTweets</h1>
			<ul class="list-inline buttons ">
				<li style="display: none;"><a href="/blogs"
					class="btn btn-default btn-sm"> <!-- change the button type? and uppercase, coloring? -->
						<span class="buttonstyle">Blog</span></a></li>
				<li><a href="/home" class="btn btn-default btn-sm"> <span
						class="buttonstyle">Home</span></a></li>
				<li><a href="/newsengine" class="btn btn-default btn-sm"> <span
						class="buttonstyle">News Engine</span></a></li>
				<li><a href="/customsearch" class="btn btn-default btn-sm">
						<span class="buttonstyle">Custom Tweet Search</span>
				</a></li>
			</ul>
		</center>
		<center>
			<h2 class="headers">Our Mission</h2>
		</center>
		<blockquote>
			<p class="text">
				SciTweets aims to make scientific research accessible to everyone
				for free. Through our News Engine, we analyze entire twitter feeds
				from many research institutions and organizations, and present their
				current research in a simple interface that is easy to operate. We
				eliminate the barriers towards accessing current scientific
				research, namely, the cost of paid-subscriptions and the need to use
				many different platforms to view the research. <br> <br>
				By presenting the latest happenings in the scientific world, we
				provide a platform where you can casually read scientific news,
				translate textbook reading into real world action, or become exposed
				to real world science. Through our Blog, we take the complicated
				research articles, and break them into digestable bits that are easy
				to understand.
			</p>
			<footer style="color: white"> SciTweets Team </footer>
		</blockquote>
		<h9 class="headers"> Suggestions or Comments? </h9>
		<br>
		<h8 class="text"> Contact: scitweets.filter@gmail.com. We welcome
		any suggestions, comments, or improvements. Let us know if there is
		something we should add to our website design, new twitter accounts to
		analyze, any issues with the service, or anything else. </h8>
		<center>
			<h3 class="headers">The Advantage of Using SciTweets</h3>
		</center>
		<p class="text">Most science textbooks typically are filled with
			concepts but lack real world experiments showing those concepts in
			action. When experiments are discussed in these textbooks, they are
			out of date.To augment your learning experience, and show you the
			theoretical concepts in action, the SciTweets News Engine serves as a
			freely accessible catalog of up-to-date research experiments. Through
			our Blog site, we present these current research articles in a easy
			to understand way suitable for non-technical people as well!
			SciTweets is the perfect destination whether you want to learn more
			about science, see theoretical principles in action, or casually
			scroll through articles.</p>

		<h7 class="headers"> Meet the Creators </h7>

		<h4 class="people">Adith Arun</h4>


		<h5 class="text">Adith Arun will be a senior at Mira Loma High
			School in the fall of 2017. Adith is an avid science enthusiast. He
			also loves to code and his favorite language is Python. He is
			interested in researching solutions to biological problems,
			especially cancer. Adith enjoys playing late-night basketball,
			fantasy football and traveling the world.</h5>

		<h6 class="people">Marc D'Mello</h6>

		<p class="text">Marc D'Mello will be a senior at Mira Loma High
			School in the fall of 2017. Marc is a self-taught coder. He also
			enjoys swimming, is a life guard, and plays League of Legends. His
			favorite language is Java. Marc wants to pursue a career in computer
			science research in the future.</p>

	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>