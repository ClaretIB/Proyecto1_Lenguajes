// JavaScript Document

function add() {
	 var combo = document.getElementById("oneIngre");
	 var option = document.createElement("option");
	 option.innerText = combo.options[combo.selectedIndex].value;
	 option.value = combo.options[combo.selectedIndex].value;
	 document.getElementById("SomeIngre").appendChild(option);
	 
	 var option2 = document.createElement("option");
	 option2.value = $("#cantidadProducto").val()+":"+$("#medida").val();
	 option2.innerText = $("#cantidadProducto").val()+":"+$("#medida").val();
	 document.getElementById("quantity").appendChild(option2);	   
}

function createNewDish(){
	
	var comboProductos = document.getElementById("SomeIngre");
	var ComboCantidades = document.getElementById("quantity");
	
	var productos = new Array();
	
	for(var i=0; i<comboProductos.options.length;i++){
		
		var medida = (ComboCantidades.options[i].value).split(":");
		
		var Producto= {
				
				nombre: comboProductos.options[i].value,
				cantidad: medida[0],
				unidadMedida: medida[1]
		};
		productos[i]= Producto;
	}
	
	var Plato= {
			
			nombrePlato: $("#name").val(),
			precio: $("#price").val(),
			productos: productos
		};
	
	$.ajax({
		type: "POST",
		url: "newdish",
		data:JSON.stringify(Plato),
		contentType: "application/json; charset=UTF-8",
		dataType: 'json'
	});
}

function updateDish(){
	
	var comboProductos = document.getElementById("SomeIngre");
	var ComboCantidades = document.getElementById("quantity");
	
	var productos = new Array();
	
	for(var i=0; i<comboProductos.options.length;i++){
		
		var medida = (ComboCantidades.options[i].value).split(":");
		
		var Producto= {
				
				nombre: comboProductos.options[i].value,
				cantidad: medida[0],
				unidadMedida: medida[1]
		};
		productos[i]= Producto;
	}
	
	var Plato= {
			
			nombrePlato: $('#selectdishes option:selected').val(),
			precio: $("#price2").val(),
			productos: productos
		};
	
	$.ajax({
		type: "POST",
		url: "updatedish",
		data:JSON.stringify(Plato),
		contentType: "application/json; charset=UTF-8",
		dataType: 'json'
	});
}

function discard() {

	 var comboProductos = document.getElementById("SomeIngre");
	 var comboCantidades = document.getElementById("quantity");
	 var pos =comboProductos.selectedIndex;
	 comboProductos.removeChild(comboProductos.options[pos]);
	 comboCantidades.removeChild(comboCantidades.options[pos]);
	   
}

function cargarProductos(){
	
	$.ajax({
		  dataType: 'json',
		  url: "productos",
		  success: function(data){
			  var productos = $(data);
			  $(productos).each(function(index, info){
				  
				  var li = document.createElement("option");
				  li.value=info.nombre;
				  li.innerHTML=info.nombre;
				  document.getElementById("oneIngre").appendChild(li);
			  });
		  }
		});	
}

function cargarActualizar(){
	
	$.ajax({
		  dataType: 'json',
		  url: "productos",
		  success: function(data){
			  var productos = $(data);
			  $(productos).each(function(index, info){
				  
				  var li = document.createElement("option");
				  li.value=info.nombre;
				  li.innerHTML=info.nombre;
				  document.getElementById("oneIngre").appendChild(li);
			  });
		  }
		});
	
	$.ajax({
		  dataType: 'json',
		  url: "platos",
		  success: function(data){
			  var productos = $(data);
			  $(productos).each(function(index, info){
				  
				  var li = document.createElement("option");
				  li.value=info.nombrePlato;
				  li.innerHTML=info.nombrePlato;
				  document.getElementById("selectdishes").appendChild(li);
			  });
		  }
		});
}

function cargarPlato(){
	
	
	var optionSelected = $('#selectdishes option:selected').val();
	
	$.ajax({
		  dataType: 'json',
		  url: "dishes/"+optionSelected,
		  success: function(data){
			  var plato = $(data);
			  $(plato).each(function(index, info){
				  
				  document.getElementById("price2").value=info.precio;
				  
				  var productos = new Array();
				  productos = info.productos;
					
				  for(var i=0; i<productos.length;i++){
						
					var producto = new Object();
					producto = productos[i];
					
					var li = document.createElement("option");
					li.value=producto.nombre;
					li.innerHTML=producto.nombre;
					document.getElementById("SomeIngre").appendChild(li);
					
					var li2 = document.createElement("option");
					li2.value=producto.cantidad+":"+producto.unidadMedida;
					li2.innerHTML=producto.cantidad+":"+producto.unidadMedida;
					document.getElementById("quantity").appendChild(li2);
				 }
			  });
		  }
		});
}
	
function cargarVentas(){
	
	$.ajax({
		  dataType: 'json',
		  url: "platocliente",
		  success: function(data){
			  var ventas = $(data);
			  $(ventas).each(function(index, info){
				  
				var table = document.getElementById("tablaReporteVentas");
				
				var row = table.insertRow(1);
				
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				
				var cliente = new Object();
				cliente = info.cliente;
				
				var platos = new Array();
				platos = info.platos;
				
				var suma = 0;
				
				for(var i=0; i<platos.length;i++){
				
					var plato = new Object();
					plato = platos[i];
					suma += plato.precio;
				}

				cell1.innerHTML = info.numeroCompra;
				cell2.innerHTML = suma;
				cell3.innerHTML = platos.length;
				cell4.innerHTML = cliente.nombre;
				cell5.innerHTML =  "<button type='button' class='btn btn-link' data-toggle='modal' data-target='#myModal' onclick='masInfo("+info.numeroCompra+")'>more info</button>";
				cell5.value = info.numeroCompra;
				 
			  });
		  }
		});	
}

function masInfo(numeroCompra){
	
	document.getElementById("numero").innerHTML = "Sale "+numeroCompra;
	
	$.ajax({
		  dataType: 'json',
		  url: "platocliente",
		  success: function(data){
			  var ventas = $(data);
			  
			  $(ventas).each(function(index, info){
				
				  	var numero = info.numeroCompra;
				  	
					  	if(numero==numeroCompra){
							var cliente = new Object();
							cliente = info.cliente;
							
							var platos = new Array();
							platos = info.platos;
							
							var suma = 0;
							var sumaProductos = "";
							
							for(var i=0; i<platos.length;i++){
							
								var plato = new Object();
								plato = platos[i];
								suma += plato.precio;
								sumaProductos += (plato.nombrePlato+"</br>");
							}
							
							document.getElementById("lbCliente").innerHTML = cliente.nombre;
							document.getElementById("lbcantidadVendida").innerHTML = suma;
							document.getElementById("lbCuantosVendidos").innerHTML = platos.length;
							document.getElementById("lbProductos").innerHTML = sumaProductos;
							document.getElementById("lbPago").innerHTML = info.tipoPago;
							document.getElementById("lbFecha").innerHTML = info.fecha;
					  	}
				 
			  });
		  }
		});	
	
}