<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	
	
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
        <div class="col-md-2" >
        	<div class="list-group">
                 <input type="text" class="form-control" placeholder="Search" id="myinput"  >
        	<a href="sale" class="list-group-item active">New Sale</a>
			<a href="newdish" class="list-group-item">New Dish</a>
            </div>
        </div>
         <div  class="col-md-3 col-sm-offset-1 paneles" >
            <h2 class="negrita" id="a">NEW SALE </h2>
            <input type="text" class="form-control" placeholder="Customer name..." id="inputcliente"></input><br>
            <input type="email" class="form-control" placeholder="Email..." id="correoCliente"></input>
            <h3 class="negrita">ORDER</h3>
  <!--******************MODAL BOTON-->           
            <button type="button" class="btn btn-info btn-lg active" data-toggle="modal" data-target="#myModal" >Add dishes</button>
             <div class="form-group">
              <label for="comment" class="negrita">Observations:</label>
              <textarea class="form-control" rows="5" id="comment"></textarea>
            </div><br>
            <p class="negrita" >WAY TO PAY</p>
            <form id="myForm">
              <label class="negrita"><input type="radio" name="optradio" value="cash">Cash</label><br>
              <label class="negrita"><input type="radio" name="optradio" value="card">Credit / Debit Card</label><br>
              </form><br>
              <div class="hide" id="divCash">
                  <label >AMOUNT </label>
                  <input type="text" class="form-control" id="montoAPagar" placeholder="Amount" ></input>
              </div>
              <div class="hide" id="divCard">
                  <label >Select the bank</label>
                  <select class="form-control" id="selectBancos">
                  </select><br>
                  <label >Account number</label>
                  <input placeholder="Account number..." id="numeroCuenta" class="form-control"></input>
              </div><br>
            <button type="button"  id="confirmSale"  onclick="" class="btn btn-success btn-lg active" tabindex="7">Confirm sale</button>
            <br/><div id="messageError" class="alert alert-danger"><strong>¡Error!</strong>El monto de pago es inferior al total de la venta</div>
    		<br/><div id="successMessage" class="alert alert-success"><strong>¡Éxito!</strong>Venta realizada sin problemas</div>
            </div>
        </div>
 <!--************************ Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog ">
                    
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Add Dishes</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p>Select the dish</p>
                                    <select class="form-control" id="selectDishes"></select>
                                </div>
                                <div class="col-md-6">
                                    <p>Quantity:</p>
                                    <input placeholder="Quantity.." class="form-control" id= "quntityId"></input><br>
                                </div>
                            </div>
                            <button type="button"  onclick="" class="btn btn-success btn-lg active" id="btnAddModal">Add</button>
                            

                            <br>
                            <table class="table table-table-hover" id="tablaModal">
                                <thead>
                                  <tr>
                                    <th>Dishes</th>
                                    <th>Price without Taxes</th>
                                    <th>Price with Tax</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                  </tr>
                                </thead>
                                <tbody id="dishes">
                                </tbody>
                          </table>
                        </div>
                        <div class="modal-footer">
                         <button type="button" class="btn btn-default" data-dismiss="modal" onclick="copiarTabla()">Close</button>
                        </div>
                      </div>
                      
                  </div>
                </div>  



    <div class="col-md-5 col-sm-offset-1 paneles">
        <div class=" col-sm-offset-5"><h3 style="color: white" class="negrita">ORDER</h3></div>    
          <table class="table table-table-hover" style="color:white" id="prueba">
            <thead>
              <tr>
                <th>Dishes</th>
                <th>Price without Taxes</th>
                <th>Price with Tax</th>
                <th>Quantity</th>
                <th>Total</th>
              </tr>
            </thead>
                <tbody id="tablaFactura">
                </tbody>
      </table>
    </div>          
        


  <script>
  
  function copiarTabla(){
		 
	  	 var table = document.getElementById("tablaFactura");
		 var tdsTabla1 = table.getElementsByTagName("td");
		 
		 var suma = 0;
		 
		 for(var i=0; i<(tdsTabla1.length)/5;i++){
			 
			 alert(tdsTabla1[(((i+1)*5)-1)].innerHTML)
			 suma += Number(tdsTabla1[(((i+1)*5)-1)].innerHTML);
		 }
		 
		 var row = table.insertRow(-1);
		 var cell1 = row.insertCell(0);
		 var cell2 = row.insertCell(1);
		 var cell3 = row.insertCell(2);
		 var cell4 = row.insertCell(3);
		 var cell5 = row.insertCell(4);
		 
		 cell4.innerHTML = "Monto Total";
		 cell5.innerHTML = suma;
		 
	 }
      
     $('#myForm input').on('change', function() {
       
       var option = $('input[name=optradio]:checked', '#myForm').val();
           if(option == 'cash'){
                $( "#divCard" ).addClass( "hide" );
                $( "#divCash" ).removeClass( "hide" );
           }else{
                $( "#divCash" ).addClass( "hide" );
                $( "#divCard" ).removeClass( "hide" );
           }
     });
     
     function auto(){
    	 $("#messageError").hide();
    	 $("#successMessage").hide();
  		$.ajax({
  			  type: "POST",
  			  dataType: 'JSON',
  			  url: "cargaListaPlatos",
  			  data: {
  				  
  			  },
  			  success: function(data) {
  			    data.forEach(function(item){
  						var x = document.getElementById("selectDishes");
  					 	var option = document.createElement("option");
  					 	option.value = item.nombrePlato;
  					   	option.text = item.nombrePlato;
  					    x.add(option);
  				  });
  			    }, 
  			  error: function(data){
  			  	alert("error");
  			  }
  			});
      }
      
      auto();
      
      $('#btnAddModal').click(function(){
    	  var optionSelected = $('#selectDishes option:selected').val();
    	  
   	  	  $.ajax({
  	    	url: "dishes/"+optionSelected,
  	    	dataType: "json",
  	    	success: function(result)
  	    	{
  	    		var data = $(result);
  	    		$( data ).each(function( index, info ) {
  	    			var cantidad = $('#quntityId').val();
  	    			var nuevaFila="<tr>";
  	    			nuevaFila+="<td>"+info.nombrePlato+"</td>";
  	    			nuevaFila+="<td>"+info.precio+"</td>";
  	    			nuevaFila+="<td>"+info.precioConImpuestos+"</td>";
  	    			nuevaFila+="<td>"+cantidad+"</td>";
  	    			nuevaFila+="<td>"+(cantidad*info.precioConImpuestos)+"</td>";
  	    			$('#tablaFactura').append(nuevaFila);
  	    			nuevaFila+="<td id=> <a class= 'elimina'><button type='button' class='btn btn-danger' onclick='eliminar(this.parentNode.parentNode.parentNode.rowIndex)'><span class='glyphicon glyphicon-remove'></button></a> </td>";
  	    			nuevaFila+="</tr>";
  	    			$('#dishes').append(nuevaFila);
  	    		
  	        	});
  	    }});
      });
      
      $('#confirmSale').click(function(){    	  
    	  
    	  var platos = new Array();
		  $('#tablaModal tbody tr').each(function(index){
			  
			  var nombrePlato, cantidad;
			  
			  $(this).children("td").each(function(index2){
				  
				  switch(index2){
				  	case 0: nombrePlato = $(this).text();
				  		break;
				  	case 3: cantidad = $(this).text();
				  		break;
				  }
				  
			  })
			  var plato = {nombrePlato : nombrePlato,
				  		cantidad : cantidad };
			  platos[index] = JSON.stringify(plato)
		  })
		  
    	  var elemento = $('input:radio[name=optradio]:checked').val();
		  var Cliente = {nombre: $("#inputcliente").val(),
				  		correo: $("#correoCliente").val()};
    	  
    	  if (elemento.localeCompare("cash") == 0){
  			$.ajax({
				  type: "POST",
				  url: "saleconfirmed",
				  data: {
				   	cliente: JSON.stringify(Cliente),
				    tipoPago: $('input:radio[name=optradio]:checked').val(),
				    platosVenta: JSON.stringify(platos),
				    montoAPagar: $("#montoAPagar").val()
				  },
				  success: function(data) {
					if(data.localeCompare("Incorrecto") == 0){
						 $("#messageError").show();
					 }else if(data.localeCompare("Exito") == 0){
						 $("#successMessage").show();
					 }
				  }, 
				  error: function(data){
				  	
				  	
				  }
				});
    	  }else{
    			$.ajax({
  				  type: "POST",
  				  url: "saleconfirmedcard",
  				  data: {
  					cliente: JSON.stringify(Cliente),
  				    tipoPago: $('input:radio[name=optradio]:checked').val(),
  				    platosVenta: JSON.stringify(platos),
  				    banco: $("#selectBancos option:selected").val(),
  				    cuenta: $("#numeroCuenta").val()
  				  },
  				  success: function(data) {
   					 if(data.localeCompare("Exitoso") != 0){
   						$("#messageError").text(data);
   	  				  	$("#messageError").show();
   					 }
   					 else{
   						$("#successMessage").show();
   					 }
  					 
  				  }, 
  				  error: function(data){
  					$("#messageError").text(data);
  					$("#messageError").show();
  				  	
  				  }
  				});
    	  }
		  

			
		});
      
      
  	$.ajax({
		  type: "POST",
		  dataType: 'JSON',
		  url: "cargaListaBancos",
		  data: {
		  },
		  success: function(data) {
		   data.forEach(function(item){
					var x = document.getElementById("selectBancos");
				 	var option = document.createElement("option");
				 	option.value = item.idBanco;
				   	option.text = item.nombreBanco;
				    x.add(option);
			  });
		    }, 
		  error: function(data){
		  	alert("errora");
		  }
		});
  	
	function eliminar(i){
		document.getElementById("tablaModal").deleteRow(i);
		document.getElementById("prueba").deleteRow(i);
	}

  </script>
	    



</body>
</html>