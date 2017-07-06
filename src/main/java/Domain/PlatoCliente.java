package Domain;

import java.sql.Date;
import java.util.LinkedList;

public class PlatoCliente {
 
	private int numeroCompra;
	private LinkedList<Plato> platos;
	private Cliente cliente;
	private Date fecha;
	private String tipoPago;
	private double montoAPagar;
	
	public PlatoCliente() {
		
		this.platos = new LinkedList<Plato>();
		this.cliente = new Cliente();
		
	}
	
	public double getMontoAPagar() {
		return montoAPagar;
	}

	public void setMontoAPagar(double montoAPagar) {
		this.montoAPagar = montoAPagar;
	}
	
	public LinkedList<Plato> getPlatos() {
		return platos;
	}
	public void setPlatos(LinkedList<Plato> platos) {
		this.platos = platos;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(String tipoPago) {
		this.tipoPago = tipoPago;
	}
	
	public int getNumeroCompra() {
		return numeroCompra;
	}
	public void setNumeroCompra(int numeroCompra) {
		this.numeroCompra = numeroCompra;
	}
	
}
