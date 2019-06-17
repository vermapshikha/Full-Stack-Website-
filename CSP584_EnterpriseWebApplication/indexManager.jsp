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

		<!-- Header -->
		<header id="header" class="alt">
			<h1>
				<a href="FoodTreatsHome">Food Treats</a>
			</h1>
			<nav id="nav">
				<ul>
					<li>Welcome <%=session.getAttribute("userName").toString() %>
					</li>
					<li><a href="contactUs.jsp">Contact Us</a></li>
					<li><a href="FoodTreatsSignout" class="button">Sign Out</a></li>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">

			<h2>Food Treats</h2>
			<p>A place which helps you fulfill your apetite with great
				quality of food</p>
			<ul class="actions">

				<li><a href="aboutUs.jsp" class="button">Learn More</a></li>
			</ul>
		</section>

		<!-- Main -->
		<section id="main" class="container">

			<section class="box special">
				<header class="major">
					<div class="12u">
						<h2>Hello Restaurant Manager</h2>
					</div>
					<br /> <br /> <br />
					<h3>You can Add, Update or Delete the attributes relating to your Restaurant Property</h3>
				</header>
				<span class="image featured"><img
					src="images/main-dining-room-cream-puff-dessert-dining.jpg" alt="" /></span>
			</section>

			<section class="box special features">
				<div class="features-row" style="text-align: center">
					<section>

						<h3>
							<a href="addRestaurant.jsp">Add Restaurant</a>
						</h3>
						<p>You can add your restaurant and details that will list on the Customer Side</p>

						<h3>
							<a href="updateRestaurant.jsp">Update Restaurant</a>
						</h3>
						<p>Update the amenities of your Restaurant</p>

						<h3>
							<a href="deleteRestaurant.jsp">Delete Restaurant</a>
						</h3>
						<p>Remove the Restaurant and all the amenities relating to it</p>
						
						<h3>
							<a href="updateMenu.jsp">Update Menu</a>
						</h3>
						<p>Update the menu of your Restaurant</p>
						
						<h3>
							<a href="sendNotification.jsp">Send Notification</a>
						</h3>
						<p>Send Notification to all the subsribed users</p>
												
						<h3>
							<a href="FoodTreatsDataAnalytics">Data Analytics</a>
						</h3>
						<p>View Data Analytics</p>
						
						<h3>
							<a href="salesReport.jsp">Sales Report</a>
						</h3>
						<p>View Sales Report</p>
					</section>
					<section>
						<img src="images/ThinkstockPhotos-96401600-web.jpg" alt="" />
					</section>
				</div>
			</section>


		</section>

		<!-- CTA -->
		<br /> <br />

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
				<li><a href="indexManager.jsp"> Food Treats:</a> A place where you will find great quality of food</li>
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