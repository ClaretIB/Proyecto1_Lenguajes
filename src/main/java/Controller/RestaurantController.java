package Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestaurantController {
	
	@RequestMapping(value="/store", method=RequestMethod.GET)
	public String getStore(){
		return "Store";
	}
	
	@RequestMapping(value="/admin/store", method=RequestMethod.GET)
	public String getStorePage(){
		return "Store";
	}
	
	@RequestMapping(value="/newdish", method=RequestMethod.GET)
	public String getNewDish(){
		return "NewDish";
	}
	
	@RequestMapping(value="/deletedish", method=RequestMethod.GET)
	public String getDeleteDishh(){
		return "DeleteDish";
	}
	
	@RequestMapping(value="/updatedish", method=RequestMethod.GET)
	public String getUpdateDish(){
		return "UpdateDish";
	}
	
	@RequestMapping(value="/admin/newproduct", method=RequestMethod.GET)
	public String getNewProduct(){
		return "NewProduct";
	}
	
	@RequestMapping(value="/admin/updateproduct", method=RequestMethod.GET)
	public String getUpdateProduct(){
		return "UpdateProduct";
	}
	
	@RequestMapping(value="/admin/deleteproduct", method=RequestMethod.GET)
	public String getDeleteProduct(){
		return "DeleteProduct";
	}
	
	@RequestMapping(value="/loginp", method=RequestMethod.GET)
	public String getLoginPage(){
		return "Login";
	}
	
	@RequestMapping(value="/Access_Denied", method=RequestMethod.GET)
	public String accessDeniedPage(){
		return "AccessDenied";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "Login";
	}
	
	@RequestMapping(value="/principal", method=RequestMethod.GET)
	public String getPrincipal(){
		return "Principal";
	}
	
	@RequestMapping(value="/sale", method=RequestMethod.GET)
	public String getSale(){
		return "Sale";
	}
	
	@RequestMapping(value="/reporte", method=RequestMethod.GET)
	public String getReporte(){
		return "Reporte";
	}
}

