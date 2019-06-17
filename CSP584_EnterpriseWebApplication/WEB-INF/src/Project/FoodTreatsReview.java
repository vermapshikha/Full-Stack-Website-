package Project;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodTreatsReview extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		Restaurant restaurant = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(request.getParameter("restaurantid")));
		Integer rating = Integer.parseInt(request.getParameter("rating"));
		String review = request.getParameter("review");
		RestaurantReview resReview = new RestaurantReview();
		resReview.id = restaurant.id;
		resReview.rating = rating;
		resReview.review = review;
		
		RestaurantDataStore.getInstance().AddReview(resReview);
		
		request.setAttribute("id", restaurant.id);
		RequestDispatcher reqDisp = request.getRequestDispatcher("review.jsp");
		reqDisp.forward(request, response);
	}
}
