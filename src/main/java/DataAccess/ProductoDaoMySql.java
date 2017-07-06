package DataAccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import Domain.Plato;
import Domain.Producto;

public class ProductoDaoMySql implements ProductoDao{

	private JdbcTemplate jdbcTemplate;
	private List<Producto> productList;
	
	@Override
	public void insertProduct(Producto product) {
		this.jdbcTemplate.update("insert into producto values (?, ?, ?, ?)", new Object[] { product.getNombre(), product.getPrecio(),
				product.getCantidad(), product.getUnidadMedida() });
	}

	@Override
	public void deleteProduct(String nombreProducto) {
		this.jdbcTemplate.update("delete from producto where nombre=?", nombreProducto);	
	}

	@Override
	public void updateProduct(Producto product) {
		String query = "update producto "+
				"set nombre = ?, precio = ?, cantidad = ? "+
				"where nombre = ?";
		this.jdbcTemplate.update(query, new Object[]{product.getNombre(), product.getPrecio(), product.getCantidad(), product.getNombre()});
	}

	@Override
	public List<Producto> getProducts() {
		this.productList = (List<Producto>) this.jdbcTemplate.query(
				"select nombre, precio, cantidad, unidad_medida from producto",
				new RowMapper<Producto>() {
					public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
						Producto producto = new Producto();
						producto.setNombre(rs.getString("nombre"));
						producto.setPrecio(rs.getFloat("precio"));
						producto.setCantidad(rs.getInt("cantidad"));
						producto.setUnidadMedidad(rs.getString("unidad_medida"));

						return producto;
					}
				});
		
		
		return productList;
	}

	@Override
	public Producto getProductById(String nombreProductos) {
		Producto producto = this.jdbcTemplate.queryForObject(
				"select nombre, precio, cantidad, unidad_medida from producto where nombre = ?",
				new Object[]{ nombreProductos },
				new RowMapper<Producto>() {
					public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
						Producto producto = new Producto();
						producto.setNombre(rs.getString("nombre"));
						producto.setCantidad(rs.getInt("cantidad"));
						producto.setPrecio(rs.getFloat("precio"));
						producto.setUnidadMedidad(rs.getString("unidad_medida"));
						
						return producto;
					}
				});
		return producto;
	}

	@Override
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Producto> getProductByDish(String nombrePlato) {
		this.productList = (List<Producto>) this.jdbcTemplate.query(
				"select nombreProducto, cantidad from productoplato where nombrePlato = ?",
				new Object[]{ nombrePlato },
				new RowMapper<Producto>() {
					public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
						String nombreProducto = rs.getString("nombreProducto");
						Producto producto = getProductById(nombreProducto);
						producto.setCantidad(rs.getInt("cantidad"));
						
						return producto;
					}
				});
		
		return productList;
	}

	@Override
	public void decrementaInventario(Plato platoAux) {
		
		for(Producto productAux : platoAux.getProductos()){
			Producto producto = getProductById(productAux.getNombre());
			String query = "update producto "+
					"set cantidad = ? "+
					"where nombre = ?";
			this.jdbcTemplate.update(query, new Object[]{(producto.getCantidad()-productAux.getCantidad()), productAux.getNombre()});
		}
		
	}

}
