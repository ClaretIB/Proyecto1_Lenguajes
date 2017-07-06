package Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import Business.VentaBusiness;
import DataAccess.ClienteDaoMySql;
import DataAccess.PlatoClienteDao;
import DataAccess.PlatoDaoMySql;
import DataAccess.ProductoDaoMySql;
import Domain.Banco;
import Domain.Cliente;
import Domain.Plato;
import Domain.PlatoCliente;
import Exceptions.ConflictsException;

@Controller
public class SaleController {

	@Autowired
	private PlatoDaoMySql platoDao;
	@Autowired
	private ProductoDaoMySql productoDao;
	@Autowired
	private PlatoClienteDao platoClienteDao;
	@Autowired
	private ClienteDaoMySql clienteDao;
	
	@RequestMapping(value="/cargaListaPlatos", method = RequestMethod.POST)
	public @ResponseBody String insertt() 
	{
		
		List<Plato> listPlatos= platoDao.getPlatos() ;
		
		return new Gson().toJson( listPlatos );
	}
	
	@RequestMapping(value="/addDishes", method = RequestMethod.POST)
	public @ResponseBody String inserta( @RequestParam String cliente, String plato, String tipoPago) 
	{
		return ""+cliente;
	}
	
	@RequestMapping(value="/saleconfirmed", method=RequestMethod.POST)
	public @ResponseBody String creaVenta(@RequestParam String cliente, String tipoPago, String platosVenta, double montoAPagar) throws ConflictsException{
		PlatoCliente venta = new PlatoCliente();
		String[] plato = new Gson().fromJson(platosVenta, String[].class);
		Cliente clienteVenta = new Gson().fromJson(cliente, Cliente.class);
		double totalVenta = 0;
		
		for(String platoActual : plato){
			
			Plato platoAux = new Gson().fromJson(platoActual, Plato.class);
			Plato platoVenta = platoDao.getPlatosPorId(platoAux.getNombrePlato());
			platoVenta.setCantidad(platoAux.getCantidad());
			platoVenta.setProductos(productoDao.getProductByDish(platoVenta.getNombrePlato()));
			totalVenta += platoVenta.getPrecioConImpuestos() * platoAux.getCantidad();
			venta.getPlatos().add(platoVenta);
		}
		
		venta.setMontoAPagar(totalVenta);
		venta.setCliente(clienteVenta);
		venta.setTipoPago(tipoPago);
		
		if(totalVenta <= montoAPagar){
			try{
			VentaBusiness ventaBussines = new VentaBusiness(productoDao, platoClienteDao, clienteDao);
			ventaBussines.insertSaleDB(venta);
			}catch(Exception ex){
				return ex.getMessage();
			}
		}
		else{
			return "Incorrecto";
		}
		
		return "Exito";
	}
	
	@RequestMapping(value="/saleconfirmedcard", method=RequestMethod.POST)
	public @ResponseBody String creaVentaConTarjeta(@RequestParam String cliente, String tipoPago, String platosVenta, String banco, String cuenta){
		PlatoCliente venta = new PlatoCliente();
		String[] platos = new Gson().fromJson(platosVenta, String[].class);
		Cliente clienteVenta = new Gson().fromJson(cliente, Cliente.class);
		double totalVenta = 0;
		
		for(String platoActual : platos){
			
			Plato platoAux = new Gson().fromJson(platoActual, Plato.class);
			Plato platoVenta = platoDao.getPlatosPorId(platoAux.getNombrePlato());
			platoVenta.setCantidad(platoAux.getCantidad());
			platoVenta.setProductos(productoDao.getProductByDish(platoVenta.getNombrePlato()));
			totalVenta += platoVenta.getPrecioConImpuestos() * platoAux.getCantidad();
			venta.getPlatos().add(platoVenta);
		}
		
		venta.setMontoAPagar(totalVenta);
		venta.setCliente(clienteVenta);
		venta.setTipoPago(tipoPago);
		
		try{
		VentaBusiness ventaBussines = new VentaBusiness(productoDao, platoClienteDao, clienteDao);
		ventaBussines.insertSaleDB(venta);
		}catch(Exception ex){
			return ex.getMessage();
		}
		
		return "Exitoso";
	}

	
	@RequestMapping(value="/cargaListaBancos", method = RequestMethod.POST)
	public @ResponseBody String verBancos() 
	{
		List<Banco> listBancos= platoDao.getBancos();
		return new Gson().toJson( listBancos );
	}
	
	
}