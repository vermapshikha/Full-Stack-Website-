<!DOCTYPE HTML>
<html>
	<head>
		<title>Contact Us</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1>
						<a href="FoodTreatsHome">Food Treats</a>
					</h1>	
					<nav id="nav">
						<ul>
							<li><a href="FoodTreatsHome" class="button">Home</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<section id="main" class="container 75%">
					
						<%
							Object message = request.getAttribute("Message");
						
							if(message !=null)
							{
						%>
								<h3><%= message.toString() %></h3>
						<%
							}
						%>
					
					<header>
						<h2>Reserve Table</h2>					
					</header>
					<div class="box">
						<form method="post" action="FoodTreatsReservation">
							<div class="row uniform 50%">
							<table>
								<tr>
									<td>
										Name : 
									</td>
									<td>
										<input type="text" name="name" placeholder="Enter you name" required><br/>
									</td>
								</tr>
								<tr>	
									<td>
										Table for (Max 4):
									</td>
									<td>
										<input type="number" name="count" min="1" max="4" required>
									</td>	
								</tr>
								<tr>
									<td>
										Date:
									</td>
									<td>
										<input type="date" name="date">
									</td>
								</tr>
								<tr>
									<td>
										Time of the day:
									</td>
									<td>
										<select name="time" required>
											<option value="Breakfast">Breakfast</option>
											<option value="Lunch">Lunch</option>
											<option value="Snack">Snack</option>
											<option value="Dinner">Dinner</option>
										</select>
									</div>
									</td>
								</tr>
							</table>
							</div>
							<div class="row uniform">
								<div class="12u">
									<ul class="actions align-center">
										<input type="hidden" name="restaurantid" value="<%=request.getParameter("id")%>"/>
										<li><input type="submit" value="Reserve_Table" /></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
					
					<h2>Current Reservations</h2>
					<div class="box">					
						<table>
							<tr>
								<th>Date</th>
								<th>Time of Day</th>
								<th>Count</th>
							</tr>
						<%@ page import="java.util.*"%>
						<%@ page import="Project.*"%>
						<% 
							String id = request.getParameter("id");
							if(id == null)
							{
								id = request.getAttribute("id").toString();
							}
							Restaurant selectedRestaurant = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(id));
							if (selectedRestaurant.reservations.isEmpty()) 
							{ 
						%>
								<h3>No Reservations</h3>
						<%
							}
							else
							{
								for(Reservations reservation : selectedRestaurant.reservations)
								{
						%>
								<tr>
									<td><%= reservation.reservationDate %></td>
									<td><%= reservation.timeofDay %></td>
									<td><%= reservation.count %></td>
								</tr>
						<%
								}
							}
						%>
						</table>
					</div>
				</section>

			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Food Treats</li><li><a href="index.jsp"> Food Treats:</a> A place where you will find great quality of food</li>
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