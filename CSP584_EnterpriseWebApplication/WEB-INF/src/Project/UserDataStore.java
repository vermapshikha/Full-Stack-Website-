package Project;
import java.util.HashMap;

public class UserDataStore 
{
	private static final UserDataStore instance = new UserDataStore();
	
	private SQLUtility mySqlDBUtil;
	public HashMap<String, User> users;

	private UserDataStore()
	{
		mySqlDBUtil = SQLUtility.getInstance();
		users = new HashMap<String, User>();
	}
	
	public static UserDataStore getInstance()
	{
        return instance;
    }

	public void Init()
	{	
		users.clear();
		mySqlDBUtil.getUsers();
	}

	public void AddUser(User user)
	{
		users.put(user.userId, user);
		mySqlDBUtil.addUser(user);
	}
}
