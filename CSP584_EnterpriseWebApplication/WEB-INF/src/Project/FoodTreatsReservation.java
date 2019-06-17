package Project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsReservation extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id = request.getParameter("restaurantid");
		
		Restaurant restaurant = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(request.getParameter("restaurantid")));
		Reservations reservation = new Reservations();
		reservation.restaurantId = restaurant.id;
		reservation.name = request.getParameter("name");
		reservation.count = Integer.parseInt(request.getParameter("count"));
		reservation.reservationDate = request.getParameter("date");
		reservation.timeofDay = request.getParameter("time");
		Integer currentReservationCount = 0;
		boolean alreadyExists = false;		
		
		if(SQLUtility.getInstance().IsReservationPossible(reservation))
		{
			RestaurantDataStore.getInstance().AddReservation(reservation);
		}
		else
		{
			request.setAttribute("Message", "Reservation already exists or not possible");
		}
		
		request.setAttribute("id", restaurant.id);
		RequestDispatcher reqDisp = request.getRequestDispatcher("reserveTable.jsp");
		reqDisp.forward(request, response);
	}

}
