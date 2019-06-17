package Project;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsLogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
		reqDisp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("password");
		UserType userType = UserType.valueOf(request.getParameter("userType"));
		
		if(UserDataStore.getInstance().users.containsKey(userId) == false)
		{
			request.setAttribute("loginError", "Yes");
			RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
			reqDisp.forward(request, response);
		}
		else
		{
			User loginUser = UserDataStore.getInstance().users.get(userId);
			
			if(userPassword.equals(loginUser.userPassword) && userType.equals(loginUser.userType))
			{
				RequestDispatcher reqDisp = null;
				HttpSession session = request.getSession();
				session.setAttribute("signedin", Boolean.TRUE);
				session.setAttribute("userName", loginUser.userName);
				session.setAttribute("userId", loginUser.userId);
				session.setAttribute("usertype", userType);
				
				switch(userType)
				{
					case Customer: reqDisp = request.getRequestDispatcher("indexCustomer.jsp");
						break;
					case Manager: reqDisp = request.getRequestDispatcher("indexManager.jsp");
						break;
				}
				
				reqDisp.forward(request, response);
			}
			else
			{
				request.setAttribute("loginError", "Yes");
				RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
				reqDisp.forward(request, response);
			}
		}
	}

}
