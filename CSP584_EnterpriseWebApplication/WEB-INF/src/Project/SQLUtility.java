package Project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class SQLUtility 
{
	
	private Connection conn = null;
	private static final SQLUtility instance = new SQLUtility();
	
	private SQLUtility()
	{
		try
		{
			 Class.forName("com.mysql.jdbc.Driver").newInstance();
			 
			 //createDataBase();
			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdatabase","root","root");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	public static SQLUtility getInstance()
	{
        return instance;
    }
	
	
	// Order table functionalities
	public void addOrder(Order order)
	{
		try
		{
			String insertIntoCustomerRegisterQuery = "INSERT INTO projectdatabase.userorder(orderid, userid, orderdate, deliveryaddress, deliverytime, deliverytype)"
					+ "VALUES (?,?,?,?,?,?);";
			PreparedStatement statement = conn.prepareStatement(insertIntoCustomerRegisterQuery);

			statement.setInt(1,order.orderId);
			statement.setString(2,order.userId);
			statement.setString(3,order.orderDate.toString());
			statement.setString(4,order.deliveryAddress);
			statement.setString(5,order.deliveryTime.toString());
			statement.setString(6,order.deliveryType.toString());
			statement.execute();			
			
			for(OrderItem itemEntry : order.orderItems)
			{
				insertIntoCustomerRegisterQuery = "INSERT INTO projectdatabase.orderdetails(orderid, restaurantid, menuitem, quantity, price)"
						+ "VALUES (?,?,?,?,?);";
				statement = conn.prepareStatement(insertIntoCustomerRegisterQuery);
				statement.setInt(1, itemEntry.orderId);
				statement.setInt(2, itemEntry.restaurantId);
				statement.setString(3, itemEntry.menuItem);
				statement.setInt(4, itemEntry.quantity);
				statement.setFloat(5, itemEntry.price);
				statement.execute();
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
		
	public void deleteOrder(Integer orderId)
	{
		try
		{
			String deleteFromCustomerRegisterQuery = "DELETE FROM projectdatabase.orderdetails WHERE orderid = ?";
			PreparedStatement statement = conn.prepareStatement(deleteFromCustomerRegisterQuery);
			statement.setInt(1, orderId);
			statement.execute();
			
			deleteFromCustomerRegisterQuery = "DELETE FROM projectdatabase.userorder WHERE userorder.orderid = ?";
			statement = conn.prepareStatement(deleteFromCustomerRegisterQuery);
			statement.setInt(1, orderId);
			statement.execute();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void updateOrder(Order order)
	{
		try
		{	
			String deleteFromCustomerRegisterQuery = "DELETE FROM projectdatabase.orderdetails WHERE orderid = ?";
			PreparedStatement statement = conn.prepareStatement(deleteFromCustomerRegisterQuery);
			statement.setInt(1, order.orderId);
			statement.execute();
			
			for(OrderItem itemEntry : order.orderItems)
			{
				String insertIntoCustomerRegisterQuery = "INSERT INTO projectdatabase.orderdetails(orderid, restaurantid, menuitem, quantity, price)"
						+ "VALUES (?,?,?,?,?);";
				statement = conn.prepareStatement(insertIntoCustomerRegisterQuery);
				statement.setInt(1, itemEntry.orderId);
				statement.setInt(2, itemEntry.restaurantId);
				statement.setString(3, itemEntry.menuItem);
				statement.setInt(4, itemEntry.quantity);
				statement.setFloat(5, itemEntry.price);
				statement.execute();
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	// User table functionalities
	public void getUsers()
	{
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
		
		try
		{ 
			String selectOrderQuery ="SELECT * FROM projectdatabase.registration;";		
			PreparedStatement statement = conn.prepareStatement(selectOrderQuery);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next())
			{
				User newUser = new User();
				newUser.userId = resultSet.getString("userid");
				newUser.userPassword = resultSet.getString("password");
				newUser.userType = UserType.valueOf(resultSet.getString("usertype"));
				newUser.userName = resultSet.getString("name");
				
				
				String selectOrderQuery1 ="SELECT * FROM projectdatabase.userorder where userid = ? ;";
				newUser.orders = new HashMap<Integer, Order>();
				PreparedStatement statement1 = conn.prepareStatement(selectOrderQuery1);
				statement1.setString(1, newUser.userId);
				ResultSet resultSet1 = statement1.executeQuery();
				while(resultSet1.next())
				{
					Order newOrder = new Order();
					newOrder.orderId = resultSet1.getInt("orderid");
					newOrder.userId = resultSet1.getString("userid");
					newOrder.deliveryAddress = resultSet1.getString("deliveryaddress");
					try {
						newOrder.orderDate = sdf.parse(resultSet1.getString("orderdate"));
						newOrder.deliveryTime = sdf.parse(resultSet1.getString("deliverytime"));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					newOrder.deliveryType = DeliveryType.valueOf(resultSet1.getString("deliverytype"));
					
					String selectOrderQuery2 ="SELECT * FROM projectdatabase.orderdetails where orderid = ? ;";
					PreparedStatement statement2 = conn.prepareStatement(selectOrderQuery2);
					statement2.setInt(1, newOrder.orderId);
					ResultSet resultSet2 = statement2.executeQuery();
					while(resultSet2.next())
					{
						OrderItem newOrderItem = new OrderItem();
						newOrderItem.orderId = resultSet2.getInt("orderid");
						newOrderItem.restaurantId = resultSet2.getInt("restaurantid");
						newOrderItem.menuItem = resultSet2.getString("menuitem");
						newOrderItem.quantity = resultSet2.getInt("quantity");
						newOrderItem.price = resultSet2.getFloat("price");
						
					    newOrder.orderItems.add(newOrderItem);
					}
					
					newUser.orders.put(newOrder.orderId, newOrder);
				}
				
				UserDataStore.getInstance().users.put(newUser.userId, newUser);
			}

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void addUser(User user)
	{
		try
		{
			String insertIntoCustomerRegisterQuery = "INSERT INTO projectdatabase.registration(userid, name, password, usertype)"
					+ "VALUES (?,?,?,?);";
			PreparedStatement statement = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			statement.setString(1,user.userId);
			statement.setString(2,user.userName);
			statement.setString(3,user.userPassword);
			statement.setString(4,user.userType.toString());
			statement.execute();
			
			if(user.receiveNotification)
			{
				addNotificationUser(user);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	private void addNotificationUser(User user) throws SQLException {
		String insertIntoCustomerRegisterQuery;
		PreparedStatement statement;
		insertIntoCustomerRegisterQuery = "INSERT INTO projectdatabase.subscribedusers(userid)"
				+ "VALUES (?);";
		statement = conn.prepareStatement(insertIntoCustomerRegisterQuery);
		statement.setString(1,user.userId);
		statement.execute();
	}
	
	public ArrayList<String> getNotificationSubscribedUsers()
	{
		ArrayList<String> subscribedUsers = new ArrayList<String>();
		try
		{
			String selectOrderQuery ="SELECT * FROM projectdatabase.subscribedusers;";
			PreparedStatement statement = conn.prepareStatement(selectOrderQuery);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				String userEmail = resultSet.getString("userid");	
				subscribedUsers.add(userEmail);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return subscribedUsers;
	}	
	
	// Restaurant table functionalities
	public void addRestaurant(Restaurant newRestaurant)
	{
		try
		{
			String insertIntoRestaurantQuery = "INSERT INTO projectdatabase.restaurant(id, name, location, owneremail, cuisine, serves, opendays, bio, image)"
					+ "VALUES (?,?,?,?,?,b?,b?,?,?);";
			PreparedStatement statement = conn.prepareStatement(insertIntoRestaurantQuery);
			statement.setInt(1,newRestaurant.id);
			statement.setString(2,newRestaurant.name);
			statement.setString(3,newRestaurant.location);
			statement.setString(4,newRestaurant.email);
			statement.setString(5,newRestaurant.cuisineType.toString());
			statement.setString(6,Integer.toBinaryString(newRestaurant.mealsServed.IntValue));
			statement.setString(7,Integer.toBinaryString(newRestaurant.daysOpen.IntValue));
			statement.setString(8,newRestaurant.bio);
			statement.setString(9,newRestaurant.image);
			statement.execute();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void deleteRestaurant(Integer restuarantId)
	{
		try
		{
			String deleteFromRestaurantQuery = "DELETE FROM projectdatabase.restaurant WHERE id = ?;";
			PreparedStatement statement = conn.prepareStatement(deleteFromRestaurantQuery);
			statement.setInt(1,restuarantId);
			statement.execute();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void updateRestaurant(Restaurant restaurant)
	{
		try
		{
			String updateRestaurantQuery = "UPDATE projectdatabase.restaurant SET name = ?, location = ?, owneremail = ?, cuisine = ?, serves = b?, opendays = b?, bio = ? "
					+ "WHERE id = ?;";
			PreparedStatement statement = conn.prepareStatement(updateRestaurantQuery);		
			statement.setString(1,restaurant.name);
			statement.setString(2,restaurant.location);
			statement.setString(3,restaurant.email);
			statement.setString(4,restaurant.cuisineType.toString());
			statement.setString(5,Integer.toBinaryString(restaurant.mealsServed.IntValue));
			statement.setString(6,Integer.toBinaryString(restaurant.daysOpen.IntValue));
			statement.setString(7,restaurant.bio);
			statement.setInt(8,restaurant.id);
			statement.setInt(9,restaurant.maximumOccupancy);
			statement.execute();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void getRestaurants()
	{
		try
		{
			String selectOrderQuery ="SELECT * FROM projectdatabase.restaurant;";
			PreparedStatement statement = conn.prepareStatement(selectOrderQuery);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				Restaurant res = new Restaurant();
				res.id = resultSet.getInt("id");
				res.name = resultSet.getString("name");
				res.location = resultSet.getString("location");
				res.email = resultSet.getString("owneremail");
				res.cuisineType = Cuisine.valueOf(resultSet.getString("cuisine"));
				res.mealsServed = new MealType(Integer.parseInt(resultSet.getString("serves")));
				res.daysOpen = new OpenDays(Integer.parseInt(resultSet.getString("opendays")));
				res.bio = resultSet.getString("bio");
				res.image = resultSet.getString("image");
				res.maximumOccupancy = resultSet.getInt("maxoccupancy");
				res.reservations = GetReservations(res.id);
				
				RestaurantDataStore.getInstance().restaurants.put(res.id, res);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	// Data Analytics
	public HashMap<Integer, Integer> GetTop5Restaurants()
	{
		LinkedHashMap<Integer, Integer> restaurants = new LinkedHashMap<Integer, Integer>();
		try
		{ 
			String selectOrderDetailsQuery ="select restaurantid, SUM(quantity) as TotalCount from projectdatabase.orderdetails group by restaurantid order by TotalCount desc limit 5;";
			PreparedStatement statement = conn.prepareStatement(selectOrderDetailsQuery);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				Integer resId = resultSet.getInt("restaurantid");
				Integer count = resultSet.getInt("TotalCount");
				restaurants.put(resId, count);
			}
		}
		catch(SQLException e)
		{
			//
		}
		return restaurants;
	}
	
	// Sales Report
	public HashMap<Integer, Integer> GetRestaurantSales()
	{
		LinkedHashMap<Integer, Integer> restaurants = new LinkedHashMap<Integer, Integer>();
		try
		{ 
			String selectOrderDetailsQuery ="select restaurantid, SUM(quantity) as TotalCount from projectdatabase.orderdetails group by restaurantid order by TotalCount desc;";
			PreparedStatement statement = conn.prepareStatement(selectOrderDetailsQuery);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				Integer resId = resultSet.getInt("restaurantid");
				Integer count = resultSet.getInt("TotalCount");
				restaurants.put(resId, count);
			}
		}
		catch(SQLException e)
		{
			//
		}
		return restaurants;
	}	
  
	public HashMap<String, Integer> GetDailyTransactions()
	{
		HashMap<String, Integer> restaurants = new HashMap<String, Integer>();
		
		try
		{
			String selectOrderDetailsQuery = "select orderdate as TransactionDate, SUM(subQuery.ordercount) as TotalSales from "
					+"(select A.orderdate, A.orderid, B.quantity as ordercount from projectdatabase.userorder A, projectdatabase.orderdetails B where "
                    +" A.orderid = B.orderid) as subQuery group by orderdate;";
			PreparedStatement statement = conn.prepareStatement(selectOrderDetailsQuery);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				String date = resultSet.getString("TransactionDate");
				Integer totalTransaction = resultSet.getInt("TotalSales");
				restaurants.put(date, totalTransaction);
			}
		}
		catch(SQLException e)
		{
			//
		}
		return restaurants;
	}
	
	public void AddReservation(Reservations resv)
	{
		try
		{
			String insertIntoReservationQuery = "INSERT INTO projectdatabase.reservations(restaurantid, name, date, timeofday, count)"
					+ "VALUES (?,?,?,?,?);";
			PreparedStatement statement = conn.prepareStatement(insertIntoReservationQuery);
			statement.setInt(1,resv.restaurantId);
			statement.setString(2,resv.name);
			statement.setString(3,resv.reservationDate);
			statement.setString(4,resv.timeofDay);
			statement.setInt(5,resv.count);
			statement.execute();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<Reservations> GetReservations(Integer resId)
	{
		ArrayList<Reservations> resvs = new ArrayList<Reservations>();
		
		try
		{
			String selectReservationQuery ="SELECT * FROM projectdatabase.reservations WHERE restaurantid=?;";
			PreparedStatement statement = conn.prepareStatement(selectReservationQuery);
			statement.setInt(1, resId);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next())
			{
				Reservations newReservation = new Reservations();
				newReservation.restaurantId = resultSet.getInt("restaurantid");
				newReservation.name = resultSet.getString("name");
				newReservation.reservationDate = resultSet.getString("date");
				newReservation.timeofDay = resultSet.getString("timeofday");
				newReservation.count = resultSet.getInt("count");
				resvs.add(newReservation);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return resvs;
	}
	
	public boolean IsReservationPossible(Reservations resv)
	{
		boolean resvPossible = true;
		try
		{
			String selectReservationQuery ="SELECT * FROM projectdatabase.reservations WHERE restaurantid=? AND name=? AND date=? AND timeofday=?;";
			PreparedStatement statement = conn.prepareStatement(selectReservationQuery);
			statement.setInt(1, resv.restaurantId);
			statement.setString(2, resv.name);
			statement.setString(3, resv.reservationDate);
			statement.setString(4, resv.timeofDay);
			
			ResultSet resultSet = statement.executeQuery();
			if(resultSet.next())
			{
				resvPossible = false;
			}
			else
			{
				String GroupReservationQuery ="SELECT restaurantid, SUM(count) AS totalcount FROM projectdatabase.reservations WHERE restaurantid=? GROUPBY restaurantid;";
				PreparedStatement statement1 = conn.prepareStatement(GroupReservationQuery);
				statement.setInt(1, resv.restaurantId);
				ResultSet resultSet1 = statement1.executeQuery();
				if(resultSet1.next())
				{
					Integer totalCount = resultSet1.getInt("totalcount");
					
					if(RestaurantDataStore.getInstance().restaurants.get(resv.restaurantId).maximumOccupancy < (totalCount + resv.count))
					{
						resvPossible = false;
					}
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return resvPossible;
	}
	
	// checkout
	public void addcheckout(HashMap<String,CheckoutBean> hmb) 
	{
		CheckoutBean checkoutbean = new CheckoutBean();
		Set set = hmb.entrySet();
		Iterator iterator = set.iterator();
		
		while(iterator.hasNext())
		{
			Map.Entry entry = (Map.Entry)iterator.next();
			checkoutbean = (CheckoutBean)entry.getValue();
		}
		String restName=checkoutbean.name;
		String checkout1=checkoutbean.email;
		String checkout2=checkoutbean.number;
		String checkout3=checkoutbean.delivery;		
		String checkout4=checkoutbean.cardType;
		String checkout5=checkoutbean.cardNumber;
		String checkout6=checkoutbean.cardDate;
		String checkout7=checkoutbean.cardCVV;
		String checkout=checkoutbean.save;
		
		Boolean resultSet;
		try{
		String query= "INSERT INTO projectdatabase.checkout(userName,userEmail,userPhone,delivery,cardType,cardNumber,cardDate,cardCVV,save)"+
		"VALUES(?,?,?,?,?,?,?,?,?);";
		PreparedStatement statement = conn.prepareStatement(query);
		statement.setString(1, restName);
		statement.setString(2, checkout1);
		statement.setString(3, checkout2);
		statement.setString(4, checkout3);
		statement.setString(5, checkout4);
		statement.setString(6, checkout5);
		statement.setString(7, checkout6);
		statement.setString(8, checkout7);
		statement.setString(9, checkout);
		statement.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	 public int checkForExistingUser(String userEmail)
	 {
		 HashMap<String, CheckoutBean> existinguser = new HashMap<String, CheckoutBean>();
		 CheckoutBean checkoutBean = new CheckoutBean();
		 ResultSet rs;
		 int result=0;
		 try
		 {
			 
			 String query = "SELECT userEmail FROM  projectdatabase.checkout WHERE userEmail=? AND save='Yes'";
			 PreparedStatement ps = conn.prepareStatement(query);
			 ps.setString(1,userEmail);
			 rs=ps.executeQuery();
			 
			 if(!rs.next())
			 {
				 result=0;
			 }
			 else
			 {
				 result=1;
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		
		 }
		 return result;
	 }
}

