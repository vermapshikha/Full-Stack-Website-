package Project;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;

public class MongoDBUtility 
{
	private static final MongoDBUtility instance = new MongoDBUtility();
	private DBCollection allMenus = null;
	private DBCollection allReviews = null;
	private MongoClient mongoClient = null;
	
	private MongoDBUtility()
	{		
		try
		{
			mongoClient = new MongoClient("localhost", 27017);
			
			createCollection();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void createCollection()
	{
		try
		{
			// Creating credential
			MongoCredential credential = MongoCredential.createCredential("root", "restaurantmenu", "root".toCharArray());
			
			// Accessing database
			DB database = mongoClient.getDB("restaurantmenu");
			
			boolean collectionExists = database.collectionExists("allmenus");
		    if (collectionExists == false) 
		    {
		    	database.createCollection("allmenus", null);
		    }
		    
		    collectionExists = database.collectionExists("allReviews");
		    if (collectionExists == false) 
		    {
		    	database.createCollection("allReviews", null);
		    }
						
		    allMenus = database.getCollection("allmenus");
			allReviews = database.getCollection("allReviews");
		}
		catch(Exception e)
		{
			// To-Do
		}
	}
	
	public static MongoDBUtility getInstance()
	{
        return instance;
    }
	
	public void addMenu(Menu restaurantMenu)
	{		
		BasicDBObject dbObject = new BasicDBObject();
		ArrayList<BasicDBObject> menuItemObjects = new ArrayList<BasicDBObject>();
		BasicDBObject itemObj;
		
		dbObject.append("restaurantid", restaurantMenu.RestaurantId);
		
		for (MenuItem item : restaurantMenu.menuItems.values())
		{
			itemObj = new BasicDBObject();
			itemObj.append("mealname", item.mealName);
			itemObj.append("mealtype", item.mealType.IntValue);
			itemObj.append("mealprice", item.mealPrice);
			
			menuItemObjects.add(itemObj);
		}
		
		dbObject.append("menuitems", menuItemObjects);
	
		
		allMenus.insert(dbObject);
	}
	
	public void addMeal(Menu restaurantMenu)
	{		
		BasicDBObject query = new BasicDBObject();
		query.append("restaurantid", restaurantMenu.RestaurantId);
		allMenus.remove(query);
		
		BasicDBObject dbObject = new BasicDBObject();
		ArrayList<BasicDBObject> menuItemObjects = new ArrayList<BasicDBObject>();
		BasicDBObject itemObj;
		
		dbObject.append("restaurantid", restaurantMenu.RestaurantId);
		
		for (MenuItem item : restaurantMenu.menuItems.values())
		{
			itemObj = new BasicDBObject();
			itemObj.append("mealname", item.mealName);
			itemObj.append("mealtype", item.mealType.IntValue);
			itemObj.append("mealprice", item.mealPrice);
			
			menuItemObjects.add(itemObj);
		}
		
		dbObject.append("menuitems", menuItemObjects);	
		
		allMenus.insert(dbObject);
	}
	
	public Menu getMenu(Integer restaurantId)
	{
		Menu restaurantMenu = new Menu(restaurantId);
		MenuItem item;
		
		BasicDBObject whereQuery = new BasicDBObject();
		whereQuery.put("restaurantid", restaurantId);
		
		DBCursor cursor = allMenus.find(whereQuery);
		
		while(cursor.hasNext())
		{
			BasicDBObject record = (BasicDBObject)cursor.next();
			restaurantMenu.RestaurantId = record.getInt("restaurantid");
		    
			List<BasicDBObject> menuItems = (List<BasicDBObject>)record.get("menuitems");
			
			for (BasicDBObject itemObj : menuItems)
			{
				item = new MenuItem();
				
				item.mealName = itemObj.getString("mealname");
				item.mealType = new MealType(itemObj.getInt("mealtype"));
				item.mealPrice = (float) itemObj.getDouble("mealprice");
				
				restaurantMenu.menuItems.put(item.mealName, item);
			}
		}
		
		return restaurantMenu;
	}
	
	// Product Reviews
	public void addRestaurantReview(RestaurantReview review)
	{
		BasicDBObject dbObject = new BasicDBObject();
		
		dbObject.append("restaurantid", review.id);
		dbObject.append("reviewrating", review.rating);
		dbObject.append("review", review.review);
		
		allReviews.insert(dbObject);
	}
	
	public ArrayList<RestaurantReview> getRestaurantReviews(Integer restaurantId)
	{	
		ArrayList<RestaurantReview> reviews = new ArrayList<RestaurantReview>();
		BasicDBObject whereQuery = new BasicDBObject();
		whereQuery.put("restaurantid", restaurantId);
		DBCursor cursor = allReviews.find(whereQuery);
		
		while(cursor.hasNext())
		{
			RestaurantReview review = new RestaurantReview();
			BasicDBObject record = (BasicDBObject)cursor.next();
			review.id = record.getInt("restaurantid");
			review.rating = record.getInt("reviewrating");
			review.review = record.getString("review");
			reviews.add(review);
		}
		return reviews;
	}
	
	public ArrayList<RestaurantReview> getRestaurantReviews()
	{
		ArrayList<RestaurantReview> reviews = new ArrayList<RestaurantReview>();
		DBCursor cursor = allReviews.find();
		
		while(cursor.hasNext())
		{
			RestaurantReview review = new RestaurantReview();
			BasicDBObject record = (BasicDBObject)cursor.next();
			review.id = record.getInt("restaurantid");
			review.rating = record.getInt("reviewrating");
			review.review = record.getString("review");
			reviews.add(review);
		}
		return reviews;
	}
	
	// Data Analytics
	public HashMap<Integer, Integer> GetRestaurantsReviewCount()
	{
		HashMap<Integer, Integer> restaurantReviewCountDetails = new HashMap<Integer, Integer>();
		
		DBObject groupFields = new BasicDBObject("_id", 0);
		groupFields.put("_id", "$restaurantid");
		BasicDBObject count = new BasicDBObject("$sum", 1);
		groupFields.put("count", count);
		BasicDBObject groupBy = new BasicDBObject("$group", groupFields);
		
		AggregationOutput aggregate = allReviews.aggregate(groupBy);
		
		for(DBObject result : aggregate.results())
		{
			BasicDBObject obj = (BasicDBObject)result;
			restaurantReviewCountDetails.put(obj.getInt("_id"), obj.getInt("count"));
		}
		
		return restaurantReviewCountDetails;
	}
	
	public HashMap<Integer, Integer> GetRestaurantsWithRatingGT3()
	{
		HashMap<Integer, Integer> restaurants = new HashMap<Integer, Integer>();
		BasicDBObject query = new BasicDBObject();
		query.put("reviewrating", new BasicDBObject("$gt", 3));
		DBCursor dbCursor = allReviews.find(query);
		
		while(dbCursor.hasNext())
		{
			BasicDBObject record = (BasicDBObject)dbCursor.next();
			Integer resId = record.getInt("restaurantid");
			Integer resRating = record.getInt("reviewrating");
			if(!restaurants.containsKey(resId))
			{
				restaurants.put(resId, resRating);
			}
		}
		return restaurants;
	}
}
