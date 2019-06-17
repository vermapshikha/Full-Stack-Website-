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
					<header>
						<h2>Write Review</h2>					
					</header>
					<div class="box">
						<form method="post" action="FoodTreatsReview">
							<div class="row uniform 50%">
								<p>
								Rating : 
								&nbsp<input type="radio" name="rating" value="1" selected>1 Star
								&nbsp <input type="radio" name="rating" value="2">2 Star
								&nbsp <input type="radio" name="rating" value="3">3 Star
								&nbsp <input type="radio" name="rating" value="4">4 Star
								&nbsp <input type="radio" name="rating" value="5">5 Star
							</p>
							</div>
							<div class="row uniform 50%">
								<div class="12u">
									<textarea name="review" placeholder="Review..." rows="3" required></textarea>
								</div>
							</div>
							<div class="row uniform">
								<div class="12u">
									<ul class="actions align-center">
										<input type="hidden" name="restaurantid" value=<%=request.getParameter("id")%> />
										<li><input type="submit" value="Submit_Review" /></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
					<h2>View Reviews</h2>
					<div class="box">					
						<table>
							<tr>
								<th>Rating</th>
								<th>Review</th>
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
							if (selectedRestaurant.reviews.isEmpty()) 
							{ 
						%>
								<h2>No Review Available</h2>
						<%
							}
							else
							{
								for(RestaurantReview review : selectedRestaurant.reviews)
								{
						%>
								<tr>
									<td><%= review.rating %></td>
									<td><%= review.review %></td>
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