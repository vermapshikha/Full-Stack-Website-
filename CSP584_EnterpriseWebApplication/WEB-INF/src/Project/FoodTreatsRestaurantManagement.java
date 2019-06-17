package Project;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsRestaurantManagement extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		String submitId = request.getParameter("submitid");
		switch (submitId) 
		{
		case "Add_Restaurant":
			AddRestaurant(request, response);
			break;
		case "Delete_Restaurant":
			DeleteRestaurant(request, response);
			break;
		case "Update_Restaurant":
			UpdateRestaurant(request, response);
			break;
		case "Show_Menu":
			ShowMenu(request, response);
			break;
		case "Add_Meal":
			AddMeal(request, response);
			break;
		case "Delete_Meal":
			DeleteMeal(request, response);
			break;
		case "Send_Notification":
			SendNotification(request, response);
			break;
		}
	}

	private void AddRestaurant(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{
			Restaurant restaurant = new Restaurant();
			restaurant.id = Integer.parseInt(request.getParameter("id"));
			restaurant.name = request.getParameter("restaurant");
			restaurant.location  = request.getParameter("location");
			restaurant.email = request.getParameter("email");
			restaurant.cuisineType = Cuisine.valueOf(request.getParameter("cuisine"));
			restaurant.bio = request.getParameter("description");
			restaurant.image = request.getParameter("image");
			restaurant.maximumOccupancy = Integer.parseInt(request.getParameter("count"));

			String[] servesString = request.getParameterValues("serves");
			Integer availableMeals = 0;
			for (int index = 0; index < servesString.length; index++) 
			{
				availableMeals = availableMeals | Integer.parseInt(servesString[index]);
			}
			
			restaurant.mealsServed = new MealType(availableMeals);

			String[] opendaysString = request.getParameterValues("opendays");
			Integer daysopen = 0;
			for (int index = 0; index < opendaysString.length; index++) 
			{
				daysopen = daysopen | Integer.parseInt(opendaysString[index]);
			}
			
			restaurant.daysOpen = new OpenDays(daysopen);
			restaurant.resturantMenu =  new Menu(restaurant.id);

			if (RestaurantDataStore.getInstance().restaurants.containsKey(restaurant.id)) 
			{
				request.setAttribute("RestaurantAddMessage", "Restaurant Already Exists");
			} 
			else 
			{
				RestaurantDataStore.getInstance().AddRestaurant(restaurant);				
				request.setAttribute("RestaurantAddMessage", "Restaurant Added Successfully");
			}
			
			RequestDispatcher reqDisp = request.getRequestDispatcher("addRestaurant.jsp");

			reqDisp.forward(request, response);
		} 
		catch (NumberFormatException e) 
		{
			// To-Do
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	private void DeleteRestaurant(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{
			String restaurantId = request.getParameter("id");			
			if (RestaurantDataStore.getInstance().restaurants.containsKey(Integer.parseInt(restaurantId))==false) 
			{
				request.setAttribute("RestaurantDeleteMessage", "Restaurant Does not exist");
			} 
			else 
			{
				Restaurant res = RestaurantDataStore.getInstance().restaurants.get(restaurantId);
				HttpSession session = request.getSession();
				Object username = session.getAttribute("userId");
				
				if(username != null && !res.email.equals(username.toString()))
				{
					request.setAttribute("RestaurantDeleteMessage", "Restaurant is not owned by you");
				}
				else
				{
					RestaurantDataStore.getInstance().DeleteRestaurant(Integer.parseInt(restaurantId));
					request.setAttribute("RestaurantDeleteMessage", "Restaurant Deleted Successfully");
				}
			}
			
			request.setAttribute("Restaurants", RestaurantDataStore.getInstance().restaurants);
			RequestDispatcher reqDisp = request.getRequestDispatcher("deleteRestaurant.jsp");
			reqDisp.forward(request, response);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	private void UpdateRestaurant(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{
			Restaurant restaurant = new Restaurant();
			restaurant.id = Integer.parseInt(request.getParameter("id"));
			restaurant.name = request.getParameter("restaurant");
			restaurant.location  = request.getParameter("location");
			restaurant.cuisineType = Cuisine.valueOf(request.getParameter("cuisine"));
			restaurant.bio = request.getParameter("description");

			String[] servesString = request.getParameterValues("serves");
			Integer availableMeals = 0;
			for (int index = 0; index < servesString.length; index++) 
			{
				availableMeals = availableMeals | Integer.parseInt(servesString[index]);
			}
			
			restaurant.mealsServed = new MealType(availableMeals);

			String[] opendaysString = request.getParameterValues("opendays");
			Integer daysopen = 0;
			for (int index = 0; index < opendaysString.length; index++) 
			{
				daysopen = daysopen | Integer.parseInt(opendaysString[index]);
			}
			
			restaurant.daysOpen = new OpenDays(daysopen);
			restaurant.resturantMenu =  new Menu(restaurant.id);
			restaurant.resturantMenu.RestaurantId = restaurant.id;

			if (RestaurantDataStore.getInstance().restaurants.containsKey(restaurant.id) == false) 
			{
				request.setAttribute("RestaurantUpdateMessage", "Restaurant Does not exist");
			} 
			else 
			{
				Restaurant res = RestaurantDataStore.getInstance().restaurants.get(restaurant.id);
				HttpSession session = request.getSession();
				Object username = session.getAttribute("userId");
				
				if(username != null && !res.email.equals(username.toString()))
				{
					request.setAttribute("RestaurantDeleteMessage", "Restaurant is not owned by you");
				}
				else
				{
					RestaurantDataStore.getInstance().UpdateRestaurant(restaurant);				
					request.setAttribute("RestaurantUpdateMessage", "Restaurant Updated Successfully");
				}
			}
			
			RequestDispatcher reqDisp = request.getRequestDispatcher("updateRestaurant.jsp");

			reqDisp.forward(request, response);
		} 
		catch (NumberFormatException e) 
		{
			// To-Do
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	private void ShowMenu(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{			
			String restaurantId = request.getParameter("id");			
			if (restaurantId !=null && RestaurantDataStore.getInstance().restaurants.containsKey(Integer.parseInt(restaurantId))==false) 
			{
				request.setAttribute("MenuMessage", "Restaurant Does not exist");
			} 
			else 
			{
				Restaurant res = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(restaurantId));
				HttpSession session = request.getSession();
				Object username = session.getAttribute("userId");
				
				if(username != null && !res.email.equals(username.toString()))
				{
					request.setAttribute("MenuMessage", "Cannot update menu - Restaurant is not owned by you");
				}
				else
				{
					request.setAttribute("Menu", res.resturantMenu);
				}
			}
			
			request.setAttribute("Restaurants", RestaurantDataStore.getInstance().restaurants);
			RequestDispatcher reqDisp = request.getRequestDispatcher("updateMenu.jsp");
			reqDisp.forward(request, response);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	private void AddMeal(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{			
			String restaurantId = request.getParameter("id");			
			if (restaurantId !=null && RestaurantDataStore.getInstance().restaurants.containsKey(Integer.parseInt(restaurantId))==false) 
			{
				request.setAttribute("MenuMessage", "Restaurant Does not exist");
			} 
			else 
			{
				Restaurant res = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(restaurantId));
				HttpSession session = request.getSession();
				Object username = session.getAttribute("userId");
				
				if(username != null && !res.email.equals(username.toString()))
				{
					request.setAttribute("MenuMessage", "Cannot update menu - Restaurant is not owned by you");
				}
				else
				{
					MenuItem item = new MenuItem();
					item.mealName = request.getParameter("mealname");
					item.mealPrice = Float.parseFloat(request.getParameter("mealprice"));	
					String[] mealtype = request.getParameterValues("mealtype");
					Integer availablefor = 0;
					for (int index = 0; index < mealtype.length; index++) 
					{
						availablefor = availablefor | Integer.parseInt(mealtype[index]);
					}					
					item.mealType = new MealType(availablefor);
					
					if(res.resturantMenu.menuItems.containsKey(item.mealName) == false)
					{
						request.setAttribute("MenuMessage", "Menu item added successfully");
						RestaurantDataStore.getInstance().AddMeal(Integer.parseInt(restaurantId), item);
					}
					else
					{
						request.setAttribute("MenuMessage", "Menu item with same already exists");
					}
					
					request.setAttribute("Menu", RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(restaurantId)).resturantMenu);
				}
			}
			
			request.setAttribute("Restaurants", RestaurantDataStore.getInstance().restaurants);
			RequestDispatcher reqDisp = request.getRequestDispatcher("updateMenu.jsp");
			reqDisp.forward(request, response);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	private void DeleteMeal(HttpServletRequest request, HttpServletResponse response) 
	{
		try 
		{			
			String restaurantId = request.getParameter("id");			
			if (restaurantId !=null && RestaurantDataStore.getInstance().restaurants.containsKey(Integer.parseInt(restaurantId))==false) 
			{
				request.setAttribute("MenuMessage", "Restaurant Does not exist");
			} 
			else 
			{
				Restaurant res = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(restaurantId));
				HttpSession session = request.getSession();
				Object username = session.getAttribute("userId");
				
				if(username != null && !res.email.equals(username.toString()))
				{
					request.setAttribute("MenuMessage", "Cannot update menu - Restaurant is not owned by you");
				}
				else
				{
					String mealName = request.getParameter("mealname");
					if(res.resturantMenu.menuItems.containsKey(mealName))
					{
						RestaurantDataStore.getInstance().DeleteMeal(Integer.parseInt(restaurantId), mealName);
						request.setAttribute("MenuMessage", "Menu item deleted successfully");
					}
					else
					{
						request.setAttribute("MenuMessage", "Menu item with the name does not exists");
					}
					
					request.setAttribute("Menu", RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(restaurantId)).resturantMenu);
				}
			}
			
			request.setAttribute("Restaurants", RestaurantDataStore.getInstance().restaurants);
			RequestDispatcher reqDisp = request.getRequestDispatcher("updateMenu.jsp");
			reqDisp.forward(request, response);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	private void SendNotification(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// https://myaccount.google.com/lesssecureapps
		
		final String usernamefrom = "promotions.foodtreat@gmail.com";
		final String password = "foodtreat";
		
		ArrayList<String> users = SQLUtility.getInstance().getNotificationSubscribedUsers();		
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() 
			{
				protected PasswordAuthentication getPasswordAuthentication() 
				{
					return new PasswordAuthentication(usernamefrom, password);
				}
			});

		try 
		{
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(usernamefrom));
			
			for(int i = 0; i < users.size(); i++)
			{
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(users.get(i)));
			}
			
			message.setSubject(request.getParameter("subject"));
			message.setText(request.getParameter("notification"));

			Transport.send(message);
			
			RequestDispatcher reqDisp = request.getRequestDispatcher("sendNotification.jsp");
			reqDisp.forward(request, response);
		} 
		catch (MessagingException e) 
		{
			throw new RuntimeException(e);
		}
	} 
}
