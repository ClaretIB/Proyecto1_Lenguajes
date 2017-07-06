<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<spring:url value="/Resources/style.css" var="styleCSS" />
<script src="Resources/custom.js" type="text/javascript"></script>

<link href='${styleCSS}' rel="stylesheet" />

<meta http-equiv="charset=utf-8" />
<title>App Name</title>
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
      	                  <a href="principal">Home</a>
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
		
	
        <div class="col-md-2">
        	<div class="list-group">
        	<a href="sale" class="list-group-item active">New Sale</a>
			<a href="newdish" class="list-group-item">New Dish</a>
            </div>
        </div>
        
  
        <div class="col-md-6">
        <div class="container-fluid">
        	<div class="row">
        	<div class="col-md-6">
  				<h2><span class="label label-info">Sales:</span></h2>
			</div>
			</div>
			<div  class="row">
			<div class="table-responsive" style="background-color:white;">
  				<table id="tablaReporteVentas" class="table table-striped">
  					<thead>
  						<tr>
  							<th style="color: black;">Sale</th>
  							<th style="color: black;">Quantity Sold</th>
  							<th style="color: black;">Quantity of products Sold</th>
  							<th style="color: black;">Client</th>
  							<th style="color: black;"></th>
  						</tr>
  					</thead>
    			</table>
			</div>
			</div>
			</div>
        </div>
        <div class="col-md-4">
        </div>
        
        <!-- Codigo de la modal -->
		<div id="myModal" class="modal fade" role="dialog">
  			<div class="modal-dialog">

			    <!-- Modal content-->
	    		<div class="modal-content">
	      			<div class="modal-header">
	        			<button type="button" class="close" data-dismiss="modal">&times;</button>
	      			</div>
	      			<div class="modal-body">
		        		<div class="container">
		        			<div class="row">
		        				<h4><label id="numero"></label></h4>
							</div>
							
							<div class="row">
		        				<h5><label ">Date:</label></h5>
		        				<h5><label id="lbFecha"></label></h5>
							</div>
							
							<div class="row">
		        				<h5><label>Client:</label></h5>
		        				<h5><label id="lbCliente"></label></h5>
							</div>
							
							<div class="row">
		        				<h5><label> Quantity sold</label></h5>
		        				<h5><label id="lbcantidadVendida"></label></h5>
							</div>
							
							<div class="row">
		        				<h5><label>Quantity of products sold</label></h5>
		        				<h5><label id="lbCuantosVendidos"></label></h5>
							</div>
							
							<div class="row">
		        				<h5><label>Products sold</label></h5>
		        				<h5><label id="lbProductos"></label></h5>
							</div>
							
							<div class="row">
		        				<h5><label>Way to pay</label></h5>
		        				<h5><label id="lbPago"></label></h5>
							</div>
		        		
		        		</div>
	    	  		</div>
	      			<div class="modal-footer">
	        			<button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
	      			</div>
	    		</div>

  			</div>
		</div>
        
      <body onload="cargarVentas()">
	
</body>
</html>