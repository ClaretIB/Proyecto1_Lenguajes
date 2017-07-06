package DataAccess;

import java.util.List;

import javax.sql.DataSource;

import Domain.Plato;


public interface PlatoDao {
	
	public Plato insertarPlato(Plato plato);
	public Plato eliminarPlato(Plato plato);
	public Plato actualizarPlato(Plato plato);
	public List<Plato> getPlatos();
	public Plato getPlatosPorId(String nombreProducto);
	public void setDataSource(DataSource dataSource);

}
