package Project;
public class OpenDays 
{
	public Integer IntValue;
	
	public Boolean Sunday;
	public Boolean Monday;
	public Boolean Tuesday;
	public Boolean Wednesday;
	public Boolean Thursday;
	public Boolean Friday;
	public Boolean Saturday;
	
	public OpenDays()
	{
		IntValue = new Integer(0);
		
		Sunday =  new Boolean(false);
		Monday =  new Boolean(false);
		Tuesday =  new Boolean(false);
		Wednesday =  new Boolean(false);
		Thursday =  new Boolean(false);
		Friday =  new Boolean(false);
		Saturday =  new Boolean(false);
	}
	
	public OpenDays(Integer daysOpen)
	{
		IntValue = daysOpen;
		
		Sunday = ((daysOpen & 0x1) >= 1)? true : false;
		Monday = ((daysOpen & 0x2) >= 1)? true : false;
		Tuesday = ((daysOpen & 0x4) >= 1)? true : false;
		Wednesday = ((daysOpen & 0x8) >= 1)? true : false;
		Thursday = ((daysOpen & 0x10) >= 1)? true : false;
		Friday = ((daysOpen & 0x20) >= 1)? true : false;
		Saturday = ((daysOpen & 0x40) >= 1)? true : false;
	}
}
