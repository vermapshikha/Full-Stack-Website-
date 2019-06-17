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
					<li><a href="FoodTreatsHome">Home</a></li>
				</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">
			<h2>Food Treats</h2>
			<p>A place which helps you fulfill your apetite with great
				quality of food</p>
			<ul class="actions">
				<li><a href="#" class="button special">Learn More</a></li>
			</ul>
		</section>
		<section id="main" class="container">

			<section class="box special">
				<% 
					Object loginErr = request.getAttribute("loginError");
					if ((loginErr != null) && loginErr.toString().equals("Yes"))
					{
				%>
				<h3>Error : UserID/Password Did Not Match</h3>
				<%
					}
				%>
				<header class="major">
					<h2>
						<b>Log into your Account</b>
					</h2>
					<br /> <br />
					<form action="FoodTreatsLogin" method="post">

						<div class="row uniform 50%">
							<div class="12u">
								<input type="text" name="userId" id="username" value=""
									placeholder="Enter your Email-id" />
							</div>
							<div class="12u">
								<input type="password" name="password" id="password" value=""
									placeholder="Enter your Password" />
							</div>
							<div class="12u">
								<div class="select-wrapper">
									<select name="userType" id="usertype">
										<option value="Customer">Customer</option>
										<option value="Manager">Manager</option>
									</select>
								</div>
							</div>

						</div>
						<br /> <br />
						<div class="12u">
							<input type="submit" value="Login" class="fit" />
						</div>
					</form>
					<h4>
						New User Account. <br /> <b> Sign Up <a href="register.jsp">here</a></b>
					</h4>
					<br />

				</header>

			</section>
		</section>

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