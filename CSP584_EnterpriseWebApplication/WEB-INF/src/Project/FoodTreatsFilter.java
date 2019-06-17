package Project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.*;

public class FoodTreatsFilter  extends HttpServlet implements Serializable
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{			
		String mealTypefilter = request.getParameter("mealtype");
		String locationfilter = request.getParameter("location");
		String cuisinefilter = request.getParameter("cuisine");
		
		ArrayList<Restaurant> filteredRestaurants =new ArrayList<Restaurant>();
		if(mealTypefilter != null)
		{
			filteredRestaurants = RestaurantDataStore.getInstance().GetFilteredRestaurantsOnMealType(mealTypefilter);	
		}
		if(locationfilter != null)
		{
			filteredRestaurants = RestaurantDataStore.getInstance().GetFilteredRestaurantsOnLocation(locationfilter);	
		}
		if(cuisinefilter != null)
		{
			filteredRestaurants = RestaurantDataStore.getInstance().GetFilteredRestaurantsOnCuisine(cuisinefilter);	
		}
		
		// Dynamic Filling of Locations
		ArrayList<String> cuisines = new ArrayList<String>();
		for(Restaurant res : RestaurantDataStore.getInstance().restaurants.values())
		{
			if(!cuisines.contains(res.cuisineType.toString()))
				cuisines.add(res.cuisineType.toString());
		}
		request.setAttribute("Cuisines", cuisines);	
		
		request.setAttribute("Restaurants", filteredRestaurants);
		RequestDispatcher reqDisp = request.getRequestDispatcher("filter.jsp");
		reqDisp.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
	}	
}



