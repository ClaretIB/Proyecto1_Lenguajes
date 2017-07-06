package DataAccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import Domain.Banco;
import Domain.Plato;
import Domain.Producto;
import bsh.This;

public class PlatoDaoMySql implements PlatoDao {

	private JdbcTemplate jdbcTemplate;
	private List<Plato> platos;
	private List<Banco> bancos;
	private List<Producto> productos;


	@Override
	public Plato insertarPlato(Plato plato) {
		
		List<Producto> productos = plato.getProductos();
		
		String sql = "INSERT INTO RESTAURANTE_LENGUAJES.PLATO(nombrePlato, precio) VALUES(?,?)";
		 
		jdbcTemplate.update(sql, new Object[] {
											plato.getNombrePlato(),
											plato.getPrecio()
											});
		
		for(Producto productoLista : productos){
			
			sql = "INSERT INTO RESTAURANTE_LENGUAJES.PRODUCTOPLATO(nombreProducto, nombrePlato, cantidad,unidad_medida) VALUES(?,?,?,?)";
			 
			jdbcTemplate.update(sql, new Object[] {
												productoLista.getNombre(),
												plato.getNombrePlato(),
												productoLista.getCantidad(),
												productoLista.getUnidadMedida()
												});
			
		}
		
		return plato;

	}
	
	@Override
	public Plato getPlatosPorId(String nombrePlato) {
		
		Plato plato = this.jdbcTemplate.queryForObject(
				"select precio from plato where nombrePlato = ?",
				new Object[]{ nombrePlato },
				new RowMapper<Plato>() {
					@Override public Plato mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						Plato plato = new Plato();
						plato.setNombrePlato(nombrePlato);
						plato.setPrecio(rs.getInt("precio"));
						plato.setPrecioConImpuestos(plato.calcularPrecioConImpuestos(plato));
						return plato;
					}
				});
		
		        this.productos = (List<Producto>) this.jdbcTemplate.query(
					"SELECT nombrePlato, nombreProducto, cantidad, unidad_medida FROM restaurante_lenguajes.PRODUCTOPLATO WHERE nombrePlato = ?" ,
					new Object[]{ nombrePlato },
					new RowMapper<Producto>() {
						public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
							
							String nombrePlato = rs.getString("nombrePlato");
							Producto producto = new Producto();
							producto.setNombre(rs.getString("nombreProducto"));
							producto.setCantidad(rs.getInt("cantidad"));
							producto.setUnidadMedidad(rs.getString("unidad_medida"));
						
							return producto;
						}
					 });
		        
		        plato.setProductos(this.productos);
			
		
		return plato;
	}

	@Override
	public Plato eliminarPlato(Plato plato) {
		return plato;
		// TODO Auto-generated method stub

	}

	@Override
	public Plato actualizarPlato(Plato plato) {
		String p = "";
		
		String query = "update plato "+
				"set nombrePlato = ?, precio = ?"+
				" where nombrePlato = ?";
		 
		this.jdbcTemplate.update(query, new Object[]{plato.getNombrePlato(), plato.getPrecio(), plato.getNombrePlato()});
		
		for(Producto productoLista : productos){
			
			query = "update productoplato "+
					"set nombreProducto = ?, nombrePlato = ?, cantidad = ?, unidad_medida = ?"+
					" where nombrePlato = ? and nombreProducto = ?";
			 
			jdbcTemplate.update(query, new Object[] {
												productoLista.getNombre(),
												plato.getNombrePlato(),
												productoLista.getCantidad(),
												productoLista.getUnidadMedida(),
												plato.getNombrePlato(),
												productoLista.getNombre()
												});
			
		}
		
		
		return plato;

	}
	

	@Override
	public List<Plato> getPlatos() {
		this.platos = (List<Plato>) this.jdbcTemplate.query(
				"SELECT nombrePlato, precio FROM restaurante_lenguajes.plato",
				new RowMapper<Plato>() {
					public Plato mapRow(ResultSet rs, int rowNum) throws SQLException {
						Plato plato = new Plato();
						plato.setNombrePlato(rs.getString("nombrePlato"));
						plato.setPrecio(rs.getInt("precio"));

						return plato;
					}
				});
		
		
		return platos;
	}
	
	public List<Banco> getBancos() {
		this.bancos = (List<Banco>) this.jdbcTemplate.query(
				"SELECT idBanco, nombreBanco FROM restaurante_lenguajes.banco",
				new RowMapper<Banco>() {
					public Banco mapRow(ResultSet rs, int rowNum) throws SQLException {
						Banco banco = new Banco();
						banco.setIdBanco(rs.getInt("idBanco"));
						banco.setNombreBanco(rs.getString("nombreBanco")); 

						return banco;
					}
				});
		
		
		return bancos;
	}

	@Override
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

}