package Project;
import java.util.*;

public class Order {
	public Integer orderId;
	public String userId;
	public String deliveryAddress;
	public Date orderDate;
	public Date deliveryTime;
	public DeliveryType deliveryType;
	public List<OrderItem> orderItems;

	public Order() {
		orderItems = new ArrayList<OrderItem>();
	}
}
