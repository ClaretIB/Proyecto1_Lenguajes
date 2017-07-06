<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<link href="Resources/style.css" rel="stylesheet">

<link href='${styleCSS}' rel="stylesheet" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="brand">App Name</div>
		<header>
        	<nav class="navbar navbar-inverse" role="navigation" >
            	<div class="container">
                	<div class="navbar-header" >
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
                        <a href="reporte">Options</a>
                    </li>
                    <li>
                        <a href="admin/store">Store</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
      				<li id="InicioSesion"><a href="<c:url value='/logout'/>"><span class="glyphicon glyphicon-user"></span> Cerrar Sesión</a></li>
    			</ul>
	            </div>
                </div>
            </nav>
		</header>
        <div class="col-md-2" >
        	<div class="list-group">
                <a >
            	<a href="sale" class="list-group-item active">New Sale</a>
               
				<a href="newdish" class="list-group-item">New Dish</a>
                
            </div>
        </div>
        <!-- ***************************************************PANELS *************************************************-->
                <div class="col-lg-3 col-md-6 col-md-offset-2">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                            <div class="col-xs-3">
                            <span class="pull-left" class="shopImage"> <img src="Resources/tasks.png" ></span>
                            </div>
                                <div class="col-xs-3">
                                    <i class="tasks"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Tasks!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><img src="Resources/arrowGreen.png" ></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                            <div class="col-xs-3">
                            <span class="pull-left" class="shopImage"> <img src="Resources/shop.png" ></span>
                            </div>
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Orders!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><img src="Resources/arrowYellow.png" ></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
         </div>

</body>
</html>