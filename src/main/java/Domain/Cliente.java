package Domain;

public class Cliente {
	private int cedula;
	private String nombre;
	private String correo;
	
	public Cliente(int cedula, String nombre, String correo) {
		super();
		this.cedula = cedula;
		this.nombre = nombre;
		this.correo = correo;
	}

	public Cliente() {
	}

	public int getCedula() {
		return cedula;
	}

	public void setCedula(int cedula) {
		this.cedula = cedula;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	
		
}
