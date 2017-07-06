package Domain;

import java.util.ArrayList;
import java.util.List;

public class Plato {
	
	private String nombrePlato;
	private float precio;
	private double precioConImpuestos;
	private String unidadMedida;
	private List<Producto>productos;
	private int cantidad;

	public Plato() {
		
		this.productos = new ArrayList<Producto>();
	}
	
	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecioConImpuestos() {
		return precioConImpuestos;
	}

	public void setPrecioConImpuestos(double precioConImpuestos) {
		this.precioConImpuestos = precioConImpuestos;
	}
	
	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	public String getNombrePlato() {
		return nombrePlato;
	}
	public void setNombrePlato(String nombrePlato) {
		this.nombrePlato = nombrePlato;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	
	public List<Producto> getProductos() {
		return productos;
	}
	public void setProductos(List<Producto> productos) {
		this.productos = (ArrayList<Producto>) productos;
	}
	
	public double calcularPrecioConImpuestos(Plato plato){
		double precioConImpuestos = 0;
		String nombrePlato = plato.getNombrePlato().substring(0, 6);
		
		if(nombrePlato.equalsIgnoreCase("casado")){
			return plato.getPrecio();
		}
		else{
			precioConImpuestos = (plato.getPrecio()*0.13) + plato.getPrecio();
		}
		return precioConImpuestos;
	}
	
}
