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
<link href="Resources/style.css" rel="stylesheet">
<!--  <link href="Resources/style2.css" rel="stylesheet"> -->
 <script src="Resources/custom.js" type="text/javascript"></script>

<meta http-equiv="charset=utf-8" />
<title>New Dish</title>
</head>

<body>
	
	<div class="brand">Blue Ridge Restaurant</div>
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
	                  <a class="navbar-brand" href="#">Blue Ridge Restaurant</a>
	                  </div>
	                  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	              <ul class="nav navbar-nav">
	                   <li>
	                      <a href="principal">Home</a>
	                  </li>
	                  <li>
	                      <a href="repotte">Options</a>
	                  </li>
	                  <li>
	                      <a href="store">Store</a>
	                  </li>
	              </ul>
	           </div>
	              </div>
	          </nav>
	</header>
    <div class="col-md-3">
    	<div class="list-group">
        	<a href="sale" class="list-group-item active">New Sale</a>
			<a href="newdish" class="list-group-item">New Dish</a>
			<a href="updatedish" class="list-group-item active">Update Dish</a>
        </div>
    </div>
    <form method="POST">
     <div class="col-md-9">
        <div class="container-fluid">
		  
        	<div class="row">
        	<div class="col-md-6">
  				<h2><span class="label label-info">UPDATE DISH</span></h2>
  				<br> <input class="form-control" id="name" name="name" placeholder="Dish Name" />
  				<br>
  				<br> <input class="form-control" id="price" name="price" placeholder="Price Without Taxes"  /> <br>
			</div>
			</div>
			<div  class="row">
			
			<div class="col-md-2">
				<h3><span class="label label-info">All ingredients</span></h3>
				
  				<select class="form-control" id="oneIngre" name="oneIngre" size="5">
			    </select>
			    
			   <br> <button type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#myModal">Add Ingredient</button>
			   
			</div>
			
			
			<div class="col-md-2">
			
				<h3><span class="label label-info">Dish Ingredients</span></h3>
					
  				<select class="form-control" id="SomeIngre" name="SomeIngre" size="5">
			    </select>
			    
			   	<br> <button type="button" class="btn btn-info btn-block" onclick="discard()">Discard Ingredient</button>
			   
			</div>
			
			<div class="col-md-2">
				<h3><span class="label label-info">Quantity</span></h3>
				
  				<select class="form-control" id="quantity" name="oneIngre" size="5" disabled="disabled">
			    </select>
			   			   
			</div>
			
			</div>
		  
		  <div  class="row">
				<div class="col-md-6"> 
				   <br><button type="button" class="btn btn-success btn-block" onclick="createNewDish()">Add Dish</button>
				</div>
		  </div>
		  
		</div>
        </div>
        
     	<!-- Codigo de la modal -->
		<div id="myModal" class="modal fade" role="dialog">
  			<div class="modal-dialog">

			    <!-- Modal content-->
	    		<div class="modal-content">
	      			<div class="modal-header">
	        			<button type="button" class="close" data-dismiss="modal">&times;</button>
	        			<h4 class="modal-title">Select the amount of product you want</h4>
	      			</div>
	      			<div class="modal-body">
		        		<div class="container">
		        			<div class="row">
								<div class="col-lg-3">
									<div class="form-control-static">
										<input type='number'  min='1' class='form-control' value="1" id="cantidadProducto" name="cantidadProducto" >
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-control-static">
										<select class="form-control" id="medida" name="medida" size="5">
											<option>Gramos</option>
											<option>Mililitros</option>
			   						    </select>
									</div>
								</div>
								<!-- Aquí se agregan  más campos-->
							</div>
		        		
		        		</div>
	    	  		</div>
	      			<div class="modal-footer">
	        			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="add()" >Close</button>
	      			</div>
	    		</div>

  			</div>
		</div>
	</form>
	
	<body onload="cargarProductos()">
	
</body>
</html>