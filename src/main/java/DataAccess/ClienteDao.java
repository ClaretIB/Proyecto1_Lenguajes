package DataAccess;

import java.util.List;

import javax.sql.DataSource;

import Domain.Cliente;

public interface ClienteDao {
	
	public Cliente getClientebyId(int cedula);
	public void insertClient(Cliente cliente);
	public List<Cliente> getClients();
	public void setDataSource(DataSource dataSource);

}