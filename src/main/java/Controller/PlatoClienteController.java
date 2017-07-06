package Controller;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import DataAccess.PlatoClienteDaoMySql;
import Domain.PlatoCliente;

@Controller
public class PlatoClienteController {
	
	@Autowired
	private PlatoClienteDaoMySql platoClienteDao;
	
	@RequestMapping(value="/platocliente", method=RequestMethod.GET)
	public @ResponseBody String  getVentas(){
		
		LinkedList<PlatoCliente> ventas = platoClienteDao.getVentas();
		
		return new Gson().toJson(ventas);
	}

}