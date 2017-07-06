package Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import DataAccess.PlatoDaoMySql;
import Domain.Plato;

@Controller
public class DishController {
	
	@Autowired
	private PlatoDaoMySql platoDao;
	
	@RequestMapping(value="/platos", method=RequestMethod.GET)
	public @ResponseBody String getPlatos(){
		return new Gson().toJson(platoDao.getPlatos());
	}

	@RequestMapping(value="/newdish", method = RequestMethod.POST)
	public @ResponseBody void crear(@RequestBody String body ) throws IOException
	{
		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
		Plato plato = gson.fromJson(body, Plato.class);
		
		this.platoDao.insertarPlato(plato);
	}
	
	@RequestMapping(value="/updatedish", method = RequestMethod.POST)
	public @ResponseBody void actualizar(@RequestBody String body ) throws IOException
	{
		Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
		Plato plato = gson.fromJson(body, Plato.class);
		
		this.platoDao.actualizarPlato(plato);
	}
	
	@RequestMapping(value="/dishes/{nombrePlato}", method=RequestMethod.GET)
	public @ResponseBody String getPlato(@PathVariable String nombrePlato){
		Plato plato = platoDao.getPlatosPorId(nombrePlato);
		
		return new Gson().toJson(plato);
	}

}
