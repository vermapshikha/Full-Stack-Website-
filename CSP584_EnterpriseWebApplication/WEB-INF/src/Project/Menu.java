package Project;
import java.util.HashMap;

public class Menu implements java.io.Serializable 
{	
	public Integer RestaurantId;
	public HashMap<String, MenuItem> menuItems;
	
	public Menu(Integer id) 
	{
		RestaurantId = id;
		menuItems = new HashMap<String, MenuItem>();
	} 
}