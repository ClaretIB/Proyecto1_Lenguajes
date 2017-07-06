package Domain;

public class Almacen {
		private String nombreProducto;
		private int precio;
		private int cantidad;
		private double precioConImpuestos;
		public String getNombreProducto() {
			return nombreProducto;
		}
		public void setNombreProducto(String nombreProducto) {
			this.nombreProducto = nombreProducto;
		}
		public int getPrecio() {
			return precio;
		}
		public void setPrecio(int precio) {
			this.precio = precio;
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
		
		
}
