package Project;

import java.util.ArrayList;

public class Restaurant 
{
	public Integer id;
	public String name;
	public String bio;
	public String location;
	public String email;
	public Cuisine cuisineType;
	public MealType mealsServed;
	public OpenDays daysOpen;
	public Menu resturantMenu;
	public ArrayList<RestaurantReview> reviews;
	public String image;
	public Integer maximumOccupancy;
	public ArrayList<Reservations> reservations;
	
	public Restaurant()
	{
		reviews = new ArrayList<RestaurantReview>();
		reservations = new ArrayList<Reservations>();
	}	
}