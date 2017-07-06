package Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import DataAccess.ProductoDaoMySql;
import Domain.Producto;

@Controller
public class ProductController {
	
	@Autowired
	private ProductoDaoMySql productoDao;
	
	@RequestMapping(value="/productos", method=RequestMethod.GET)
	public @ResponseBody String getProductos(){
		return new Gson().toJson(productoDao.getProducts());
	}

	@RequestMapping(value="admin/productos/{nombre}", method=RequestMethod.GET)
	public @ResponseBody String getProductoPorId(@PathVariable String nombre){
		return new Gson().toJson(productoDao.getProductById(nombre));
	}
	
	@RequestMapping(value="/admin/producto", method=RequestMethod.POST)
	public @ResponseBody String insertProduct(@RequestBody String product){
		Producto producto = new Gson().fromJson(product, Producto.class);
		productoDao.insertProduct(producto);
		return new Gson().toJson(producto);
	}
	
	@RequestMapping(value="/admin/productoupdated", method=RequestMethod.POST)
	public @ResponseBody String updateProduct(@RequestBody String product){
		Producto producto = new Gson().fromJson(product, Producto.class);
		productoDao.updateProduct(producto);
		return new Gson().toJson(producto);
	}
	
	@RequestMapping(value="/admin/productodeleted", method=RequestMethod.POST)
	public @ResponseBody String deleteProduct(@RequestBody String product){
		Producto producto = new Gson().fromJson(product, Producto.class);
		productoDao.deleteProduct(producto.getNombre());
		return new Gson().toJson(producto);
	}
}
