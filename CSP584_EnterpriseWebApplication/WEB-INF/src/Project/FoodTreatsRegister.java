package Project;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodTreatsRegister extends HttpServlet {
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher reqDisp = request.getRequestDispatcher("register.jsp");
		reqDisp.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		User newUser = new User();
		newUser.userName = request.getParameter("name");
		newUser.userId = request.getParameter("userId");
		newUser.userPassword = request.getParameter("password");
		newUser.userType = UserType.valueOf(request.getParameter("userType"));		
		newUser.receiveNotification = request.getParameter("notification") != null;
		
		if(UserDataStore.getInstance().users.containsKey(newUser.userId) == false)
		{
			UserDataStore.getInstance().AddUser(newUser);
			RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
			reqDisp.forward(request, response);
		}
		else
		{
			request.setAttribute("registrationError", "Yes");
			RequestDispatcher reqDisp = request.getRequestDispatcher("register.jsp");
			reqDisp.forward(request, response);			
		}
		
	}

}
