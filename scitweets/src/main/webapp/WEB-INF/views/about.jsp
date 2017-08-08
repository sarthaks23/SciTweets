

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
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Raleway" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.spacer{
	margin: 0;
	padding-top: 15%;
}
h1 {
    margin: 0;
}

 h3 {
    font-family: 'Jazz LET', fantasy;
    
 }
 h5 {
 	position: absolute;
 	top: 3px;
 	left:3px;
 }

 .stylebutton {
 	/* change some of this up*/
    text-transform: uppercase;
    font-size: 13px;
    font-weight: 400;
    font-family: avant garde;
    letter-spacing: 2px;
}
.missionrainbow{
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
  
  font-family:Raleway; 
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
<<<<<<< HEAD
<body>

<body>
    <div class="Opener">
        <div class="container">
        	<h5> 
        			<a href = "mailto:scitweets.filter@gmail.com"> 
        				<button class = "btn btn-default btn-sm">
        					<span class = "glyphicon glyphicon-envelope"> </span> 
        					<span class = "stylebutton"> Contact</span>
        					
        				</button>
        			</a>
        	</h5>
        	<div class = "spacer">
                        <h1 class = "rainbow">SciTweets</h1>
                        <h3> Keep Current With the Latest Advancements In The Scientific World</h3>
                        <ul class="list-inline buttons ">
                             <li>
                                <a href="/blog" class="btn btn-default btn-lg"> <!-- change the button type? and uppercase, coloring? -->
                                    <span class="stylebutton">Blog</span></a>
                            </li>
                            <li>
                                <a href="/newsengine" class="btn btn-default btn-lg">
                                    <span class="stylebutton">News Engine</span></a>
                            </li>
                            <li>
                                <a href="/about" class="btn btn-default btn-lg">
                                    <span class="stylebutton">About Us</span></a>
                            </li>        
                           
                        </ul>
                  </div>
            </div>
        </div>
=======
<body style="background-color: #000000">
	<div style="background-color: #000000" class="container-fluid">
		<center>
			<h1 style="font: monaco; font-size: 30pt; color: #FFFFFF">About
				SciTweets</h1>
		</center>
		<center>
			<h2
				style="font: monaco; padding: 20px; font-size: 30px; color: #add8e6">
				Our Mission</h2>
		</center>
		<blockquote>
			<p style="font-family: Avant garde; font-size: 20px; color: #FFFFFF">
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
			<footer> SciTweets Team </footer>
		</blockquote>
		<h9 style="font-family:Avant garde; font-size: 25px; color: #add8e6">
		<center>Suggestions or Comments? E-mail
			scitweets.filter@gmail.com</center>
		</h9>
		<br>
		<h8 style="font:monaco; font-size: 18; color: #E6E6FA"> We
		welcome any suggestions, comments, or improvements. Let us know if
		there is something we should add to our website design, new twitter
		accounts to analyze, any issues with the service, or anything else.
		Please email scitweets.filter@gmail.com. </h8>
		<center>
			<h3
				style="font: monaco; padding: 20px; font-size: 30px; color: #add8e6">
				The Advantage of Using SciTweets</h3>
		</center>
		<p style="font-family: Avant garde; font-size: 20px; color: #FFFFFF">Most
			science textbooks typically are filled with concepts but lack real
			world experiments showing those concepts in action. When experiments
			are discussed in these textbooks, they are out of date.To augment
			your learning experience, and show you the theoretical concepts in
			action, the SciTweets News Engine serves as a freely accessible
			catalog of up-to-date research experiments. Through our Blog site, we
			present these current research articles in a easy to understand way
			suitable for non-technical people as well! SciTweets is the perfect
			destination whether you want to learn more about science, see
			theoretical principles in action, or casually scroll through
			articles.</p>
		<center>
			<h7
				style="font: monaco; padding: 20px; font-size: 30px; color: #add8e6">
			Meet the Creators </h7>
		</center>
		<h4 style="font: monaco; font-size: 20px; color: #add8e6">Adith
			Arun</h4>


		<h5
			style="padding-bottom: 10px; font-family: Avant garde; font-size: 20px; color: #FFFFFF">Adith
			Arun will be a senior at Mira Loma High School in the fall of 2017.
			Adith is an avid science enthusiast. He also loves to code and his
			favorite language is Python. He wants to start a company in the
			future. Adith enjoys playing late-night basketball, and traveling the
			world.</h5>

		<h6 style="font: monaco; font-size: 20px; color: #add8e6">Marc
			D'Mello</h6>

		<p style="font-family: Avant garde; font-size: 20px; color: #FFFFFF">Marc
			D'Mello will be a senior at Mira Loma High School in the fall of
			2017. Marc is a self-taught coder. He also enjoys swimming, is a life
			guard, and plays League of Legends. His favorite language is Java.
			Marc wants to pursue a career in computer science research in the
			future.</p>

		<div style="position: relative; color: #FFFFFF">
			<h4
				style="font-size: 11.5pt; font: monaco; bottom: 0; width: 100%; text-align: center; color: #000000">
				<a href="mailto:scitweets.filter@gmail.com"> Contact Us</a>&nbsp;&nbsp; <a
					href="/newsengine">News Engine</a> &nbsp;&nbsp;<a href="/blogs">Blogs</a>
			</h4>
		</div>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
>>>>>>> 3879e18d7e7711a32f658c9c1c71c174326837ae
</body>
</html>