package Project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class RestaurantDataStore {
	private static final RestaurantDataStore instance = new RestaurantDataStore();

	private SQLUtility mySqlDBUtil;
	private MongoDBUtility myMongoDBUtil;
	public HashMap<Integer, Restaurant> restaurants;

	private RestaurantDataStore() {
		mySqlDBUtil = SQLUtility.getInstance();
		myMongoDBUtil = MongoDBUtility.getInstance();
		restaurants = new HashMap<Integer, Restaurant>();
	}

	public static RestaurantDataStore getInstance() {
		return instance;
	}

	public void Init() {
		restaurants.clear();
		mySqlDBUtil.getRestaurants();
		for (Map.Entry<Integer, Restaurant> entry : restaurants.entrySet()) {
			Restaurant res = entry.getValue();
			res.resturantMenu = myMongoDBUtil.getMenu(res.id);
			res.reviews = myMongoDBUtil.getRestaurantReviews(res.id);
		}
	}

	public void AddRestaurant(Restaurant newRestaurant) {
		restaurants.put(newRestaurant.id, newRestaurant);
		mySqlDBUtil.addRestaurant(newRestaurant);
	}

	public void DeleteRestaurant(Integer restaurantId) {
		restaurants.remove(restaurantId);
		mySqlDBUtil.deleteRestaurant(restaurantId);
	}

	public void UpdateRestaurant(Restaurant restaurant) {
		restaurants.put(restaurant.id, restaurant);
		mySqlDBUtil.updateRestaurant(restaurant);
	}

	public void AddMeal(Integer restaurantId, MenuItem meal) {
		Restaurant targetRestaurant = restaurants.get(restaurantId);
		targetRestaurant.resturantMenu.menuItems.put(meal.mealName, meal);
		myMongoDBUtil.addMeal(targetRestaurant.resturantMenu);
	}

	public void DeleteMeal(Integer restaurantId, String item) {
		Restaurant targetRestaurant = restaurants.get(restaurantId);
		targetRestaurant.resturantMenu.menuItems.remove(item);
	}

	// Filtering
	public ArrayList<Restaurant> GetFilteredRestaurantsOnMealType(String mealType) {
		ArrayList<Restaurant> filteredRestaurant = new ArrayList<Restaurant>();
		for (Restaurant res : restaurants.values()) {
			switch (mealType) {
			case "breakfast":
				if (res.mealsServed.Breakfast) {
					filteredRestaurant.add(res);
				}
				break;
			case "lunch":
				if (res.mealsServed.Lunch) {
					filteredRestaurant.add(res);
				}
				break;
			case "snack":
				if (res.mealsServed.Snack) {
					filteredRestaurant.add(res);
				}
				break;
			case "dinner":
				if (res.mealsServed.Dinner) {
					filteredRestaurant.add(res);
				}
				break;
			}
		}
		return filteredRestaurant;
	}
	
	public ArrayList<Restaurant> GetFilteredRestaurantsOnLocation(String location) {
		ArrayList<Restaurant> filteredRestaurant = new ArrayList<Restaurant>();
		for (Restaurant res : restaurants.values()) {
			if (res.location.equals(location)) {
				filteredRestaurant.add(res);
			}
		}
		return filteredRestaurant;
	}
	
	public ArrayList<Restaurant> GetFilteredRestaurantsOnCuisine(String cuisine) {
		ArrayList<Restaurant> filteredRestaurant = new ArrayList<Restaurant>();
		for (Restaurant res : restaurants.values()) {
			if (res.cuisineType.equals(Cuisine.valueOf(cuisine))) {
				filteredRestaurant.add(res);
			}
		}
		return filteredRestaurant;
	}
	
	// Review
	public void AddRestaurantReview(RestaurantReview review) {
		restaurants.get(review.id).reviews.add(review);
		myMongoDBUtil.addRestaurantReview(review);
	}
	
	// Data Analytics
	public HashMap<Restaurant, Integer> GetTop5Restaurants()
	{
		HashMap<Restaurant, Integer> rests = new HashMap<Restaurant, Integer>();
		HashMap<Integer, Integer> resIds = mySqlDBUtil.GetTop5Restaurants();
		for(Map.Entry<Integer, Integer> entry : resIds.entrySet())
		{
			rests.put(restaurants.get(entry.getKey()), entry.getValue());
		}
		return rests;
	}
	
	public HashMap<Restaurant, Integer> GetRestaurantsWithRatingGT3()
	{
		HashMap<Restaurant, Integer> rests = new HashMap<Restaurant, Integer>();
		HashMap<Integer, Integer> resIds = myMongoDBUtil.GetRestaurantsWithRatingGT3();
		for(Map.Entry<Integer, Integer> entry : resIds.entrySet())
		{
			rests.put(restaurants.get(entry.getKey()), entry.getValue());
		}
		return rests;
	}
	
	public HashMap<Restaurant, Integer> GetRestaurantsReviewCount()
	{
		HashMap<Restaurant, Integer> resReviewCount = new HashMap<Restaurant, Integer>();
		HashMap<Integer, Integer> resIds = myMongoDBUtil.GetRestaurantsReviewCount();
		for(Map.Entry<Integer, Integer> entry : resIds.entrySet())
		{
			resReviewCount.put(restaurants.get(entry.getKey()), entry.getValue());
		}
		return resReviewCount;
		
		/*for(Restaurant res : restaurants.values())
		{
			resReviewCount.put(restaurants.get(res.id), res.reviews.size());
		}
		return resReviewCount;*/
	}
	
	// Sales Report
	public HashMap<Restaurant, Integer> GetRestaurantSales()
	{
		HashMap<Restaurant, Integer> res = new HashMap<Restaurant, Integer>();
		HashMap<Integer, Integer> resIds = mySqlDBUtil.GetRestaurantSales();
		for(Map.Entry<Integer, Integer> entry : resIds.entrySet())
		{
			res.put(restaurants.get(entry.getKey()), entry.getValue());
		}
		return res;
	}	
  
	public HashMap<String, Integer> GetDailyTransactions()
	{
		return mySqlDBUtil.GetDailyTransactions();
	}
	
	// Review
	public void AddReview(RestaurantReview review)
	{
		restaurants.get(review.id).reviews.add(review);
		myMongoDBUtil.addRestaurantReview(review);
	}
	
	// Reservation
	public void AddReservation(Reservations reserv)
	{
		restaurants.get(reserv.restaurantId).reservations.add(reserv);
		mySqlDBUtil.AddReservation(reserv);
	}
}
