package DomainTest;

import org.testng.Assert;
import org.testng.annotations.Test;

import Domain.Plato;

public class PlatoTest {

	@Test
	public void testImpuestoVenta() {
		Plato plato = new Plato();
		plato.setNombrePlato("Chifrjo");
		plato.setPrecio(2500);
		double precio = plato.calcularPrecioConImpuestos(plato);
		Assert.assertEquals((int) precio, 2825);
	}
	
	@Test
	public void testImpuestoCasado(){
		Plato plato = new Plato();
		plato.setNombrePlato("casado con pescado");
		plato.setPrecio(2200);
		double precio = plato.calcularPrecioConImpuestos(plato);
		Assert.assertEquals((int) precio, 2200);
	}

}
