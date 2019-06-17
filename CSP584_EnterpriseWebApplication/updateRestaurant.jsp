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
			<section class="box">
				<div class="row uniform 50%">
					<div class="2u">
						<ul>
							<ul class="alt">
								<li><a href="FoodTreatsHome">Home</a></li>
							</ul>
						</ul>
					</div>
					<div>
						<%
							Object restaurantUpdateMsg = request.getAttribute("RestaurantUpdateMessage");
							if (restaurantUpdateMsg != null) {
						%>
						<h3>
							Message :
							<%=restaurantUpdateMsg.toString()%></h3>
						<%
							}
						%>
						<form action="FoodTreatsRestaurantManagement" method="post">
							<div class="12u">
								<h3>Update Your Restaurant</h3><br /> 
								<input type="text" name="id" id="id" placeholder="ID" /><br /> 
								<input type="text" name="restaurant" id="restaurant" placeholder="Name of your Restaurant" /> <br /> 
								<input type="text" name="location" id="location" placeholder="Location" /> <br /> 

								<p>
									Cuisine <input type="radio" name="cuisine" value="Italian"
										checked>Italian &nbsp <input type="radio"
										name="cuisine" value="Indian">Indian &nbsp <input
										type="radio" name="cuisine" value="Chinese">Chinese
									&nbsp
								</p>

								<p>
									Meal Type <input type="checkbox" name="serves" value="1">Breakfast
									&nbsp <input type="checkbox" name="serves" value="2">Lunch
									&nbsp <input type="checkbox" name="serves" value="4">Snack
									&nbsp <input type="checkbox" name="serves" value="8">Dinner
								</p>
								<p>
									Open Days <input type="checkbox" name="opendays" value="1" />Monday
									&nbsp <input type="checkbox" name="opendays" value="2" />Tuesday
									&nbsp <input type="checkbox" name="opendays" value="4" />Wednesday
									&nbsp <input type="checkbox" name="opendays" value="8" />Thursday
									&nbsp <input type="checkbox" name="opendays" value="16" />Friday
									&nbsp <input type="checkbox" name="opendays" value="32" />Saturday
									&nbsp <input type="checkbox" name="opendays" value="64" />Sunday
									&nbsp
								</p>
								<textarea name="description" id="description" placeholder="About Restaurant" cols="12" rows="6"></textarea>
								<br /> <input type="submit" name="submitid" value="Update_Restaurant" />
							</div>
						</form>
					</div>
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
					<li><a href="indexManager.jsp"> Food Treats:</a> A place where
						you will find great quality of food</li>
				</ul>
			</footer>
		</section>
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