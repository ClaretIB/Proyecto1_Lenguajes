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
<link href="style.css" rel="stylesheet">

<spring:url value="/Resources/style.css" var="styleCSS" />

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
        <div class="col-md-3">
        	<div class="list-group">
        	<a href="sale" class="list-group-item active">New Sale</a>
			<a href="newdish" class="list-group-item">New Dish</a>
            </div>
        </div>
        <div class="col-md-9 ">
        	
        		<h2><label class="label label-primary">New Product</label></h2><br>	
        		<form>
        		<div class="row">
        			<div class="col-md-4">
        				<input type="text" class="form-control" id="productName" placeholder="Product Name"/>
        			</div>
        		</div><br>
        		<div class="row">
        			<div class="col-md-4">
        				<input type="text" class="form-control" id="price" placeholder="Price without taxes"/>
        			</div>
        		</div><br>
        		<div class="row">
        			<div class="col-md-4">
        				<input type="text" class="form-control" id="quantity" placeholder="Quantity"/>
        			</div>
        		</div><br>
        		<div class="row">
        			<div class="col-md-4">
        				<label style="color: white;">Measurement units</label>
        				<select id="selectUnidades" class="form-control">
        					<option value="Gramos">Gramos</option>
        					<option value="Litros">Litros</option>
        				</select>
        			</div>
        		</div><br>
        		<div class="row">
        			<div class="col-md-4">
        				<input type="button" class="btn btn-success btn-block" id="btnInsert" value="Add" onclick="updateProduct()"/>
        			</div>
        		</div>
        		</form>
        	
        </div>
  <script type="text/javascript">
  		function updateProduct(){
  			var Producto = {
  							nombre: $("#productName").val(),
  							precio: $("#price").val(),
  							cantidad: $("#quantity").val(),
  							unidadMedida: $('#selectUnidades option:selected').val()
  			}
  			$.ajax({
  				type: "POST",
  				url: "producto",
  				data:JSON.stringify(Producto),
  				contentType: "application/json; charset=UTF-8",
  				dataType: 'json'
  			});
  		}
  </script>
	    
</body>
</html>