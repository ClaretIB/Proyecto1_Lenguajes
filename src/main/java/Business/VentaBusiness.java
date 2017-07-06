package Business;

import java.util.LinkedList;

import DataAccess.ClienteDaoMySql;
import DataAccess.PlatoClienteDao;
import DataAccess.ProductoDaoMySql;
import Domain.Plato;
import Domain.PlatoCliente;
import Domain.Producto;
import Exceptions.ConflictsException;

public class VentaBusiness {
	
	private ProductoDaoMySql productoDao;
	private PlatoClienteDao platoClienteDao;
	private ClienteDaoMySql clienteDao;
	
	public VentaBusiness(ProductoDaoMySql productoDao, PlatoClienteDao platoClienteDao, ClienteDaoMySql clienteDao) {
		this.productoDao = productoDao;
		this.platoClienteDao = platoClienteDao;
		this.clienteDao = clienteDao;
	}

	public void insertSaleDB(PlatoCliente venta) throws ConflictsException{
		if(comprobarInventarioExistenciaProductos(venta.getPlatos())){
			platoClienteDao.insertarNuevaVenta(venta);
			clienteDao.insertClient(venta.getCliente());
		}
		else{
			throw new ConflictsException("No hay suficiente ingredientes para la venta");
		}
	}

	private boolean comprobarInventarioExistenciaProductos(LinkedList<Plato> platos) {
		boolean existenciasCompletas = false;
		for(Plato platoActual : platos){
			for(Producto productoActual : platoActual.getProductos() ){
				Producto productoAux = productoDao.getProductById(productoActual.getNombre());
				
				if(productoActual.getCantidad()*platoActual.getCantidad() < productoAux.getCantidad()){
					existenciasCompletas = true;
				}
				else{
					return false;
				}
			}
		}
		return existenciasCompletas;
	}

}
