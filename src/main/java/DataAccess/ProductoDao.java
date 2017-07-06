package DataAccess;

import java.util.List;

import javax.sql.DataSource;

import Domain.Plato;
import Domain.Producto;

public interface ProductoDao {
	
	public void insertProduct(Producto product);
	public void deleteProduct(String nombreProducto);
	public void updateProduct(Producto product);
	public List<Producto> getProducts();
	public Producto getProductById(String nombreProducto);
	public List<Producto> getProductByDish(String nombrePlato);
	public void decrementaInventario(Plato platoAux);
	public void setDataSource(DataSource dataSource);

}
