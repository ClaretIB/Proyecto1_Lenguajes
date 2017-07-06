<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<spring:url value="/Resources/loginStyle.css" var="styleCSS" />
<spring:url value="/Resources/Food2.jpg" var="image" />

<link href='${styleCSS}' rel="stylesheet" />

<meta http-equiv="charset=utf-8" />
<title>Login</title>
</head>
<body>
<div id="loginWall" class="fullscreen landing parallax">
	<div class="overlay">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1>The Best App for your Restaurant</h1>
				</div>
				<div class="col-md-5">
					<div class="signup-header wow fadeInUpm animated">
						<h3 class="form-title text-center">Sign In</h3>
						<form class="form-header" action="j_spring_security_check" method="post" role="form" id="formLogin">
							<div class="form-group">
								<input class="form-control input-lg" id="userName" name="username" type="text" placeholder="Username" required="required" />
							</div>
							<div class="form-group">
								<input class="form-control input-lg" id="password" name="password" type="password" placeholder="Password" required="required" />
							</div>
							<div class="form-group last">
								<input type="submit" class="btn btn-warning btn-block btn-lg" value="Sign In" />
							</div>
							<p>Accept our terms and conditions and policies of cookies </p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="menu-sticky-wrapper" class="sticky-wrapper">
			<div id="menu">
				<nav class="navbar-wrapper navbar-default" role="navigation">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    			<span class="sr-only">Toggle navigation</span>
	                   		 	<span class="icon-bar"></span>
    	              		  	<span class="icon-bar"></span>
        	        	    	<span class="icon-bar"></span>
	                		</button>
                  		  	<a class="navbar-brand" href="#">App Name</a>
						</div>
                   		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                			<ul class="nav navbar-nav">
                    			<li>
      	                  			<a href="#">Home</a>
                    			</li>
                   				<li>
                        			<a href="#">Help</a>
                    			</li>
                    			<li>
                        			<a href="#">Contact</a>
                    			</li>
                			</ul>
	            		</div>
					</div>
				</nav>
			</div>
		</div>
		<div class="intro">
			<div class="container">
				<div class="row">
					<div id="Information" class="col-md-6">
					</div>
					<div id="imageFood" class="col-md-6">
						<img alt="" src='${image}' class="img-rounded" width="350" height="250">
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>