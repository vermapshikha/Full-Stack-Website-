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
						<li><b>Welcome <%=session.getAttribute("userName").toString()%></b></li>
						<li><a href="contactUs.jsp">Contact Us</a></li>
						<li><a href="FoodTreatsSignout" class="button">Sign Out</a></li>
					</ul>
				</nav>
			</header>

		</section>

		<br />
		<!-- Banner -->
		<section>
			<!-- Main -->
			<table>
				<tr>
					<br />
					<td>
						<%
							Object restaurantUpdateMsg = request.getAttribute("MenuMessage");
							if (restaurantUpdateMsg != null) {
						%>
						<h3>
							Message :
							<%=restaurantUpdateMsg.toString()%></h3> <%
							}
						%>
						<form action="FoodTreatsRestaurantManagement" method="post">
							<h3>Update Menu</h3>
							<table>
								<tr>
									<td><input type="text" name="id" placeholder="Restaurant Id" /></td>
									<td><input type="submit" name="submitid" value="Show_Menu" /></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
				<tr>
					<td>
						<h3>Add Menu Item</h3> 
						<form action="FoodTreatsRestaurantManagement" method="post">
							<input type="text" name="id" placeholder="Restaurant Id" /><br/>
							<input type="text" name="mealname" placeholder="Mean Name" /><br />
							<input type="text" name="mealprice" placeholder="Meal Price" /><br />
							<p>
								Meal Type : 
								&nbsp<input type="checkbox" name="mealtype" value="1">Breakfast
								&nbsp <input type="checkbox" name="mealtype" value="2">Lunch
								&nbsp <input type="checkbox" name="mealtype" value="4">Snack
								&nbsp <input type="checkbox" name="mealtype" value="8">Dinner
							</p>							
							<input type="submit" name="submitid" value="Add_Meal" />
						</form>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<div class="7u">
						<!-- Menu Items -->
						<table>
							<tr>
								<th>Name</th>
								<th>Price</th>
								<th>Served for</th>
								<th></th>
							</tr>
							<%@ page import="java.util.*"%>
							<%@ page import="Project.*"%>
							<%
								Menu menu = (Menu) request.getAttribute("Menu");
								if (menu == null || menu.menuItems.isEmpty()) 
								{
							%>
							<h3>No menu items to display</h3>
							<%		
								}
								else
								{
									Collection<MenuItem> items = menu.menuItems.values();
									Integer resId = menu.RestaurantId;
									
									for (MenuItem item : items) 
									{
										String name = item.mealName;
										Float price = item.mealPrice;
							%>
										<tr>
											<td><%=name%></td>
											<td><%=price%></td>
											<td>
												<% 
														String mealtype = new String((item.mealType.Breakfast)? "Breakfast " : "");
														mealtype += (item.mealType.Lunch)? "Lunch " : "";
														mealtype += (item.mealType.Snack)? "Snacks " : "";
														mealtype += (item.mealType.Dinner)? "Dinner " : "";
												%>
												<%= mealtype %>
											</td>
											<td>
												<form action="FoodTreatsRestaurantManagement" method="post">								
													<input type="hidden" name="id" value=<%=resId%> />	
													<input type="hidden" name="mealname" Value="<%=name%>"/>									
													<input type="submit" name="submitid" value="Delete_Meal" />
												</form>
											</td>
										</tr>
							<%
									}
								}
							%>
						</table>
					  </div>
					</td>
				</tr>
			</table>
		</section>

		<!-- CTA -->

		<!-- Footer -->
		<footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
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
				<li><a href="indexManager.jsp"> Food Treats:</a> A place where
					you will find great quality of food</li>
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