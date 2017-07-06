package DataAccess;


import java.util.LinkedList;

import javax.sql.DataSource;

import Domain.PlatoCliente;

public interface PlatoClienteDao {
	
	public LinkedList<PlatoCliente> getVentas();
	public void insertarNuevaVenta(PlatoCliente venta);
	public void setDataSource(DataSource dataSource);

}
