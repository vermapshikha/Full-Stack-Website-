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
					<li><a href="login.jsp" class="button">Sign In</a></li>
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
					Object regErr = request.getAttribute("registrationError");
					if ((regErr != null) && regErr.toString().equals("Yes"))
					{
				%>		
						<h3>Error : User Already Exists </h3> 
				<%
					}
				%>
				<header class="major">
					<h2>
						<b>Sign up for an Account</b>
					</h2>
					<br /> <br />
					<form id="signup" action="FoodTreatsRegister" method="post">

						<div class="row uniform 50%">
							<div class="12u">
								<input type="text" name="name" id="name" value=""
									placeholder="Enter your Name" />
							</div>
							<div class="12u">
								<input type="text" name="userId" id="userid" value=""
									placeholder="Enter your Email-id" />
							</div>
							<div class="12u">
								<input type="password" name="password" id="password"
									data-validation="strength" data-validation-strength="2"
									data-validation="length" data-validation-length="min8"
									placeholder="Enter your Password" />
							</div>
							<div class="12u">

								<div class="12u">
									<div class="select-wrapper">
										<select name="userType" id="usertype">
											<option value="Customer">Customer</option>
											<option value="Manager">Manager</option>
										</select>
									</div>
								</div>
								<br /> <br />
								<div class="12u">
									<input type="submit" value="Register" class="fit" />
								</div>
							</div>
							<div class="12u">
								<input type="checkbox" name="notification" value="true"> &nbsp Receive occasional offers
							</div>
						  <br />
						</div>
					</form>
				</header>

			</section>
		</section>
			<script>
				$.validate({
					form : '#signup, #login'/*,
						modules : 'security' ,
						  onModulesLoaded : function() {
						    var optionalConfig = {
						      fontSize: '12pt',
						      padding: '4px',
						      bad : 'Very bad',
						      weak : 'Weak',
						      good : 'Good',
						      strong : 'Strong'
						    };

						    $('input[name="password"]').displayPasswordStrength(optionalConfig);
						  } */
				});
			</script>

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