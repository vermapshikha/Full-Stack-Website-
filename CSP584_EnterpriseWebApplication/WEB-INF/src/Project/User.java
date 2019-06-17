package Project;
import java.util.HashMap;

public class User implements java.io.Serializable {
	public String userId;
	public String userName;
	public String userPassword;
	public UserType userType;
	public HashMap<Integer, Order> orders;
	public boolean receiveNotification;

	public User() {
		orders = new HashMap<Integer, Order>();
	}
}
