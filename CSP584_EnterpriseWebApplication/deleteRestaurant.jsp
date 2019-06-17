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
						<li><b>Welcome <%=session.getAttribute("userName").toString() %></b></li>
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
						<%
							Object restaurantUpdateMsg = request.getAttribute("RestaurantDeleteMessage");
							if (restaurantUpdateMsg != null) {
						%>
						<h3>
							Message :
							<%=restaurantUpdateMsg.toString()%></h3>
						<%
							}
						%>
				<h3>Delete Your Restaurant</h3>
					<br />
					<form action="FoodTreatsRestaurantManagement" method="post">
						<div class="4u">
							<input type="text" name="id" /><br />
							<input type="submit" name="submitid" value="Delete_Restaurant" />
						</div>
					</form>
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