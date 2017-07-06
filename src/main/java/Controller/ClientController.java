package Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import DataAccess.ClienteDaoMySql;
import Domain.Cliente;

@Controller
public class ClientController {
	
	@Autowired
	private ClienteDaoMySql clienteDao;

	@RequestMapping(value="/client", method=RequestMethod.POST)
	public @ResponseBody String insertClient(@RequestBody String client){
		Cliente cliente = new Gson().fromJson(client, Cliente.class);
		clienteDao.insertClient(cliente);
		return new Gson().toJson(cliente);
	}
	
	@RequestMapping(value="/clientes", method=RequestMethod.GET)
	public @ResponseBody String getClients(){
		return new Gson().toJson(clienteDao.getClients());
	}
}
