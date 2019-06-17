package Project;
import java.util.HashMap;
import java.util.Map.Entry;

public class Cart 
{
	// <restaurantId, <mealname, count>>
	private static final Cart instance = new Cart();
	private HashMap<Integer, HashMap<String, Integer>> cartItems;

	private Cart() 
	{
		cartItems = new HashMap<Integer, HashMap<String, Integer>>();
	}
	
	public static Cart getInstance()
	{
        return instance;
    }

	public void addItemToCart(Integer restaurantId, String item, Integer count) 
	{
		// Check if food from the hotel already exists in the cart
		if (cartItems.containsKey(restaurantId)) 
		{
			// Get food items from the hotel
			HashMap<String, Integer> itemsFromRestaurant = cartItems.get(restaurantId);
			
			// Check if the same food was previously added
			if (itemsFromRestaurant.containsKey(item)) 
			{
				itemsFromRestaurant.put(item, itemsFromRestaurant.get(item) + count);
			} 
			else 
			{
				itemsFromRestaurant.put(item, count);
			}
		} 
		else 
		{
			HashMap<String, Integer> food = new HashMap<String, Integer>();
			food.put(item, count);
			cartItems.put(restaurantId, food);
		}
	}

	public void deleteItemFromCart(Integer restaurantId, String item) 
	{
		// Check if food from the hotel already exists in the cart  
		if (!cartItems.containsKey(restaurantId)) 
		{
			return;
		}
		
		// Check if food item is present in the items list of the hotel
		HashMap<String, Integer> itemsFromRestaurant = cartItems.get(restaurantId);
		if (!itemsFromRestaurant.containsKey(item)) 
		{
			return;
		}
		
		itemsFromRestaurant.remove(item);

		// Check and update hotel entries
		if(itemsFromRestaurant.size() == 0)
		{
			cartItems.remove(restaurantId);
		}
	}

	public void updateItemInCart(Integer restaurantId, String item, Integer count)
	{
		// Check if food from the hotel already exists in the cart
		if (cartItems.containsKey(restaurantId) == false) 
		{
			return;
		}
		
		// Get food items from the hotel
		HashMap<String, Integer> itemsFromRestaurant = cartItems.get(restaurantId);
		
		// Check if the same food was previously added
		if (itemsFromRestaurant.containsKey(item)) 
		{
			itemsFromRestaurant.put(item, count);
		} 
		
		if(itemsFromRestaurant.get(item) == 0)
		{
			itemsFromRestaurant.remove(item);
		}

		// Check and update hotel entries
		if(itemsFromRestaurant.size() == 0)
		{
			cartItems.remove(restaurantId);
		}
	}
	
	public Float getTotalCartValue()
	{
		Float cartTotal = (float)0;
		for(Entry<Integer, HashMap<String, Integer>> outerEntry : cartItems.entrySet())
		{
			for(Entry<String, Integer> innerEntry : outerEntry.getValue().entrySet())
			{
				cartTotal += ((RestaurantDataStore.getInstance().restaurants.get(outerEntry.getKey()).resturantMenu.menuItems.get(innerEntry.getKey()).mealPrice) * innerEntry.getValue());
			}
		}	
		return cartTotal;
	}
	
	public HashMap<Integer, HashMap<String, Integer>> getCartItems() 
	{
		return cartItems;
	}
}
