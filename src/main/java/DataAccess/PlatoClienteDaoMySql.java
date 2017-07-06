package DataAccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import Domain.Plato;
import Domain.PlatoCliente;

public class PlatoClienteDaoMySql implements PlatoClienteDao {
	
	private JdbcTemplate jdbcTemplate;
	private List<PlatoCliente> ventas;
	private LinkedList<PlatoCliente> ventasLimplia;
	@Autowired
	private PlatoDaoMySql platoDao;
	@Autowired
	private ClienteDaoMySql clienteDao;
	@Autowired
	private ProductoDaoMySql productoDao;
	
	public PlatoClienteDaoMySql(){
		
	}

	@Override
	public LinkedList<PlatoCliente> getVentas() {
		
		this.ventasLimplia = new LinkedList<PlatoCliente>();
		
		this.ventas = (List<PlatoCliente>) this.jdbcTemplate.query(
				
				"select numeroCompra, nombrePlato, NombreCliente, fecha, tipoPago from platocliente",
				
				new RowMapper<PlatoCliente>() {
					
					public PlatoCliente mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						PlatoCliente platoCliente = new PlatoCliente();
						platoCliente.setNumeroCompra( rs.getInt("numeroCompra"));
						platoCliente.getCliente().setNombre(rs.getString("nombreCliente"));
						platoCliente.setTipoPago(rs.getString("tipoPago"));
						platoCliente.setFecha(rs.getDate("fecha"));
						Plato plato = new Plato();
						plato.setNombrePlato(rs.getString("nombrePlato"));
						platoCliente.getPlatos().addLast(plato);
						
						return platoCliente;
					}
				});
		
		int numeroCompra = 0;
		
		for(int i = 0; i<ventas.size();i++){
			
			PlatoCliente ventaLista = ventas.get(i);
			
			if(numeroCompra != ventaLista.getNumeroCompra()){
				
				numeroCompra = ventaLista.getNumeroCompra();
				Plato plato = platoDao.getPlatosPorId(ventaLista.getPlatos().getLast().getNombrePlato());
				ventaLista.getPlatos().removeLast();
				ventaLista.getPlatos().addLast(plato);
				ventasLimplia.addLast(ventaLista);
			}
			else{
				numeroCompra = ventaLista.getNumeroCompra();
				Plato plato = platoDao.getPlatosPorId(ventaLista.getPlatos().getLast().getNombrePlato());
				ventasLimplia.getLast().getPlatos().addLast(plato);

			}
		}
		
		
		return this.ventasLimplia;
	}
	
	@Override
	public void insertarNuevaVenta(PlatoCliente venta) {
		Calendar fecha = new GregorianCalendar();
		int año = fecha.get(Calendar.YEAR);
		int mes = fecha.get(Calendar.MONTH);
		int dia = fecha.get(Calendar.DATE);
		String fechaVenta = año+"-"+mes+"-"+dia;
		for(Plato platoAux : venta.getPlatos()){
			this.jdbcTemplate.update("insert into platocliente values (?, ?, ?, ?, ?)", new Object[] {12, platoAux.getNombrePlato(), venta.getCliente().getNombre(),
					fechaVenta, venta.getTipoPago() });
			productoDao.decrementaInventario(platoAux);
			
		}
	}

	@Override
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

}