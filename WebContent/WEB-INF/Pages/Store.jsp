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

<link href='${styleCSS}' rel="stylesheet" />

<meta http-equiv="charset=utf-8" />
<title>App Name</title>
</head>

<body>
<script type="text/javascript">
$.ajax({
	  dataType: 'json',
	  url: "http://localhost/Proyecto_Restaurante/productos",
	  success: function(data){
		  var productos = $(data);
		  $(productos).each(function(index, info){
			  
			  var li = document.createElement("option");
			  li.value=info.nombre;
			  li.innerHTML=info.nombre;
			  document.getElementById("selectProducts").appendChild(li);
			  
		  });
	  }
	});
</script>
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
			<a href="newproduct" class="list-group-item">New Product</a>
			<a href="deleteproduct" class="list-group-item">Delete Product</a>
			<a href="updateproduct" class="list-group-item">Update Product</a>
            </div>
        </div><br />
        
  
        <div class="col-md-6 paneles">
        <div class="container-fluid">
        	<div class="row">
        	<div class="col-md-6">
  				<h2><span class="label label-info">Products:</span></h2>
  				<select class="form-control" id="selectProducts">
    				
  				</select>
			</div>
			</div>
			<div  class="row">
			<div class="table-responsive">
  				<table id="tablaProductos" class="table table-responsive">
  					<thead>
  						<tr>
  							<th>Name</th>
  							<th>Price without taxes</th>
  							<th>Measurement units</th>
  							<th>Quantity</th>
  						</tr>
  					</thead>
  					 <tbody id="products">
  					
  					</tbody>
    			</table>
			</div>
			</div>
			</div>
        </div>

        
        <script type="text/javascript">
	       $('#selectProducts').change(function(){
	    	   var optionSelected = $('#selectProducts option:selected').val();
	    	   $.ajax({
	   	    	url: "productos/"+optionSelected,
	   	    	dataType: "json",
	   	    	success: function(result)
	   	    	{
	   	    		var data = $(result);
	   	    		$( data ).each(function( index, info ) {
	   	    			var nuevaFila="<tr>";
	   	    			nuevaFila+="<td>"+info.nombre+"</td>";
	   	    			nuevaFila+="<td>"+info.precio+"</td>";
	   	    			nuevaFila+="<td>"+info.unidadMedida+"</td>";
	   	    			nuevaFila+="<td>"+info.cantidad+"</td>";
	   	    			nuevaFila+="</tr>";
	   	    			$('#products').append(nuevaFila);
	   	    		
	   	        	});
	   	    }});
   			});
       </script>  
      
	
</body>
</html>