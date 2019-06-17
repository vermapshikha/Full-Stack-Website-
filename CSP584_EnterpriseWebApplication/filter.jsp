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
								<%@ page import="java.util.*"%>
								<%@ page import="Project.*"%>
								<%
									ArrayList<String> cuisines = (ArrayList<String>) request.getAttribute("Cuisines");
									if (cuisines == null || cuisines.isEmpty()) 
									{
								%>
								<h3>No restaurant currently available</h3>
								<%		
									}
									else
									{									
										for (String cuisine : cuisines) 
										{
								%>			
											<li><a href="FoodTreatsFilter?cuisine=<%=cuisine%>"><%=cuisine%></a></li>
								<%
										}
									}
								%>
							</ul>
								
						</ul>
					</div>

					<div class="7u">
						<table>
							<%@ page import="java.util.*"%>
							<%@ page import="Project.*"%>
							<%
								ArrayList<Restaurant> restaurants = (ArrayList<Restaurant>) request.getAttribute("Restaurants");
								if (restaurants.isEmpty()) 
								{
							%>
							<h3>No restaurant with the selected type</h3>
							<%		
								}
								else
								{									
									for (Restaurant res : restaurants) 
									{
										Integer resId = res.id;
										String name = res.name;
										String bio = res.bio;
										Cuisine cuisine = res.cuisineType;
										OpenDays openDays = res.daysOpen;
										String email = res.email;
										MealType mealsServed = res.mealsServed;
										String location = res.location;
										String image = "images/" + res.image;
							%>
							<tr>
								<td>
									<p>
										<span class="image left">
											<img width=150 height=150 src="<%=image %>" alt="" />
										</span>
										<a href="showRestaurant.jsp?id=<%= resId %>"><b> <%= name %></b><br /></a>
										
										Cuisine: <%= cuisine.toString() %><br />
										
										Serves: 
										<% 
											String mealString = new String((mealsServed.Breakfast)? "Breakfast" : "");
										   	mealString += (mealsServed.Lunch)? ", Lunch" : "";
										   	mealString += (mealsServed.Snack)? ", Snacks" : "";
										   	mealString += (mealsServed.Dinner)? ", Dinner" : "";
										%>
										<%= mealString %><br />
										
										Location: <%= location %><br />
										
										<%
											Calendar c = Calendar.getInstance();
											String openToday = new String();
											c.setTime(new Date());
											int todaysValue = (int)(Math.pow(2, (c.DAY_OF_WEEK - 1)));
											if(openDays.IntValue >= todaysValue)
											{
												openToday += "Open Today";
											}
											else
											{
												openToday += "Closed Today";
											}
										%>
										<%= openToday  %>
									</p>
								</td>
								<td>
									<input type="hidden" name="id" value=<%=resId%> /><br>
									<a href="orderOnline.jsp?id=<%= resId %>" class="button special fit">Order Online</a>
									<a href="reserveTable.jsp?id=<%= resId %>" class="button special fit">Reserve Table</a>
								</td>
							</tr>
							<%
									}
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