package DataAccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import Domain.Cliente;

public class ClienteDaoMySql implements ClienteDao {
	
	private JdbcTemplate jdbcTemplate;
	private List<Cliente> listaClientes;
	
	@Override
	public void insertClient(Cliente cliente) {
		this.jdbcTemplate.update("insert into cliente values (?, ?, ?)", new Object[] { cliente.getCedula(), cliente.getNombre(),
				cliente.getCorreo() });
	}

	@Override
	public List<Cliente> getClients() {
		this.listaClientes = (List<Cliente>) this.jdbcTemplate.query(
				"select cedula, nombre, correo from cliente",
				new RowMapper<Cliente>() {
					public Cliente mapRow(ResultSet rs, int rowNum) throws SQLException {
						Cliente cliente = new Cliente();
						cliente.setCedula(rs.getInt("cedula"));
						cliente.setNombre(rs.getString("nombre"));
						cliente.setCorreo(rs.getString("correo"));
						
						return cliente;
					}
				});
		
		
		return listaClientes;
	}

	@Override
	public Cliente getClientebyId(int cedula) {
		
		Cliente cliente = this.jdbcTemplate.queryForObject(
				"select cedula, nombre, correo from cliente where cedula = ?",
				new Object[]{ cedula },
				new RowMapper<Cliente>() {
					@Override public Cliente mapRow(ResultSet rs, int rowNum) throws SQLException {
						Cliente cliente = new Cliente();
						cliente.setCedula(rs.getInt("cedula"));
						cliente.setNombre(rs.getString("nombre"));
						cliente.setCorreo(rs.getString("correo"));
	
						return cliente;
					}
				});
		
		
		return cliente;
	}
	
	@Override
	public void setDataSource(DataSource dataSource) {
		
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
}

