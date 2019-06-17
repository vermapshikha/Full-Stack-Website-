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
						<ul>
							<h4>
								<u>Reviews</u>
							</h4>
							<ul class="alt">
								<li><a href="#">High to low</li>
							</ul>

						</ul>
						<ul>
							<h4>
								<u><a href="#">Recently added</a></u>
							</h4>
							<ul class="alt">
							</ul>
						</ul>
						<ul>
							<h4>
								<u>Type of the Meal</u>
							</h4>
							<ul class="alt">
								<li><a href="FoodTreatsFilter?mealtype=breakfast">Breakfast</a></li>
								<li><a href="FoodTreatsFilter?mealtype=lunch">Lunch</a></li>
								<li><a href="FoodTreatsFilter?mealtype=snack">Drinks and Snacks</a></li>
								<li><a href="FoodTreatsFilter?mealtype=dinner">Dinner</a></li>
							</ul>
						</ul>
						<ul>
							<h4>
								<u>Cuisine</u>
							</h4>
							<ul class="alt">
								<li><a href="FoodTreatsFilter?cuisine=Indian">Indian</a></li>
								<li><a href="FoodTreatsFilter?cuisine=Italian">Italian</a></li>
								<li><a href="FoodTreatsFilter?cuisine=Chinese">Chinese</a></li>
							</ul>
						</ul>
					</div>

					<div class="7u">
						<table>
							<%@ page import="java.util.*"%>
							<%@ page import="Project.*"%>
							<%
								Restaurant selectedRestaurant = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(request.getParameter("id")));
								if (selectedRestaurant == null) 
								{
							%>
									<h3>Invalid restaurant ID</h3>
							<%		
								}
								else
								{						
									
							%>
									<tr>
										<td>
											<span class="image left">
												<img width=300 height=300 src="images/<%=selectedRestaurant.image %>" alt="" />											
											</span>
										</td>
										<td style="vertical-align: top;">
											<h3><b><%=selectedRestaurant.name%></b></h3>
											<input type="hidden" name="id" value=<%=selectedRestaurant.id%> /><br>
											<a href="orderOnline.jsp?id=<%=selectedRestaurant.id%>" class="button special fit">Order Online</a>
											<a href="reserveTable.jsp?id=<%=selectedRestaurant.id%>" class="button special fit">Reserve Table</a>
											<a href="review.jsp?id=<%=selectedRestaurant.id%>" class="button special fit">Reviews</a>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											Bio: <%=selectedRestaurant.bio%>
										</td>
									</tr>
									<tr>
										<td>		
											Cuisine: <%= selectedRestaurant.cuisineType.toString() %><br />
										</td>
										<td>	
											Serves: 
											<% 
												String mealString = new String((selectedRestaurant.mealsServed.Breakfast)? "Breakfast " : "");
											   	mealString += (selectedRestaurant.mealsServed.Lunch)? "Lunch " : "";
											   	mealString += (selectedRestaurant.mealsServed.Snack)? "Snacks " : "";
											   	mealString += (selectedRestaurant.mealsServed.Dinner)? "Dinner " : "";
											%>
											<%= mealString %><br />
										</td>
									</tr>
									<tr>
										<td>
											Location: <%= selectedRestaurant.location %><br />
										</td>
										<td>
											Open on: 
											<% if(selectedRestaurant.daysOpen.Sunday) {%> <%="Sunday" %> <%} %>
											<% if(selectedRestaurant.daysOpen.Monday) {%> <%="Monday" %> <%} %>
											<% if(selectedRestaurant.daysOpen.Tuesday) {%> <%="Tuesday" %> <%} %>
											<% if(selectedRestaurant.daysOpen.Wednesday) {%> <%="Wednesday" %> <%} %>
											<% if(selectedRestaurant.daysOpen.Thursday) {%> <%="Thursday" %> <%} %>
											<% if(selectedRestaurant.daysOpen.Friday) {%> <%="Friday" %> <%} %>
											<% if(selectedRestaurant.daysOpen.Saturday) {%> <%="Saturday" %> <%} %>
										</td>
									</tr>
									<tr>
										<td>
										</td>
										<td>
											
										</td>	
									</tr>
							<%
								}
							%>
							</table>
							<table style="width:100%">
							  <tr>
							    <td colspan="3" align="center"><h4>Menu</h4></td>							    
							  </tr>
							  <tr>
							  	<th>Name</th>
							  	<th>Price</th>
							  	<th>Served For</th>
							  </tr>
							  <%		
							  	for(MenuItem item : selectedRestaurant.resturantMenu.menuItems.values())
							  	{
							  %>
								  <tr>
								    <td width="40%"><%=item.mealName %></td>
								    <td width="20%">$<%=item.mealPrice %></td>
								    <td width="40%"> 
										<% 
											String mealtype = new String((item.mealType.Breakfast)? "Breakfast " : "");
											mealtype += (item.mealType.Lunch)? "Lunch " : "";
											mealtype += (item.mealType.Snack)? "Snacks " : "";
											mealtype += (item.mealType.Dinner)? "Dinner " : "";
										%>
										<%= mealtype %>
									</td>							    
								  </tr>
							  <%
							  	}
							  %>
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