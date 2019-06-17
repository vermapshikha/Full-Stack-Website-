package Project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsCartManagement extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		
		Boolean signedin = (Boolean)session.getAttribute("signedin");
		if(signedin == null || signedin.booleanValue() == false)
		{
			RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
			reqDisp.forward(request, response);
		}
		else 
		{
			String submitId = request.getParameter("submitid");
			switch (submitId) 
			{
				case "AddToCart":
					AddMealtoCart(request, response);
					break;
					
				case "UpdateCart":
					UpdateCart(request, response);
					break;
			}
		}
	}
	
	private void AddMealtoCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer restaurantid = Integer.parseInt(request.getParameter("resid"));
		String mealname = request.getParameter("itemname");
		Integer quantity =  Integer.parseInt(request.getParameter("quantity"));
		
		Cart.getInstance().addItemToCart(restaurantid, mealname, quantity);
		
		RequestDispatcher reqDisp = request.getRequestDispatcher("orderOnline.jsp");
		request.setAttribute("id", restaurantid);
		reqDisp.forward(request, response);
	}
	
	private void UpdateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer restaurantid = Integer.parseInt(request.getParameter("resid"));
		String mealname = request.getParameter("itemname");
		Integer quantity =  Integer.parseInt(request.getParameter("quantity"));
		
		Cart.getInstance().updateItemInCart(restaurantid, mealname, quantity);
		
		RequestDispatcher reqDisp = request.getRequestDispatcher("cart.jsp");
		reqDisp.forward(request, response);
	}

}
