package Project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsHome extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String forwardTo = "index.jsp";
		
		Boolean signedin = (Boolean)session.getAttribute("signedin");
		if(signedin == null || signedin.booleanValue() == false)
		{
			forwardTo = "index.jsp";
		}
		else
		{
			if (signedin.booleanValue() == true)
			{
				UserType usertype = (UserType) session.getAttribute("usertype");
				
				if(usertype == UserType.Customer)
				{
					forwardTo = "indexCustomer.jsp";
				}
				else if (usertype == UserType.Manager)
				{
					forwardTo = "indexManager.jsp";
				}
				else
				{
					forwardTo = "index.jsp";
				}
			}
		}
		
		RequestDispatcher reqDisp = request.getRequestDispatcher(forwardTo);
		reqDisp.forward(request, response);
	}

}
