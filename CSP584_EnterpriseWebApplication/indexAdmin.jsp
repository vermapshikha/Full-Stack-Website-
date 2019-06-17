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
					<li><a href="#" class="icon fa-angle-down">Layouts</a>
						<ul>
							<li><a href="generic.html">Generic</a></li>
							<li><a href="contact.html">Contact</a></li>
							<li><a href="elements.html">Elements</a></li>
							<li><a href="#">Submenu</a>
								<ul>
									<li><a href="#">Option One</a></li>
									<li><a href="#">Option Two</a></li>
									<li><a href="#">Option Three</a></li>
									<li><a href="#">Option Four</a></li>
								</ul></li>
						</ul></li>
					<li><a href="index.jsp" class="button">Sign Out</a></li>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">

			<h2>Food Treats</h2>
			<p>A place which helps you fulfill your apetite with great quality of food</p>
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
					<br /> <br />
					<h2>Find the best restaurants, bars and cafes</h2>
					<br /> <br />
					<h3>Search by City</h3>
					<div class="row uniform 50%">
						<div class="9u">
							<div class="select-wrapper">
								<select name="city" id="city">
									<option value="1">Chicago</option>
									<option value="1">New York</option>
									<option value="1">Los Angeles</option>
								</select>
							</div>
						</div>

						<div class="3u 12u(mobilep)">
							<input type="submit" value="Search" class="fit" />
						</div>

					</div>
					<br />
					<h3>Search by Type of Meal</h3>
					<form method="post" action="#">
						<div class="row uniform 50%">
							<div class="9u">
								<div class="select-wrapper">
									<select name="cuisine" id="cuisine">
										<option value="1">Italian</option>
										<option value="1">Indian</option>
										<option value="1">Chinese</option>
										<option value="1">Mexican</option>
									</select>
								</div>
							</div>
							<div class="3u 12u(mobilep)">
								<input type="submit" value="Search" class="fit" />
							</div>
						</div>
					</form>
				</header>
				<span class="image featured"><img
					src="images/main-dining-room-cream-puff-dessert-dining.jpg" alt="" /></span>
			</section>

			<section class="box special features">
				<div class="features-row">
					<section>
						<img src="images/breakfast-logo-B1B7F797F8-seeklogo.png" alt="" />
						<h3>
							<a href="breakfastFilter.jsp">Breakfast</a>
						</h3>
						<p>If breakfast is done right then you enjoy your daily
							routine.Grab a delicious bite and move ahead in your day</p>
					</section>
					<section>

						<img src="images/lunch-logo.gif" alt="" />
						<h3>
							<a href="lunchFilter.jsp">Lunch</a>
						</h3>
						<p>Keep Calm and take Lunch Breaks.Order your food or get it
							delivered to your place</p>
					</section>
				</div>
				<div class="features-row">
					<section>
						<img
							src="images/dinner-icon-logo-modern-line-style-high-quality-black-outline-pictogram-web-site-design-mobile-apps-vector-83645599.jpg"
							alt="" />
						<h3>
							<a href="dinnerFilter.jsp">Dinner</a>
						</h3>
						<p>End your perfect day with fine dining. Select one of the
							varied dine outs and enjoy your evening</p>
					</section>
					<section>
						<img
							src="images/coca-coke-drink-fast-food-food-glass-hamburger-junk-food-soft--5.png"
							alt="" />
						<h3>
							<a href="snacksFilter.jsp">Snacks and Bar</a>
						</h3>
						<p>Enjoy the time with your friends with some quick bites and
							drinks.Hang out and have funi99</p>
					</section>
				</div>
			</section>


		</section>
		<section class="box special features">
			<header class="major">
				<h2>Select one of the options</h2>
				<br />
				<div style="text-align: center, width:50px, height:50px">
					<img src="images/take_out_img.png" alt="" />
				</div>
				<p>
				<h3>
					<a href="index.jsp">TAKE OUT </a>
				</h3>
				</p>
				<p>Order your food and it will be ready when you arrive at the
					restaurant for take out</p>
				<div style="text-align: center, width:50px, height:50px">
					<img src="images/91d8e64b35650f9879710ef4b838e5cd.gif" alt="" />
				</div>
				<p>
				<h3>
					<a href="index.jsp">HOME DELIVERY</a>
				</h3>
				</p>
				<p>Order your food and it will come to your address hot and
					fresh</p>
				<div style="text-align: center, width:50px, height:50px">
					<img src="images/animated_icons_2.gif" alt="" />
				</div>
				<p>
				<h3>
					<a href="index.jsp">EAT THERE </a>
				</h3>
				</p>
				<p>Order your food and it will be ready when you arrive at the
					restaurant and will be served without waiting</p>

			</header>

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