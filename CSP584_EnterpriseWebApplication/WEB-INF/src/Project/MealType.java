package Project;
public class MealType 
{
	public Integer IntValue;
	public Boolean Breakfast;
	public Boolean Lunch;
	public Boolean Snack;
	public Boolean Dinner;
	
	public MealType()
	{
		IntValue = new Integer(0);
		Breakfast =  new Boolean(false);
		Lunch =  new Boolean(false);
		Snack =  new Boolean(false);
		Dinner =  new Boolean(false);
	}
	
	public MealType(Integer mealType)
	{
		IntValue = mealType;
		
		Breakfast = new Boolean(((mealType & 0x1) >= 1)? true : false);
		Lunch = new Boolean(((mealType & 0x2) >= 1)? true : false);
		Snack = new Boolean(((mealType & 0x4) >= 1)? true : false);
		Dinner = new Boolean(((mealType & 0x8) >= 1)? true : false);
	}
}
