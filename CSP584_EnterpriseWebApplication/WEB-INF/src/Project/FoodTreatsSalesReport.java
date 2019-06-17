package Project;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class FoodTreatsSalesReport extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		String submitId = request.getParameter("report");
		RequestDispatcher reqDisp;
		switch (submitId) 
		{
		case "option1": 
			HashMap<Restaurant, Integer> restaurantSales1 = RestaurantDataStore.getInstance().GetRestaurantSales();
			response.setContentType("text/html");
			request.setAttribute("RestaurantSales", restaurantSales1);
			reqDisp = request.getRequestDispatcher("salesReport.jsp");			
			reqDisp.forward(request, response);
			break; 
		case "option2": 
			HashMap<Restaurant, Integer> restaurantSales = RestaurantDataStore.getInstance().GetRestaurantSales();
			HashMap<String, Integer> sales = new HashMap<String, Integer>();
			for(Map.Entry<Restaurant, Integer> entry : restaurantSales.entrySet())
			{
				sales.put(entry.getKey().name, entry.getValue());
			}
			response.setContentType("application/JSON");
			response.setCharacterEncoding("UTF-8");
			String restaurantSalesJson = new Gson().toJson(sales);
			request.setAttribute("RestaurantSalesJson", restaurantSalesJson);
			reqDisp = request.getRequestDispatcher("salesReportChart.jsp");			
			reqDisp.forward(request, response);
			break;
		case "option3": 
			HashMap<String, Integer> restaurantTransactions = RestaurantDataStore.getInstance().GetDailyTransactions();
			response.setContentType("text/html");
			request.setAttribute("DailyTransactions", restaurantTransactions);
			reqDisp = request.getRequestDispatcher("salesReport.jsp");
			reqDisp.forward(request, response);
			break;
		}
	}
}
