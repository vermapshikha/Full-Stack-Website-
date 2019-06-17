<%
	Boolean signedin = (Boolean)session.getAttribute("signedin");
	if(signedin == null || signedin.booleanValue() == false)
	{
		RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
		reqDisp.forward(request, response);
	}
	
	else
	{
%>

	<!DOCTYPE HTML>
	<html>
	<head>
	<title>Food Treats</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="css/main.css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="landing">
		<div id="page-wrapper">
			<section style="background-color: #000">
				<!-- Header -->
	
				<header id="header" class="alt" style="background-color: #000">
					<h1>
						<a href="FoodTreatsHome">Food Treats</a>
					</h1>
					<nav id="nav">
						<ul>
							<li><a href="FoodTreatsHome">Home</a></li>
							<li><a href="FoodTreatsSignout" class="button">Sign Out</a></li>
						</ul>
					</nav>
				</header>
	
			</section>
	
			<br />
			<!-- Banner -->
			<section>
				<!-- Main -->			
				<section class="box">
					<div class="row uniform 50%">
						<div class="2u">
						</div>
	
						<div class="7u">
							<%@ page import="java.util.*"%>
							<%@ page import="java.util.Map.Entry"%>
							<%@ page import="Project.*"%>
							<table style="width:100%">
							  <tr>
							    <td colspan="5" align="center"><h4>Cart</h4></td>							    
							  </tr>
							  <tr>
							  	<th>Name</th>
							  	<th>Restaurant</th>
							  	<th>Price</th>
							  	<th>Quantity</th>
							  	<th></th>
							  </tr>
							  <%		
							  	HashMap<Integer, HashMap<String,Integer>>cartItems = Cart.getInstance().getCartItems();
							  
							  	for(Entry<Integer, HashMap<String,Integer>> outerEntry : cartItems.entrySet())
							  	{
							  		for(Entry<String,Integer> innerEntry : outerEntry.getValue().entrySet())
								  	{
							  %>
									  <tr>
									  	<form action="FoodTreatsCartManagement" method="post">
										    <td><%=innerEntry.getKey() %></td>
										    <td><%=RestaurantDataStore.getInstance().restaurants.get(outerEntry.getKey()).name %></td>
										    <td>$<%=RestaurantDataStore.getInstance().restaurants.get(outerEntry.getKey()).resturantMenu.menuItems.get(innerEntry.getKey()).mealPrice %></td>
										    <td> 
												<input type="number" name="quantity" min="0" Value="<%=innerEntry.getValue()%>" required>
											</td>	
											<td>
												<input type="hidden" name="itemname" Value="<%=innerEntry.getKey()%>"/>
												<input type="hidden" name="resid" Value="<%=outerEntry.getKey()%>"/>
												<input type="submit" name="submitid" Value="UpdateCart"/>
											</td>	
										</form>					    
									  </tr>
							  <%
								  	}
							  	}
							  %>
							  	<tr>
							  		<td></td>
							  		<td></td>
							  		<td></td>
							  		<td>
							  			<b><h4>Total Price: </b>
							  			<%= Cart.getInstance().getTotalCartValue() %>
							  		</td>
							  		<td>
								  		<form action="usePrevious.jsp" method="post">
								  			<input type="submit" name="submitid" Value="Checkout"/>
								  		</form>
								  	</td>
							  	</tr>
							</table>
						</div>
					<br />
				</div>
			</section>
				<!-- CTA -->
	
				<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon fa-dribbble"><span
								class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon fa-google-plus"><span
								class="label">Google+</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Food Treats</li>
						<li><a href="index.jsp"> Food Treats:</a> A place where you
							will find great quality of food</li>
					</ul>
				</footer>
		</div>
	
		<!-- Scripts -->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="js/main.js"></script>
	
	</body>
	</html>
	
<%
}
%>