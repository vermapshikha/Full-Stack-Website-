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
					<section>
			<!-- Main -->			
			<section class="box">
				
					
					<form action="FoodTreatsCheckout" method="get">
					<div class="12u">
						<h3><b>Add Your Details</b> </h3>
								
								
								
								<h4> Name: </h4>
								<input type="text" name="name" id="restaurant" placeholder="Name" /> 
								<br /><br />
								
								

							<h4>Email:</h4>
								<input type="email" name="useremail" id="menuItem1" placeholder="Email" /> 
								<br /><br />
								<h4> Phone Number:</h4>
								<input type="text" name="phoneNumber" id="menuItem2" placeholder="Contact" /> 
								<br /><br />
								<div class="select-wrapper">
									<select name="delivery" id="delivery">
										<option value="Pickup">Restaurant Pickup</option>
										<option value="HomeDelivery">Home Delivery</option>
									</select>
								</div>
								<br/><br/>
								<h3><b>Card Details</b></h3>
								<br/>
								<p>
									Card Type: <input type="checkbox" name="cardtype" value="Visa" />Visa
									&nbsp <input type="checkbox" name="cardtype" value="master" />Master Card
									&nbsp <input type="checkbox" name="cardtype" value="foreign" />Multi Currency
									&nbsp <input type="checkbox" name="cardtype" value="Others" />Others
									
								</p>
						
								<h4>Credit Card Number:</h4>
								<input type="text" name="cardNumber" id="menuItem3" placeholder="" /> 
								<br /><br />
								<h4> Expiry (MM/YY):</h4>
								<input type="text" name="cardDate" id="menuItem4" placeholder="" /> 
								<br /><br />
								<h4> CVV:</h4>
								<input type="text" name="cardCVV" id="menuItem5" placeholder="" /> 
								<br/><br/>
								<h4> Save for Later:</h4>
								<div class="select-wrapper">
									<select name="save" id="save">
										<option value="Yes">Yes</option>
										
										<option value="No">No</option>
									</select>
				
								
				</div>
				<br /> <input type="submit" name="flag" value="PlaceOrder" />
				<br/>
								</form>
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