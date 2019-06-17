package Project;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodTreatsInitialize extends HttpServlet {
	public void init() throws ServletException
	{
		UserDataStore.getInstance().Init();
		RestaurantDataStore.getInstance().Init();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{	
		RequestDispatcher reqDisp = request.getRequestDispatcher("index.jsp");
		reqDisp.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
	}	
}
