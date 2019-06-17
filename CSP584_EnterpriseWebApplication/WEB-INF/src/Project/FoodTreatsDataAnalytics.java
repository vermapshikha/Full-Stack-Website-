package Project;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodTreatsDataAnalytics extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{					
		HashMap<Restaurant, Integer> top5Restaurants = RestaurantDataStore.getInstance().GetTop5Restaurants();
		HashMap<Restaurant, Integer> restaurantsWithRatingGT3 = RestaurantDataStore.getInstance().GetRestaurantsWithRatingGT3();
		HashMap<Restaurant, Integer> reviewCountEachRestaurant = RestaurantDataStore.getInstance().GetRestaurantsReviewCount();
		
		request.setAttribute("Top5Restaurants", top5Restaurants);
		request.setAttribute("RestaurantsWithRatingGT3", restaurantsWithRatingGT3);
		request.setAttribute("RestaurantsReviewCount", reviewCountEachRestaurant);
		
		RequestDispatcher reqDisp = request.getRequestDispatcher("dataAnalytics.jsp");
		reqDisp.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
	}	
}
