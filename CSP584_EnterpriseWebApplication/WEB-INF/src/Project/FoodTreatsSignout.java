package Project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsSignout extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();

		session.setAttribute("signedin", Boolean.FALSE);
		session.setAttribute("userName", null);
		session.setAttribute("userId", null);
		session.setAttribute("usertype", null);
		Cart.getInstance().getCartItems().clear();
		
		RequestDispatcher reqDisp = request.getRequestDispatcher("index.jsp");
		reqDisp.forward(request, response);
	}

}
