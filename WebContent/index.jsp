<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,com.app.helper.ConnectionProvider" %>
<%@ page import="com.app.entities.Message" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <link rel="stylesheet" href="css/home.css" type="text/css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<title>Hello, world!</title>
	</head>
	<body class="">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark pl-3 pr-3">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					  Multiverse
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						  <a class="dropdown-item" href="#">K-TODO App</a>
						  <a class="dropdown-item" href="https://kaustuvasahu.netlify.app" target="_blank">Portfolio</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="container-fluid rounded-0  p-0 m-0">
		
			<%
				Message msg = (Message)session.getAttribute("global");
				
				if(msg!=null){
					%>
						<div class="alert alert-dark alert-dismissible fade show">
							<%= msg.getContent() %>
						</div>
					<%
					session.removeAttribute("global");
				}
			%>
			<div class="jumbotron bg-dark text-white rounded-0">
				<div class="container">
					<h3 class="display-3">Welcome to my Blog App</h3>
					<p>Hello and thank you for visiting my blog app. To begin, you must first register. 
						Learn more about me by visiting my portfolio. Kaustuva kumar Sahu created this with 
						love, so please leave your comments.
					</p>
					
					<a class="btn btn-outline-light btn-lg" href="signup.jsp" target="_blank"> Login </a>
					<a class="btn btn-outline-light btn-lg" href="login.jsp" target="_blank"> Sign up</a>
				
				</div>
			</div>
		</div>
		<div class="container">
			<div class="card-columns">
				<div class="card">
					<img class="card-img-top" src="http://via.placeholder.com/1600x900/483D8B/ffffff?text=Card+1" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title that wraps to a new line</h5>
						<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					</div>
				</div>
				<div class="card p-3">
					<blockquote class="blockquote mb-0 card-body">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
						<footer class="blockquote-footer">
							<small class="text-muted">
							Someone famous in <cite title="Source Title">Source Title</cite>
							</small>
						</footer>
					</blockquote>
				</div>
				<div class="card">
					<img class="card-img-top" src="http://via.placeholder.com/1600x450/9400D3/ffffff?text=Card+2" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
						<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					</div>
				</div>
				<div class="card bg-primary text-white text-center p-3">
					<blockquote class="blockquote mb-0">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
						<footer class="blockquote-footer">
							<small>
							Someone famous in <cite title="Source Title">Source Title</cite>
							</small>
						</footer>
					</blockquote>
				</div>
				<div class="card text-center">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
						<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					</div>
				</div>
				<div class="card">
					<img class="card-img" src="http://via.placeholder.com/1600x1600/FF1493/ffffff?text=Card+3" alt="Card image">
				</div>
				<div class="card p-3 text-right">
					<blockquote class="blockquote mb-0">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
						<footer class="blockquote-footer">
							<small class="text-muted">
							Someone famous in <cite title="Source Title">Source Title</cite>
							</small>
						</footer>
					</blockquote>
				</div>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
						<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					</div>
				</div>
			</div>
		</div>
		
		
		
			
	    
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="js/script.js"></script>
</html>