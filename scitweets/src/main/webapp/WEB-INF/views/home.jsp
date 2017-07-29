<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
=======
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
>>>>>>> ae706e2fec0a13209acf8101b663362c00b06e1d
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SciTweets</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.columnscroll {
	overflow-y: scroll;
	padding: 20px;
}
</style>
</head>
<body>
	<div style="background-color: #000000" class="container-fluid">
<<<<<<< HEAD
		<h1 style="font: monaco; font-size: 14pt; color: #FFFFFF">
			<center> About SciTweets </center> </h1>
		<h2 style="font: monaco; padding: 30px; font-size: 9.5pt; color: #add8e6"> <left> SciTweets is the premier way to keep current with the fast-paced world of scientific research and technological development.<br> <br>
			Rather than having paid subscriptions to individual research journals, stay up-to-date with SciTweets.<br> <br> Simply click on a scientific organization or researcher
			and SciTweets will filter their social media posts and return only the scientific news from the account. <br><br> Along with displaying the news, a summary of the article and a hyperlink to the original article will be given. 
			 </left></h2>
		<h3 style = "font: monaco; font-size: 14pt; padding: 20px; color: #FFFFFF"> <center> About the Creators </center> </h3>
		<h4 style="font: monaco; font-size: 12pt; color: #FFFFFF">
			<center> Adith Arun </center> </h4>
		<h5 style="font: monaco; padding: 15px; font-size: 9.5pt; color: #add8e6"> <center> Adith Arun will be a senior at Mira Loma High School in the fall of 2017. Adith is an avid science enthusiast. He also loves to code and his favorite language is Python. He wants to start a company in the future. Adith enjoys playing late-night basketball and traveling the world to experience different cultures and people.</center> </h5>
		<h6 style="font: monaco; font-size: 12pt; color: #FFFFFF">
			<center> Marc D'Mello </center> </h6>
		<h7 style="font: monaco; padding: 15px; font-size: 9.5pt; color: #add8e6"> <center> Marc D'Mello will be a senior at Mira Loma High School in the fall of 2017. Marc is a coder who prefers back-end develompent. Marc wants to start a company in the future. He also enjoys swimming, serving as a life guard, and playing League of Legends. Marc wants to pursue a career in computer science research in the future. </center> </h7>
		<!--  <h9 style="font: monaco; padding: 15px; font-size: 16pt; color: #FFFFFF"> <center> </center> </h9>
		<h10 style="font: monaco; padding: 30px; font-size: 11pt; color: #add8e6"> <left> The original idea for SciTweets was born from a long disucssion the two co-creators first had in late April. From there, they saw the need for   </left> </h10>-->
	</div>
	<div style="position: relative; padding: 300px; margin: auto; background-color: #000000">
		<h8
			style="font-size: 10pt; font: monaco; background-color: #000000; position: fixed; bottom: 0; text-align: center; color: #FFFFFF">
			<a href="mailto:scitweets.filter@gmail.com"> Contact Us With Any Suggestions, Comments, or Questions</a>
		</h8>
=======
		<center>
			<h1 style="font: monaco; font-size: 20pt; color: #FFFFFF">
				SciTweets: Keep Current With The Latest Advancements In The
				Scientific World</h1>
		</center>
		<center>
			<h5 style="font: monaco; font-size: 13pt; color: #add8e6">Click
				on a Twitter User or Organization and Read About the Latest Science
				News</h5>
		</center>
		<!--  <img src="${pageContext.servletContext.contextPath}/images/Logo.png" alt="SciTweets"
			style="position: absolute; top: 6px; left: 706px; width: 285px; height: 123px;"/> -->
		<div class="row">
			<div class="col-sm-3 columnscroll" id="left"
				style="background-color: #000000; height: 100vh">
				<c:forEach items="${accounts}" var="account">
					<form method="POST" action="/home" style="padding-bottom: 12px;">
						<input type="hidden" name="user" value="${account.username}" /> <input
							type="submit" value="${account.name}" class="btn btn-primary" />
					</form>
				</c:forEach>
			</div>
			<div class="col-sm-9 columnscroll" id="right"
				style="background-color: #000000; height: 100vh">
				<c:forEach items="${tweets}" var="tweet">
					<h2 style="font: monaco; font-size: 15pt; color: #add8e6">
						<a href="${tweet.url}" target="_blank"> ${tweet.url}</a>
					</h2>
					<h3 style="font: monaco; font-size: 12pt; color: #FFFFFF">${tweet.description}</h3>
				</c:forEach>
			</div>
		</div>
		<div style="position: relative">
			<h4
				style="font-size: 8pt; font: monaco; position: fixed; bottom: 0; width: 100%; text-align: center; color: #FFFFFF">
				<a href="mailto:scitweets.filter@gmail.com"> Contact Us</a> <a
					href="/about"> &nbsp;&nbsp;About Us</a>
			</h4>
		</div>
>>>>>>> ae706e2fec0a13209acf8101b663362c00b06e1d
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>