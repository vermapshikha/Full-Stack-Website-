package Project;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FoodTreatsCheckout extends HttpServlet  {
	//System.out.println("Hello");
	CheckoutBean checkoutbean = new CheckoutBean();
	PrintWriter out;
	
	    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    {
			HttpSession session  = request.getSession();
			//String id = request.getParameter("id");
			String previous= request.getParameter("previous");
			String name= request.getParameter("name");
			String email=request.getParameter("useremail");
			String number= request.getParameter("phoneNumber");
			String delivery= request.getParameter("delivery");
		    String cardType= request.getParameter("cardtype");
			String cardNumber=request.getParameter("cardNumber");
			String cardDate=request.getParameter("cardDate");
			String cardCVV= request.getParameter("cardCVV");
			String save=request.getParameter("save");
			
			//newuserbean.setID(id);
			checkoutbean.previous = previous;
			checkoutbean.name = name;
			checkoutbean.email = email;
			checkoutbean.number = number;
			checkoutbean.delivery = delivery;
			checkoutbean.cardType = cardType;
			checkoutbean.cardNumber = cardNumber;
			checkoutbean.cardDate = cardDate;
			checkoutbean.cardCVV = cardCVV;
			checkoutbean.save = save;
			
	    }
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
			HttpSession session = request.getSession();	
			out = response.getWriter();
			HashMap<String,CheckoutBean> hmb = new HashMap<String,CheckoutBean>();
			
			String flag= request.getParameter("flag");
			if(flag.equals("Submit")){
				usePrevious(request,response);
			}
			else if(flag.equals("PlaceOrder")){
				processRequest(request,response);
				hmb.put(checkoutbean.email, checkoutbean);
				SQLUtility.getInstance().addcheckout(hmb);
				System.out.println("Hello");
				response.sendRedirect("submitted.jsp");
				
				Order newOrder =  new Order();
				
				Random random = new Random();
				newOrder.orderId = Math.abs(random.nextInt());
				newOrder.orderDate = new Date();
				newOrder.userId = (String)session.getAttribute("userId");
				newOrder.deliveryAddress = "2901 S king Dr";
				newOrder.deliveryType = DeliveryType.HomeDelivery;
				Calendar c = Calendar.getInstance();
				c.setTime(new Date());
				c.add(Calendar.DATE, 14);	
				newOrder.deliveryTime=c.getTime();
				
				HashMap<Integer, HashMap<String,Integer>>cartItems = Cart.getInstance().getCartItems();
				  
			  	for(Entry<Integer, HashMap<String,Integer>> outerEntry : cartItems.entrySet())
			  	{
			  		for(Entry<String,Integer> innerEntry : outerEntry.getValue().entrySet())
				  	{
			  			OrderItem newItem =  new OrderItem();
			  			
			  			newItem.orderId = newOrder.orderId;
			  			newItem.restaurantId = outerEntry.getKey();
			  			newItem.menuItem = innerEntry.getKey();
			  			newItem.quantity = innerEntry.getValue();
			  			newItem.price = (RestaurantDataStore.getInstance().restaurants.get(outerEntry.getKey()).resturantMenu.menuItems.get(innerEntry.getKey()).mealPrice) * newItem.quantity;
			  			
			  			newOrder.orderItems.add(newItem);
				  	}
			  	}
				
				SQLUtility.getInstance().addOrder(newOrder);
			}
		}	 

		protected void usePrevious(HttpServletRequest request, HttpServletResponse response) throws IOException{
				 String previous= request.getParameter("previous");
					String name= request.getParameter("name");
					String email=request.getParameter("useremail");
					
					checkoutbean.previous = previous;
					checkoutbean.name = name;
					checkoutbean.email = email;
					
				 HashMap<String,CheckoutBean> hmb = new HashMap<String,CheckoutBean>();
				 hmb.put(checkoutbean.email, checkoutbean);
				 hmb.put(checkoutbean.previous, checkoutbean);
				 
				 if(checkoutbean.previous.equals("Yes"))
				 {					 
					 int existingUser = SQLUtility.getInstance().checkForExistingUser(checkoutbean.email);
					 if(existingUser==1)
						{
						 response.sendRedirect("orderplaced.jsp");
						 }
					 else{
						 response.sendRedirect("checkout.jsp");
					 }
					 
				 }
				 else{
					 response.sendRedirect("checkout.jsp");
				 }
			 }						
			
			}

	


